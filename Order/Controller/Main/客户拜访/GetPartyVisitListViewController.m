//
//  GetPartyVisitListViewController.m
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitListViewController.h"
#import "GetPartyVisitListService.h"
#import "AddPartyVisitViewController.h"
#import "UITableView+NoDataPrompt.h"
#import "GetPartyVisitListTableViewCell.h"
#import <MBProgressHUD.h>
#import "AppDelegate.h"
#import <MJRefresh.h>
#import "Tools.h"
#import "GetPartyVisitListSearchResultsViewController.h"
#import "CustomerListViewController.h"
#import "GetPartyVisitLineService.h"
#import "LM_alert.h"
#import "AddPartyViewController.h"
#import "IDLabel.h"
#import "VisitRoutePlanViewController.h"
#import "LatLng.h"

// 步骤
#import "GetVisitEnterShopViewController.h"
#import "GetVisitConfirmCustomerViewController.h"
#import "GetVisitCheckInventoryViewController.h"
#import "GetVisitRecommendedOrderViewController.h"
#import "GetVisitVividDisplayViewController.h"
#import "KBShowStepViewController.h"

@interface GetPartyVisitListViewController ()<GetPartyVisitListServiceDelegate, GetPartyVisitListTableViewCellDelegate, GetPartyVisitLineServiceDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate> {
    
//    GetPartyVisitListSearchResultsViewController *searchResultsViewController;
}

// 网络层
@property (strong, nonatomic) GetPartyVisitListService *service;

// 网络层 获取拜访线路
@property (strong, nonatomic) GetPartyVisitLineService *service_week;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

// 经销商数据
@property (strong, nonatomic) GetPartyVisitListModel *getFirstPartyListM;

// TableView数据
@property (strong, nonatomic) NSArray *visits;

// 过滤后的TableView数据
@property (strong, nonatomic) NSMutableArray *visitsFilter;

// 搜索VC
@property (nonatomic, retain) UISearchController *searchController;

// 全局变量
@property (strong, nonatomic) AppDelegate *app;

@property (assign, nonatomic) int page;

@property (nonatomic, assign) NSInteger searchInputCount;     //用户输入次数，用来控制延迟搜索请求

@property (nonatomic, strong) NSString *searchInputText;      //用户输入内容

@property (nonatomic, strong) NSArray *lineArr;

@property (nonatomic, strong) NSArray *firstPartyArr;

// 经销商
@property (weak, nonatomic) IBOutlet IDLabel *firstPartLabel;

// 拜访路线
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;

// 拜访状态
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

// 线路规划
@property (weak, nonatomic) IBOutlet UIButton *routePlanBtn;

@property (strong, nonatomic) UIView *searchBarView;

@end

#define kPageCount 20

#define kCellHeight 132

#define kCellName @"GetPartyVisitListTableViewCell"

// 温馨提示
#define kPrompt @"您还没有拜访记录哦"

@implementation GetPartyVisitListViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        _service = [[GetPartyVisitListService alloc] init];
        _service.delegate = self;
        
        _service_week = [[GetPartyVisitLineService alloc] init];
        _service_week.delegate = self;
        
        _visitsFilter = [[NSMutableArray alloc] init];
        
        _searchInputText = @"";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    // 没有经销商地址IDX，允许请求经销商
    if(!_firstPartLabel.ADDRESS_IDX) {
        
        // 请求经销商
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service GetFirstPartyList:_app.user.IDX andStrBusinessId:_app.business.BUSINESS_IDX];
    }else {
        
        // 根据已选经销商，请求拜访列表
        [self requestFirstPageList:_weekLabel.text andStatus:_statusLabel.text andStrFartherPartyID:_firstPartLabel.IDX];
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"客户拜访";
    
    _routePlanBtn.layer.cornerRadius = 20;
    _routePlanBtn.layer.shadowOffset =  CGSizeMake(0, 3);
    _routePlanBtn.layer.shadowOpacity = 0.5;
    _routePlanBtn.layer.shadowColor =  [UIColor redColor].CGColor;
    
    [_weekLabel setText:[Tools getCurrentWeekDay]];
    [_statusLabel setText:@"未拜访"];
    [self addRightBtn];
    
    [self addNotification];
    
    [self registerCell];
    
    [self addTableViewSearch];
    
    // 上拉分页加载
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataUp)];
    _tableView.mj_footer.hidden = YES;
    
    [_service_week GetPartyVisitLine];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
    NSLog(@"GetPartyVisitListViewController");
    [self removeNotification];
}

