//
//  CARTotalOrderViewController.m
//  Order
//
//  Created by wenwang wang on 2019/1/9.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CARTotalOrderViewController.h"
#import "ChartService.h"
#import "CARTotalOrderTableViewCell.h"
#import "AppDelegate.h"
#import "CARTotalOrderListModel.h"
#import <MBProgressHUD.h>
#import "Tools.h"

@interface CARTotalOrderViewController ()<ChartServiceDelegate>

@property ChartService *service;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) AppDelegate *app;

@property (strong, nonatomic) CARTotalOrderListModel *CARTotalOrderListM;

@end

#define kCellName @"CARTotalOrderTableViewCell"

@implementation CARTotalOrderViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[ChartService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"订单汇总报表";
    
    [self registerCell];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_service TotalOrderStatement:_app.user.IDX];
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
    
    return _CARTotalOrderListM.cARTotalOrderItemModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 125;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CARTotalOrderItemModel *m = _CARTotalOrderListM.cARTotalOrderItemModel[indexPath.row];
    
    // 处理界面
    static NSString *cellId = kCellName;
    CARTotalOrderTableViewCell *cell = (CARTotalOrderTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.CARTotalOrderItemM = m;
    
    return cell;
}


#pragma mark - ChartServiceDelegate

- (void)successOfCARTotalOrderList:(CARTotalOrderListModel *)CARTotalOrderListM {

    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    _CARTotalOrderListM = CARTotalOrderListM;
    [_tableView reloadData];
}

- (void)failureOfChartService:(NSString *)msg {
    
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
