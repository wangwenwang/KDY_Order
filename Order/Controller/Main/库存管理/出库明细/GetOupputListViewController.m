//
//  GetOupputListViewController.m
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetOupputListViewController.h"
#import "Store_GetOupputListService.h"
#import "GetOupputListModel.h"
#import "GetOupputListTableViewCell.h"
#import <MBProgressHUD.h>
#import "UITableView+NoDataPrompt.h"
#import "Tools.h"
#import "GetOupputInfoViewController.h"
#import <MJRefresh.h>
#import "AppDelegate.h"

@interface GetOupputListViewController ()<Store_GetOupputListServiceDelegate>

@property (strong, nonatomic) NSArray *menuTexts;


// 出库列表
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// 网络层
@property (strong, nonatomic) Store_GetOupputListService *service;

// 出库
@property (strong, nonatomic) GetOupputListModel *getOupputListM;

@property (strong, nonatomic) AppDelegate *app;

@end

#define kCellHeight 103

#define kCellName @"GetOupputListTableViewCell"

@implementation GetOupputListViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[Store_GetOupputListService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"出库明细";
    
    // 注册Cell
    [self registerCell];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_service GetOupputList:_addressM.IDX andstrPage:1 andstrPageCount:9999 andBUSINESS_IDX:_app.business.BUSINESS_IDX];
    
    // 下拉刷新
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataDown)];
    header.lastUpdatedTimeLabel.hidden = YES;
    _tableView.mj_header = header;
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if(_refreshList) {
        
        [_tableView.mj_header beginRefreshingWithCompletionBlock:nil];
    }
}


- (void)loadMoreDataDown {
    
    if([Tools isConnectionAvailable]) {
        
        [_service GetOupputList:_addressM.IDX andstrPage:1 andstrPageCount:9999 andBUSINESS_IDX:_app.business.BUSINESS_IDX];
    } else {
        
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
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
    
    return _getOupputListM.getOupputModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GetOupputModel *getOupputM = _getOupputListM.getOupputModel[indexPath.row];
    
    return getOupputM.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    GetOupputListTableViewCell *cell = (GetOupputListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
     GetOupputModel *getOupputM = _getOupputListM.getOupputModel[indexPath.row];
    
    cell.getOupputM = getOupputM;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GetOupputModel *m = _getOupputListM.getOupputModel[indexPath.row];
    
    GetOupputInfoViewController *vc = [[GetOupputInfoViewController alloc] init];
    vc.oupputM = m;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - Store_GetOupputListServiceDelegate

- (void)successOfGetOupputList:(GetOupputListModel *)getOupputListM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView.mj_header endRefreshing];
    _refreshList = NO;
    
    _getOupputListM = getOupputListM;
    
    for (GetOupputModel *m in _getOupputListM.getOupputModel) {
        
        // 单行高度
        CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:13 andWidth:ScreenWidth];
        
        CGFloat PARTY_NAME_height = [Tools getHeightOfString:m.pARTYNAME fontSize:13 andWidth:(ScreenWidth - 8 - 61 - 3)];
        
        CGFloat oneCellHeight = 0;
        if(PARTY_NAME_height > oneLine) {
            
            oneCellHeight = kCellHeight + PARTY_NAME_height - oneLine;
        } else {
            
            oneCellHeight = kCellHeight;
        }
        
        m.cellHeight = oneCellHeight;
    }
    
    [_tableView removeNoOrderPrompt];
    
    [_tableView reloadData];
}


- (void)successOfGetOupputList_NoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView.mj_header endRefreshing];
    
    [_tableView noData:@"您还没有出库明细" andImageName:LM_NoResult_noOrder];
}


- (void)failureOfGetOupputList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView.mj_header endRefreshing];
    
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取出库列表失败"];
}

@end