- (void)addTableViewSearch {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
    searchBar.backgroundImage = [[UIImage alloc] init];
    searchBar.barTintColor = [UIColor clearColor];
    
    UITextField *searchField = [searchBar valueForKey:@"_searchField"];
    searchField.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [view addSubview:searchBar];
    _tableView.tableHeaderView = view;
    [searchBar setPlaceholder:@"按客户名称搜索"];
    searchBar.delegate = self;
}

#pragma mark - 通知

- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMsg:) name:kGetPartyVisitListViewController_receiveMsg object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMsgShow:) name:kGetPartyListViewController_receiveMsg object:nil];
}


- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kGetPartyVisitListViewController_receiveMsg object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kGetPartyListViewController_receiveMsg object:nil];
}


- (void)receiveMsg:(NSNotification *)aNotify {
    
    NSString *msg = aNotify.userInfo[@"msg"];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [Tools showAlert:_app.window andTitle:msg andTime:3.0];
    });
    
    [_service GetPartyVisitList:_page andstrPageCount:kPageCount andStrSearch:_searchInputText andStrLine:_weekLabel.text andStatus:_statusLabel.text andStrUserID:_app.user.IDX andStrFartherPartyID:_firstPartLabel.IDX];
}


- (void)receiveMsgShow:(NSNotification *)aNotify {
    
    NSString *msg = aNotify.userInfo[@"msg"];
    [Tools showAlert:self.view andTitle:msg andTime:3.0];
}


#pragma mark - UISearchControllerDelegate

- (void)willPresentSearchController:(UISearchController *)searchController {
    
    self.navigationController.navigationBar.translucent = YES;
}


- (void)willDismissSearchController:(UISearchController *)searchController {
    
    self.navigationController.navigationBar.translucent = NO;
}


#pragma mark - GET方法

/**
 懒加载搜索框控制器
 */
//- (UISearchController *)searchController {
//
//    if (!_searchController) {
//
//        searchResultsViewController = [[GetPartyVisitListSearchResultsViewController alloc] init];
//        searchResultsViewController.nav = self.navigationController;
//
//        _searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsViewController];
//
//        // 定义样式
//        if ([[UIDevice currentDevice] systemVersion].doubleValue >= 11.0) {
//
//            [_searchController.searchBar setFrame:CGRectMake(0, 0, ScreenWidth, 56)];
////            _searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false;
//            [_searchController.searchBar.heightAnchor constraintEqualToConstant:44].active = YES;
//        }else {
//
//            [_searchController.searchBar setFrame:CGRectMake(0, 0, ScreenWidth, 44)];
//        }
//        [_searchController.searchBar setPlaceholder:@"客户名称搜索"];
//        [_searchController.searchBar sizeToFit];
//        [_searchController.searchBar setBackgroundImage:[Tools createImageWithColor:[UIColor groupTableViewBackgroundColor]]];
//        _searchController.searchBar.searchFieldBackgroundPositionAdjustment = UIOffsetMake(0, 0);
//
//        _searchController.searchResultsUpdater = self;
//        _searchController.delegate = self;
//        _searchController.dimsBackgroundDuringPresentation = YES;
//    }
//    return _searchController;
//}


