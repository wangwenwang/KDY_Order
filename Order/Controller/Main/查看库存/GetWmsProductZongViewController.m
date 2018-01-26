//
//  GetWmsProductZongViewController.m
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetWmsProductZongViewController.h"
#import "GetWmsProductSumViewController.h"
#import "GetWmsProductZongTableViewCell.h"
#import "GetWmsProductZongService.h"
#import "UITableView+NoDataPrompt.h"
#import <MBProgressHUD.h>
#import "AppDelegate.h"
#import <MJRefresh.h>
#import "Tools.h"

@interface GetWmsProductZongViewController ()<GetWmsProductZongServiceDelegate>

@property (strong, nonatomic) GetWmsProductZongService *service;

@property (assign, nonatomic) int page;

@property (strong, nonatomic) AppDelegate *app;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

// TableView数据
@property (strong, nonatomic) NSMutableArray *orders;

@end

#define kPageCount 20

#define kCellHeight 107

#define kCellName @"GetWmsProductZongTableViewCell"

// 温馨提示
#define kPrompt @"您还没有产品库存哦"

@implementation GetWmsProductZongViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _service = [[GetWmsProductZongService alloc] init];
        _service.delegate = self;
        _orders = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self registerCell];
    
    // 下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataDown)];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
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
        [_service GetWmsProductZong:_app.business.BUSINESS_CODE andProductNo:@"" andstrPage:_page andstrPageCount:kPageCount];
    } else {
        
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}


- (void)loadMoreDataDown {
    
    if([Tools isConnectionAvailable]) {
        
        _page = 1;
        [_service GetWmsProductZong:_app.business.BUSINESS_CODE andProductNo:@"" andstrPage:_page andstrPageCount:kPageCount];
    } else {
        
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _orders.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CheckStockItemModel *m = _orders[indexPath.row];
    return m.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    GetWmsProductZongTableViewCell *cell = (GetWmsProductZongTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    CheckStockItemModel *m = _orders[indexPath.row];
    
    cell.checkStockItemM = m;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CheckStockItemModel *m = _orders[indexPath.row];
    GetWmsProductSumViewController *vc = [[GetWmsProductSumViewController alloc] init];
    vc.checkStockItemM = m;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - GetWmsProductZongServiceDelegate

- (void)successOfGetWmsProductZong:(CheckStockListModel *)checkStockListM {
    
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    
    // 页数处理
    if(_page == 1) {
        
        _orders = [checkStockListM.checkStockItemModel mutableCopy];
        
        // 添加没订单提示
        if(_orders.count == 0) {
            
            [_tableView noData:@"您还没有正在进行的订单" andImageName:LM_NoResult_noResult];
        } else {
            
            [_tableView removeNoOrderPrompt];
        }
    } else {
        
        for(int i = 0; i < checkStockListM.checkStockItemModel.count; i++) {
            
            CheckStockItemModel *stockItem = checkStockListM.checkStockItemModel[i];
            [_orders addObject:stockItem];
        }
    }
    _tableView.mj_footer.hidden = NO;
    
    CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:MAXFLOAT];
    CGFloat mulLine = 0;
    for (CheckStockItemModel *m in _orders) {
        
        mulLine = [Tools getHeightOfString:m.descr fontSize:14 andWidth:(ScreenWidth - 2 - 12 - 71.5 + 7 - 25 - 10 - 2)];
        mulLine = mulLine ? mulLine : oneLine;
        m.cellHeight = kCellHeight + (mulLine - oneLine);
    }
    [_tableView removeNoOrderPrompt];
    [_tableView reloadData];
}


- (void)successOfGetWmsProductZong_NoData {
    
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


- (void)failureOfGetWmsProductZong:(NSString *)msg {
    
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取信息失败"];
    if(_page == 1) {
        
        [_tableView noData:kPrompt andImageName:LM_NoResult_noOrder];
    }
    [_tableView reloadData];
}

@end
