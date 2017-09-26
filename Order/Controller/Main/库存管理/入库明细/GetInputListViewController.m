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
#import <MBProgressHUD.h>
#import "UITableView+NoDataPrompt.h"
#import "Tools.h"
#import "GetInputListTableViewCell.h"
#import "GetInputInfoViewController.h"
#import <MJRefresh.h>

@interface GetInputListViewController ()<GetInputListServiceDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Stock_GetInputListService *service;

@property (strong, nonatomic) AppDelegate *app;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) InputListModel *inputListM;

@end


#define kCellHeight 125

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
    
    self.title = @"入库明细";
    
    [self registerCell];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [_service GetInputList:_addressM.IDX andstrPage:1 andstrPageCount:9999 andBUSINESS_IDX:_app.business.BUSINESS_IDX];
    
    // 下拉刷新
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataDown)];
    header.lastUpdatedTimeLabel.hidden = YES;
    _tableView.mj_header = header;
}


- (void)loadMoreDataDown {
    
    if([Tools isConnectionAvailable]) {
        
        [_service GetInputList:_addressM.IDX andstrPage:1 andstrPageCount:9999 andBUSINESS_IDX:_app.business.BUSINESS_IDX];
    } else {
        
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if(_refreshList) {
        
        [_tableView.mj_header beginRefreshingWithCompletionBlock:nil];
    }
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
    
    InputModel *m = _inputListM.inputModel[indexPath.row];
    return m.cellHeight;
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
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    InputModel *m = _inputListM.inputModel[indexPath.row];
    
    GetInputInfoViewController *vc = [[GetInputInfoViewController alloc] init];
    vc.inputM = m;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - GetInputListServiceDelegate

- (void)successOfGetInputList:(InputListModel *)inputListM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView.mj_header endRefreshing];
    _refreshList = NO;
    
    _inputListM = inputListM;
    
    for (InputModel *m in _inputListM.inputModel) {
        
        // 单行高度
        CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:13 andWidth:ScreenWidth];
        
        CGFloat SUPPLIER_NAME_height = [Tools getHeightOfString:m.sUPPLIERNAME fontSize:13 andWidth:(ScreenWidth - 8 - 48 - 3)];
        
        CGFloat oneCellHeight = 0;
        if(SUPPLIER_NAME_height > oneLine) {
            
            oneCellHeight = kCellHeight + SUPPLIER_NAME_height - oneLine;
        } else {
            
            oneCellHeight = kCellHeight;
        }
        
        m.cellHeight = oneCellHeight;
    }
    
    [_tableView removeNoOrderPrompt];
    
    [_tableView reloadData];
}


- (void)successOfGetInputList_NoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView.mj_header endRefreshing];
    
    [_tableView noData:@"您还没有入库明细" andImageName:LM_NoResult_noOrder];
}


- (void)failureOfGetInputList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView.mj_header endRefreshing];
    
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取入库列表失败"];
}

@end