/**
 更新
 */
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    //  创建一个临时数组，存放搜索到的联系人
    NSMutableArray *tempArray = [NSMutableArray array];
    //  得到searchBar中的text
    NSString *text = searchController.searchBar.text;
    //  遍历源数据中的联系人
    for (GetPartyVisitItemModel *visit in self.visitsFilter) {
        NSString *name = visit.pARTYNAME;
        //  1、text不能为空，第二判断contact是否包括字符串text，是得话，加入到临时数组中
        if ([text length] != 0 && [name rangeOfString:text options:NSCaseInsensitiveSearch].location !=NSNotFound) {
            [tempArray addObject:visit];
        }
    }
    
    // 赋值
    GetPartyVisitListSearchResultsViewController *searchResultsViewController = (GetPartyVisitListSearchResultsViewController *)searchController.searchResultsController;
    
    // 用户停止输入1秒后搜索
    _searchInputCount ++;
    _searchInputText = text;
    [self performSelector:@selector(requestKeyWorld:) withObject:@(_searchInputCount) afterDelay:1.0f];
    
    // 清空搜索Tableview
    searchResultsViewController.visitsFilter = [[NSMutableArray alloc] init];
    [searchResultsViewController.tableView reloadData];
}

- (void)requestKeyWorld:(NSNumber *)count {
    
    // 过滤 ""
    if([_searchInputText isEqualToString:@""]) {
        
        return;
    }
    
    if (_searchInputCount == [count integerValue]) {
        
        // 执行网络请求
        [_service GetPartyVisitList:1 andstrPageCount:kPageCount andStrSearch:_searchInputText andStrLine:_weekLabel.text   andStatus:_statusLabel.text andStrUserID:_app.user.IDX andStrFartherPartyID:_firstPartLabel.IDX];
        NSLog(@"执行网络请求：%@",  _searchInputText);
    }
}


#pragma mark - 功能函数

// 注册Cell
- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

// 请求第一页数据
- (void)requestFirstPageList:(NSString *)line andStatus:(NSString *)status andStrFartherPartyID:(NSString *)strFartherPartyID{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _page = 1;
    [_service GetPartyVisitList:_page andstrPageCount:kPageCount andStrSearch:_searchInputText andStrLine:line andStatus:status andStrUserID:_app.user.IDX andStrFartherPartyID:strFartherPartyID];
}

// 上拉刷新
- (void)loadMoreDataUp {
    
    if([Tools isConnectionAvailable]) {
        
        _page ++;
        [_service GetPartyVisitList:_page andstrPageCount:kPageCount andStrSearch:_searchInputText andStrLine:_weekLabel.text  andStatus:_statusLabel.text andStrUserID:_app.user.IDX andStrFartherPartyID:_firstPartLabel.IDX];
    } else {
        
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}

// 弹出选择经销商
- (void)showFirstParty:(NSArray *)arr {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        __weak __typeof(self)weakSelf = self;
        [LM_alert showLMAlertViewWithTitle:@"请选择供货商" message:@"" cancleButtonTitle:@"取消" okButtonTitle:nil otherButtonTitleArray:arr clickHandle:^(NSInteger index) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"%ld", (long)index);
                NSString *title = @"";
                if(index == 0) {
                    
                }else {
                    
                    title = arr[index - 1];
                    GetPartyVisitItemModel *m = _getFirstPartyListM.getPartyVisitItemModel[index - 1];
                    _firstPartLabel.IDX = m.iDX;
                    _firstPartLabel.ADDRESS_IDX = m.aDDRESSIDX;
                    [weakSelf.firstPartLabel setText:title];
                    [weakSelf requestFirstPageList:_weekLabel.text andStatus:_statusLabel.text andStrFartherPartyID:_firstPartLabel.IDX];
                }
            });
        }];
    });
}

// 弹出选择拜访路线
- (void)showLine:(NSArray *)arr {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        __weak __typeof(self)weakSelf = self;
        [LM_alert showLMAlertViewWithTitle:@"请选择拜访路线" message:@"" cancleButtonTitle:@"取消" okButtonTitle:nil otherButtonTitleArray:arr clickHandle:^(NSInteger index) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"%ld", (long)index);
                NSString *title = @"";
                if(index == 0) {
                    
                }else {
                    
                    title = arr[index - 1];
                    [weakSelf.weekLabel setText:title];
                    [weakSelf requestFirstPageList:_weekLabel.text andStatus:_statusLabel.text andStrFartherPartyID:_firstPartLabel.IDX];
                }
            });
        }];
    });
}

