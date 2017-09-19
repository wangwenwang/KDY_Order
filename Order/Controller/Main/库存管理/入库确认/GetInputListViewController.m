//
//  GetInputListViewController.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetInputListViewController.h"
#import "Stock_GetInputListService.h"
#import "AppDelegate.h"
#import "GetInputListTableViewCell.h"
#import <MBProgressHUD.h>
#import "UITableView+NoDataPrompt.h"
#import "Tools.h"
#import "GetInputInfoViewController.h"

@interface GetInputListViewController ()<GetInputListServiceDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Stock_GetInputListService *service;

@property (strong, nonatomic) AppDelegate *app;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) InputListModel *inputListM;

@end


#define kCellHeight 60

#define kCellName @"GetInputListTableViewCell"

@implementation GetInputListViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[Stock_GetInputListService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self registerCell];
    
    [_service GetInputList:_addressM.IDX andstrPage:1 andstrPageCount:999];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 功能函数

// 注册Cell
- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _inputListM.inputModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    GetInputListTableViewCell *cell = (GetInputListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    InputModel *m = _inputListM.inputModel[indexPath.row];
    
    cell.inputM = m;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InputModel *m = _inputListM.inputModel[indexPath.row];
    
    GetInputInfoViewController *vc = [[GetInputInfoViewController alloc] init];
    vc.outputIdx = m.iDX;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - GetInputListServiceDelegate

- (void)successOfGetInputList:(InputListModel *)inputListM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _inputListM = inputListM;
    
    [_tableView removeNoOrderPrompt];
    
    [_tableView reloadData];
}


- (void)successOfGetInputList_NoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [_tableView noData:@"没有数据" andImageName:LM_NoResult_noOrder];
}


- (void)failureOfGetInputList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取库存批次失败"];
}

@end
