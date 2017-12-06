//
//  MonthlyPlanViewController.m
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "MonthlyPlanViewController.h"
#import "CustomerListViewController.h"
#import "UITableView+NoDataPrompt.h"
#import "AppDelegate.h"
#import "GetOrderPlanListService.h"
#import <MJRefresh.h>
#import "MonthlyPlanTableViewCell.h"
#import "Tools.h"
#import "MonthlyPlanInfoViewController.h"

@interface MonthlyPlanViewController ()<GetOrderPlanListServiceDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) AppDelegate *app;

@property (strong, nonatomic) GetOrderPlanListService *service;

@property (strong, nonatomic) MonthlyPlanListModel *monthlyPlanListM;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *orders;
@property (assign, nonatomic) BOOL isReloadTableView;
@property (assign, nonatomic) int page;

@end

#define kPageCount 20

#define kCellHeight 85

#define kCellName @"MonthlyPlanTableViewCell"

// 温馨提示
#define kPrompt @"您还没有订单哦"

@implementation MonthlyPlanViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[GetOrderPlanListService alloc] init];
        _service.delegate = self;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _orders = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"月计划列表";
    
    [self registerCell];
    
    // 下拉刷新
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataDown)];
    header.lastUpdatedTimeLabel.hidden = YES;
    _tableView.mj_header = header;
    
    // 上拉分页加载
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataUp)];
    _tableView.mj_footer.hidden = YES;
    
    [_tableView.mj_header beginRefreshing];
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


- (void)loadMoreDataUp {
    
    if([Tools isConnectionAvailable]) {
        
        _page ++;
        [_service GetOrderPlanList:_app.business.BUSINESS_IDX andstrUserId:_app.user.IDX andstrPartyType:@"" andstrPartyId:@"" andstrState:@"" andstrPage:_page andstrPageCount:kPageCount];
    } else {
        
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}


- (void)loadMoreDataDown {
    
    if([Tools isConnectionAvailable]) {
        
        _page = 1;
        [_service GetOrderPlanList:_app.business.BUSINESS_IDX andstrUserId:_app.user.IDX andstrPartyType:@"" andstrPartyId:@"" andstrState:@"" andstrPage:_page andstrPageCount:kPageCount];
    } else {
        
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}


#pragma mark - 事件

- (IBAction)addOnclick {
    
    CustomerListViewController *vc = [[CustomerListViewController alloc] init];
    vc.vcClass = NSStringFromClass([self class]);
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _orders.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return kCellHeight;
//    MonthlyPlanModel *m = _monthlyPlanListM.monthlyPlanModel[indexPath.row];
//    return m.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    MonthlyPlanTableViewCell *cell = (MonthlyPlanTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    MonthlyPlanModel *m = _orders[indexPath.row];
    
    cell.monthlyPlanM = m;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MonthlyPlanModel *m = _orders[indexPath.row];

    MonthlyPlanInfoViewController *vc = [[MonthlyPlanInfoViewController alloc] init];
    vc.orderId = m.iDX;

    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - GetOrderPlanListServiceDelegate

- (void)successOfGetOrderPlanList:(MonthlyPlanListModel *)monthlyPlanListM {
    
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    _isReloadTableView = NO;
    
    for (int i = 0; i < monthlyPlanListM.monthlyPlanModel.count; i++) {
        
        MonthlyPlanModel *m = monthlyPlanListM.monthlyPlanModel[i];
        // 收货地址换行
        CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:15 andWidth:MAXFLOAT];
        CGFloat mulLine = [Tools getHeightOfString:m.tONAME fontSize:15 andWidth:(ScreenWidth - 8 - 69.5 - 3)];
        m.cellHeight = kCellHeight + (mulLine - oneLine);
    }
    
    // 页数处理
    if(_page == 1) {
        
        _orders = [monthlyPlanListM.monthlyPlanModel mutableCopy];
        
        if(monthlyPlanListM.monthlyPlanModel.count == 0) {
            
            [_tableView noData:@"您还没有订单哦" andImageName:LM_NoResult_noResult];
        } else {
            
            [_tableView removeNoOrderPrompt];
        }
    } else {
        for(int i = 0; i < monthlyPlanListM.monthlyPlanModel.count; i++) {
            
            MonthlyPlanModel *order = monthlyPlanListM.monthlyPlanModel[i];
            [_orders addObject:order];
        }
    }
    _tableView.mj_footer.hidden = NO;
    [_tableView reloadData];
}


- (void)successOfGetOrderPlanList_NoData {
    
    [_tableView.mj_header endRefreshing];
    
    if(_page == 1) { // 没有数据
        
        [_orders removeAllObjects];
        _tableView.mj_footer.hidden = YES;
        [_tableView noData:kPrompt andImageName:LM_NoResult_noOrder];
    } else {  // 已加载完毕
        
        [_tableView.mj_footer endRefreshingWithNoMoreData];
        [_tableView removeNoOrderPrompt];
        [_tableView.mj_footer setCount_NoMoreData:_orders.count];
    }
    [_tableView reloadData];
}


- (void)failureOfGetOrderPlanList:(NSString *)msg {
    
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
}

@end