// 弹出选择拜访状态
- (void)showStatus {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        __weak __typeof(self)weakSelf = self;
        NSArray *array = @[@"未拜访", @"拜访中", @"已拜访", @"全部"];
        [LM_alert showLMAlertViewWithTitle:@"请选择拜访路线" message:@"" cancleButtonTitle:@"取消" okButtonTitle:nil otherButtonTitleArray:array clickHandle:^(NSInteger index) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"%ld", (long)index);
                if(index >= 1) {
                    NSString *title = array[index - 1];
                    [weakSelf.statusLabel setText:title];
                    NSString *status = _statusLabel.text;
                    if([title isEqualToString:@"全部"]) {
                        
                        status = @"";
                    }
                    [weakSelf requestFirstPageList:_weekLabel.text andStatus:status andStrFartherPartyID:_firstPartLabel.IDX];
                }
            });
        }];
    });
}


- (void)addRightBtn {
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"新建客户" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnOnclick)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}


- (void)rightBtnOnclick {
    
    if([_firstPartLabel.ADDRESS_IDX isEqualToString:@""] ||_firstPartLabel.ADDRESS_IDX == nil) {
        
        [Tools showAlert:self.view andTitle:@"请选择供货商"];
    }else {
        
        AddPartyViewController *vc = [[AddPartyViewController alloc] init];
        vc.fatherName = _firstPartLabel.text;
        vc.fatherAddressID = _firstPartLabel.ADDRESS_IDX;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


- (void)visit:(NSUInteger)row {
    
    GetPartyVisitItemModel *m = _visitsFilter[row];
    
    PartyModel *partyM = [[PartyModel alloc] init];
    partyM.PARTY_CODE = m.pARTYNO;
    partyM.PARTY_NAME = m.pARTYNAME;
    partyM.PARTY_LEVEL = m.pARTYLEVEL;
    partyM.PARTY_STATES = m.pARTYSTATES;
    partyM.CHANNEL = m.cHANNEL;
    partyM.LINE = m.lINE;
    partyM.WEEKLY_VISIT_FREQUENCY = m.wEEKLYVISITFREQUENCY;
    
    AddressModel *addressM = [[AddressModel alloc] init];
    addressM.CONTACT_PERSON = m.cONTACTS;
    addressM.CONTACT_TEL = m.cONTACTSTEL;
    addressM.ADDRESS_INFO = m.pARTYADDRESS;
    
    GetPartyVisitItemModel *_pvItemM = _visitsFilter[row];
    
    if([_pvItemM.vISITSTATES isEqualToString:@""]||[_pvItemM.vISITSTATES isEqualToString:@""]) {

        AddPartyVisitViewController *vc = [[AddPartyVisitViewController alloc] init];
        vc.partyM = partyM;
        vc.addressM = addressM;
        vc.pvItemM = m;
        vc.lines = _lineArr;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"新建"] || [_pvItemM.vISITSTATES isEqualToString:@"确认客户信息"]){
        GetVisitEnterShopViewController *vc = [[GetVisitEnterShopViewController alloc] init];
        vc.pvItemM = _pvItemM;
        [self.navigationController pushViewController:vc animated:YES];

    } else if([_pvItemM.vISITSTATES isEqualToString:@"进店"]){

        GetVisitCheckInventoryViewController *vc = [[GetVisitCheckInventoryViewController alloc] init];
        vc.pvItemM = _pvItemM;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"检查库存"]){

        GetVisitRecommendedOrderViewController *vc = [[GetVisitRecommendedOrderViewController alloc] init];
        vc.pvItemM = _pvItemM;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"建议订单"]){

        GetVisitVividDisplayViewController *vc = [[GetVisitVividDisplayViewController alloc] init];
        vc.pvItemM = _pvItemM;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"生动化陈列"]){

        KBShowStepViewController *vc = [[KBShowStepViewController alloc] init];
        vc.pvItemM = _pvItemM;
        vc.isShowConfirmBtn = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"离店"]){

    }

    NSLog(@"%lu", (unsigned long)row);
}


