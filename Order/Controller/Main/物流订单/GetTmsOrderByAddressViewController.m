//
//  GetTmsOrderByAddressViewController.m
//  Order
//
//  Created by 凯东源 on 2018/1/3.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetTmsOrderByAddressViewController.h"
#import "TransportInformationViewController.h"
#import "GetTmsOrderByAddressTableViewCell.h"
#import "GetTmsOrderByAddressService.h"
#import "CustomerListViewController.h"
#import "UITableView+NoDataPrompt.h"
#import "GetOrderTmsService.h"
#import <MBProgressHUD.h>
#import "AppDelegate.h"
#import <MJRefresh.h>
#import "Tools.h"

@interface GetTmsOrderByAddressViewController ()<GetTmsOrderByAddressServiceDelegate, UITableViewDataSource, UITableViewDelegate, GetOrderTmsServiceDelegate>

@property (strong, nonatomic) AppDelegate *app;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (assign, nonatomic) int page;

@property (strong, nonatomic) GetTmsOrderByAddressService *service;

@property (strong, nonatomic) TmsOrderItemModel *tmsOrderItemM;

@property (copy, nonatomic) NSString *partyAddressId;

// TableView数据
@property (strong, nonatomic) NSMutableArray *orders;

@end

#define kPageCount 20

#define kCellHeight 192

#define kCellName @"GetTmsOrderByAddressTableViewCell"

// 温馨提示
#define kPrompt @"您还没有物流订单哦"

@implementation GetTmsOrderByAddressViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _orders = [[NSMutableArray alloc] init];
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _service = [[GetTmsOrderByAddressService alloc] init];
        _service.delegate = self;
        _partyAddressId = @"";
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"查询物流";
    
    [self addNotification];
    
    [self registerCell];
    
    // 下拉刷新
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataDown)];
    header.lastUpdatedTimeLabel.hidden = YES;
    _tableView.mj_header = header;
    
    // 上拉分页加载
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataUp)];
    _tableView.mj_footer.hidden = YES;
    
    [_tableView.mj_header beginRefreshing];
    
    [Tools addNavRightItemTypeText:self andAction:@selector(rightNavOnclick) andTitle:@"筛选"];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
    [self removeNotification];
}


#pragma mark - 通知

- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestNetWork:) name:kGetTmsOrderByAddressViewController_refreshList object:nil];
}

- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kGetTmsOrderByAddressViewController_refreshList object:nil];
}

- (void)requestNetWork:(NSNotification *)aNotify {
    
    [Tools addNavRightItemTypeText:self andAction:@selector(rightNavOnclick) andTitle:@"已筛选"];
    
    NSString *msg = aNotify.userInfo[@"msg"];
    
    _partyAddressId = msg;
    
    [_tableView.mj_header beginRefreshing];
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
        [_service GetTmsOrderByAddress:_app.business.BUSINESS_IDX andUserIdx:_app.user.IDX andPartyAdressId:_partyAddressId andPage:_page andPagesize:kPageCount];
    } else {
        
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}


- (void)loadMoreDataDown {
    
    if([Tools isConnectionAvailable]) {
        
        _page = 1;
        [_service GetTmsOrderByAddress:_app.business.BUSINESS_IDX andUserIdx:_app.user.IDX andPartyAdressId:_partyAddressId andPage:_page andPagesize:kPageCount];
    } else {
        
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}

- (void)rightNavOnclick {
    
    CustomerListViewController *vc = [[CustomerListViewController alloc] init];
    vc.title = @"选择客户";
    vc.vcClass = NSStringFromClass([self class]);
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _orders.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    GetTmsOrderByAddressTableViewCell *cell = (GetTmsOrderByAddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    TmsOrderItemModel *m = _orders[indexPath.row];
    
    cell.tmsOrderItemM = m;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TmsOrderItemModel *m = _orders[indexPath.row];
    _tmsOrderItemM = m;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    GetOrderTmsService *getOrderTmsService= [[GetOrderTmsService alloc] init];
    getOrderTmsService.delegate = self;
    [getOrderTmsService GetOrderTms:m.iDX];
}


#pragma mark - GetTmsOrderByAddressServiceDelegate

- (void)successOfGetTmsOrderByAddress:(TmsOrderListModel *)tmsOrderListM {
    
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    
    // 页数处理
    if(_page == 1) {
        
        _orders = [tmsOrderListM.tmsOrderItemModel mutableCopy];
        
        // 添加没订单提示
        if(tmsOrderListM.tmsOrderItemModel.count == 0) {
            
            [_tableView noData:kPrompt andImageName:LM_NoResult_noResult];
        } else {
            
            [_tableView removeNoOrderPrompt];
        }
    } else {
        
        for(int i = 0; i < tmsOrderListM.tmsOrderItemModel.count; i++) {
            
            TmsOrderItemModel *tmsOrderItemM = tmsOrderListM.tmsOrderItemModel[i];
            [_orders addObject:tmsOrderItemM];
        }
    }
    
    // 是否隐藏上拉
    if(_orders.count > 19) {
        
        _tableView.mj_footer.hidden = NO;
    } else {
        
        _tableView.mj_footer.hidden = YES;
    }
    
    [_tableView reloadData];
}

- (void)successOfGetTmsOrderByAddress_NoData {
    
    [_tableView.mj_header endRefreshing];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
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

- (void)failureOfGetTmsOrderByAddress:(NSString *)msg {
    
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    //tableView上拉无更多数据时会进入这个回调
    if(_page == 1) {
        
        [_tableView noData:kPrompt andImageName:LM_NoResult_noOrder];
    }
}


#pragma mark - GetOrderTmsServiceDelegate

- (void)successOfGetOrderTms:(OrderTmsModel *)product {
    
    product.ORD_TO_NAME = _tmsOrderItemM.oRDTONAME;
    product.ORD_TO_ADDRESS = _tmsOrderItemM.oRDTOADDRESS;
    product.ORD_QTY = [_tmsOrderItemM.oRDQTY floatValue];
    product.ORD_WEIGHT = _tmsOrderItemM.oRDWEIGHT;
    product.ORD_VOLUME = _tmsOrderItemM.oRDVOLUME;
    product.TMS_QTY = [_tmsOrderItemM.tMSQTY floatValue];
    product.TMS_WEIGHT = _tmsOrderItemM.tMSWEIGHT;
    product.TMS_VOLUME = _tmsOrderItemM.tMSVOLUME;
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    TransportInformationViewController *vc = [[TransportInformationViewController alloc] init];
    vc.tmsInformtions = product;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)failureOfGetOrderTms:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取信息失败"];
}

@end