// 列表Cell数据换行处理
- (void)dealTableviewCellHeight {
    
    // 处理换行
    CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:13 andWidth:MAXFLOAT];
    CGFloat mulLine = 0;
    for (GetPartyVisitItemModel *m in _visitsFilter) {
        
        mulLine = [Tools getHeightOfString:m.pARTYADDRESS fontSize:13 andWidth:(ScreenWidth - 10 - 8)];
        mulLine = mulLine ? mulLine : oneLine;
        m.cellHeight = kCellHeight + (mulLine - oneLine);
    }
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _visitsFilter.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GetPartyVisitItemModel *m = _visitsFilter[indexPath.row];
    return m.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    GetPartyVisitListTableViewCell *cell = (GetPartyVisitListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.delegate = self;
    cell.tag = indexPath.row;
    
    GetPartyVisitItemModel *m = _visitsFilter[indexPath.row];
    
    cell.getPartyVisitItemM = m;
    
    if([[Tools getVISIT_STATES:m.vISITSTATES] isEqualToString:@"未拜访"]) {
        
        [cell setIsDisplayCheckBtn:NO];
        [cell setIsDisplayVisitBtn:YES];
        cell.addOrEditLabel.text = @"拜访";
    }else if([[Tools getVISIT_STATES:m.vISITSTATES] isEqualToString:@"拜访中"]) {
        
        [cell setIsDisplayCheckBtn:YES];
        [cell setIsDisplayVisitBtn:YES];
        cell.addOrEditLabel.text = @"继续拜访";
    }else if([[Tools getVISIT_STATES:m.vISITSTATES] isEqualToString:@"已拜访"]) {
        
        [cell setIsDisplayCheckBtn:YES];
        [cell setIsDisplayVisitBtn:NO];
    }else {
        
        [cell setIsDisplayCheckBtn:NO];
        [cell setIsDisplayVisitBtn:NO];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GetPartyVisitItemModel *m = _visitsFilter[indexPath.row];
    if([[Tools getVISIT_STATES:m.vISITSTATES] isEqualToString:@"未拜访"]) {
        
        [self visit:indexPath.row];
    }else if([[Tools getVISIT_STATES:m.vISITSTATES] isEqualToString:@"拜访中"]) {
        
        [self visit:indexPath.row];
    }else if([[Tools getVISIT_STATES:m.vISITSTATES] isEqualToString:@"已拜访"]) {
        
        [self showStepOnclick:indexPath.row];
    }
}


#pragma mark - 事件

// 选择经销商
- (IBAction)choiceFirstParty {
    
    [self showFirstParty:_firstPartyArr];
    
}

// 选择线路
- (IBAction)choiceLineOnclick {
    
    [self showLine:_lineArr];
}

// 选择状态
- (IBAction)choiceStatusOnclick {
    
    [self showStatus];
}

// 路线规划
- (IBAction)routePlanOnclick {
    
    if(_visitsFilter.count > 0) {
        
        VisitRoutePlanViewController *vc = [[VisitRoutePlanViewController alloc] init];
        vc.visitList = _visitsFilter;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        
        [Tools showAlert:self.view andTitle:@"列表里没有客户哦"];
    }
}

// 点击屏幕，收回键盘
- (IBAction)screenOnclick {
    
    [self.view endEditing:YES];
}

#pragma mark - GetPartyVisitListTableViewCellDelegate

- (void)editOnclick:(NSUInteger)row {
    
    [self visit:row];
}

// 添加步骤
- (void)addStepOnclick:(NSUInteger)row {
    
    GetPartyVisitItemModel *_pvItemM = _visitsFilter[row];
    if([_pvItemM.vISITSTATES isEqualToString:@"新建"]) {
        GetVisitEnterShopViewController *vc = [[GetVisitEnterShopViewController alloc] init];
        // 转义
        PartyModel *_partyM = [[PartyModel alloc] init];
        _partyM.PARTY_NAME = _pvItemM.pARTYNAME;
        AddressModel *_addressM = [[AddressModel alloc] init];
        _addressM.ADDRESS_INFO = _pvItemM.pARTYADDRESS;
        _addressM.CONTACT_PERSON = _pvItemM.cONTACTS;
        _addressM.CONTACT_TEL = _pvItemM.cONTACTSTEL;
        // 赋值
        vc.partyM = _partyM;
        vc.addressM = _addressM;
        vc.pvItemM = _pvItemM;
        // 跳转
        [self.navigationController pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"进店"]){
        
        GetVisitConfirmCustomerViewController *vc = [[GetVisitConfirmCustomerViewController alloc] init];
        // 转义
        PartyModel *_partyM = [[PartyModel alloc] init];
        _partyM.PARTY_NAME = _pvItemM.pARTYNAME;
        AddressModel *_addressM = [[AddressModel alloc] init];
        _addressM.ADDRESS_INFO = _pvItemM.pARTYADDRESS;
        _addressM.CONTACT_PERSON = _pvItemM.cONTACTS;
        _addressM.CONTACT_TEL = _pvItemM.cONTACTSTEL;
        // 赋值
        vc.partyM = _partyM;
        vc.addressM = _addressM;
        vc.pvItemM = _pvItemM;
        // 跳转
        [self.navigationController pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"确认客户信息"]){
        
        GetVisitCheckInventoryViewController *vc = [[GetVisitCheckInventoryViewController alloc] init];
        vc.pvItemM = _pvItemM;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"检查库存"]){
        
        GetVisitRecommendedOrderViewController *vc = [[GetVisitRecommendedOrderViewController alloc] init];
        vc.pvItemM = _pvItemM;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"建议订单"]){
        
    } else if([_pvItemM.vISITSTATES isEqualToString:@"生动化陈列"]){
        
    } else if([_pvItemM.vISITSTATES isEqualToString:@"离店"]){
        
        [Tools showAlert:self.view andTitle:@"此拜访已完成，不需要再操作"];
    }
}

- (void)showStepOnclick:(NSUInteger)row {
    
    KBShowStepViewController *vc = [[KBShowStepViewController alloc] init];
    GetPartyVisitItemModel *m = _visitsFilter[row];
    vc.pvItemM = m;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - GetPartyVisitListServiceDelegate

- (void)successOfGetPartyVisitList:(GetPartyVisitListModel *)getPartyVisitListM andsStrSearch:(nullable NSString *)strSearch {
    
    // 不搜索时，把结果存起来
    if([strSearch isEqualToString:@""]) {
        
         _visits = getPartyVisitListM.getPartyVisitItemModel;
    }
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView.mj_footer endRefreshing];
    _tableView.mj_footer.hidden = NO;
    
    // 页数处理
    if(_page == 1) {
        
        _visitsFilter = [getPartyVisitListM.getPartyVisitItemModel mutableCopy];
        if(_visitsFilter.count < kPageCount) {
            
            [_tableView.mj_footer setCount_NoMoreData:_visitsFilter.count];
        }
    } else {
        
        for(int i = 0; i < getPartyVisitListM.getPartyVisitItemModel.count; i++) {
            
            GetPartyVisitListModel *item = getPartyVisitListM.getPartyVisitItemModel[i];
            [_visitsFilter addObject:item];
        }
    }
    
    // 处理Cell高度
    [self dealTableviewCellHeight];
    [_tableView reloadData];
    [_tableView removeNoOrderPrompt];
}


- (void)successOfGetPartyVisitList_NoData:(NSString *)strSearch {
    
    // _searchInputText为空表示用户不搜索了。strSearch有值表示用户网络不好，刚刚的搜索结果才回来
    if([_searchInputText isEqualToString:@""] && ![strSearch isEqualToString:@""]) {
        
        return;
    }
    
    // 不搜索时，把结果存起来
    if([strSearch isEqualToString:@""]) {
        
        if(_page == 1) {
            _visits = nil;
        }
    }
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView.mj_header endRefreshing];
    
    if(_page == 1) { // 没有数据
        
        [_visitsFilter removeAllObjects];
        _tableView.mj_footer.hidden = YES;
        [_tableView noData:kPrompt andImageName:LM_NoResult_noOrder];
    } else {  // 已加载完毕
        
        [_tableView.mj_footer endRefreshingWithNoMoreData];
        [_tableView removeNoOrderPrompt];
        [_tableView.mj_footer setCount_NoMoreData:_visitsFilter.count];
    }
    [_tableView reloadData];
}

- (void)failureOfGetPartyVisitList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [_tableView.mj_footer endRefreshing];
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取信息失败，服务器无返回错误信息"];
    if(_page == 1) {
        
        [_tableView noData:kPrompt andImageName:LM_NoResult_noOrder];
    }
    [_tableView reloadData];
}

- (void)successOfGetFirstPartyList:(GetPartyVisitListModel *)getFirstPartyListM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _getFirstPartyListM = getFirstPartyListM;
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (GetPartyVisitItemModel *m in _getFirstPartyListM.getPartyVisitItemModel) {
        
        [arr addObject:m.pARTYNAME];
    }
    _firstPartyArr = [arr copy];
    
    if(_firstPartyArr.count > 0) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            _firstPartLabel.text = [_firstPartyArr firstObject];
            GetPartyVisitItemModel *m = [_getFirstPartyListM.getPartyVisitItemModel firstObject];
            _firstPartLabel.IDX = m.iDX;
            _firstPartLabel.ADDRESS_IDX = m.aDDRESSIDX;
            [self requestFirstPageList:_weekLabel.text andStatus:_statusLabel.text andStrFartherPartyID:_firstPartLabel.IDX];
        });
    }else {
        
        [Tools showAlert:self.view andTitle:@"找不到供货商，请联系管理员"];
    }
}

- (void)failureOfGetFirstPartyList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取信息失败，服务器无返回错误信息"];
}


#pragma mark - GetPartyVisitLineServiceDelegate

- (void)successOfGetPartyVisitLine:(NSArray *)line {
    
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    for (int i = 0; i < line.count; i++) {
        
        NSDictionary *dict = line[i];
        NSString *itemName = dict[@"ITEM_NAME"];
        [arrM addObject:itemName];
    }
    [arrM addObject:@"全部"];
    _lineArr = [arrM copy];
    NSLog(@"");
}

- (void)failureOfGetPartyVisitLine:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取信息失败，服务器无返回错误信息"];
}


#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    NSLog(@"当前文字：%@", searchText);
    _searchInputText = searchText;
    
    // 用户停止输入1秒后搜索
    _searchInputCount ++;
    [self performSelector:@selector(requestKeyWorld:) withObject:@(_searchInputCount) afterDelay:1.0f];
    
    if([_searchInputText isEqualToString:@""]) {
        
        _visitsFilter = [_visits mutableCopy];
        // 重新计算记录数
        if(_visitsFilter.count > 0) {
            [_tableView.mj_footer setCount_NoMoreData:_visitsFilter.count];
            [_tableView removeNoOrderPrompt];
        }
    }else {
        
        // 清空搜索Tableview
        [_visitsFilter removeAllObjects];
    }
    // 处理Cell高度
    [self dealTableviewCellHeight];
    [_tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.view endEditing:YES];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // 输出点击的view的类名
    NSLog(@"%@", NSStringFromClass([touch.view class]));
    
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UIView"]) {
        return NO;
    }
    return  YES;
}

@end
