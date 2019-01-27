//
//  GetVisitRecommendedOrderViewController.m
//  Order
//
//  Created by wenwang wang on 2018/11/20.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetVisitRecommendedOrderViewController.h"
#import "GetVisitEnterShopService.h"
#import "Tools.h"
#import <MBProgressHUD.h>
#import "GetVisitVividDisplayViewController.h"
#import "LM_alert.h"
#import "StockOutViewController.h"
#import "AppDelegate.h"
#import "SelectGoodsService.h"
#import "Stock_GetOutProductTypeService.h"
#import "Store_GetOutProductListService.h"

// 展示订单
#import "UITableView+NoDataPrompt.h"
#import "Store_GetOupputListService.h"
#import "GetOupputInfoViewController.h"
#import "GetOupputListTableViewCell.h"
#import "GetOupputListModel.h"

// 拜访经销商
#import "MakeOrderService.h"
#import "SelectGoodsViewController.h"
#import "CheckAgentOrderTableViewCell.h"
#import "OrderDetailService.h"
#import "OrderDetailViewController.h"

@interface GetVisitRecommendedOrderViewController ()<GetVisitEnterShopServiceDelegate, SelectGoodsServiceDelegate, GetOutProductTypeServiceDelegate, Store_GetOutProductListServiceDelegate, Store_GetOupputListServiceDelegate, MakeOrderServiceDelegate>

// 建议订单
@property (weak, nonatomic) IBOutlet UITextView *strRecommendedOrder;

//textView的placeholder
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

// 销售订单
@property (weak, nonatomic) IBOutlet UIButton *saleBtn;

// 下一步
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (strong, nonatomic) AppDelegate *app;

@property (strong, nonatomic) SelectGoodsService *selectGoodsService;

// 暂存请求支付方式的回调结果
@property (strong, nonatomic) NSMutableArray *payTypes;

@property (strong, nonatomic) Stock_GetOutProductTypeService *getOutProductTypeService;

// 暂存请求产品类型的回调结果
@property (strong, nonatomic) NSMutableArray *productTypes;

@property (strong, nonatomic) Store_GetOutProductListService *store_GetOutProductListService;

// 上级客户信息
@property (strong, nonatomic) PartyModel *partyM;

// 上级地址信息
@property (strong, nonatomic) AddressModel *addressM;

// 展示订单
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// 网络层
@property (strong, nonatomic) Store_GetOupputListService *service_visitOrder;

// 出库列表
@property (strong, nonatomic) GetOupputListModel *getOupputListM;

// 查看订单
@property (weak, nonatomic) IBOutlet UIView *CheckOrderView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContainerViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *SuggestViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *CheckViewHeight;

// 拜访经销商
@property (strong, nonatomic)MakeOrderService *service_make;

// 经销商地址
@property (strong, nonatomic) AddressModel *addressM_make;

// 订单列表数据
@property (strong, nonatomic) CheckOrderListModel *CheckOrderListM;

@end

#define kCellHeight 103

#define kCellNameGetOupputList @"GetOupputListTableViewCell"

#define kCellNameCheckAgentOrder @"CheckAgentOrderTableViewCell"

@implementation GetVisitRecommendedOrderViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        _selectGoodsService = [[SelectGoodsService alloc] init];
        _selectGoodsService.delegate = self;
        
        _getOutProductTypeService = [[Stock_GetOutProductTypeService alloc] init];
        _getOutProductTypeService.delegate = self;
        
        _store_GetOutProductListService = [[Store_GetOutProductListService alloc] init];
        _store_GetOutProductListService.delegate = self;
        
        _service_visitOrder = [[Store_GetOupputListService alloc] init];
        _service_visitOrder.delegate = self;
        
        _service_make = [[MakeOrderService alloc] init];
        _service_make.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"建议订单";
    
    _saleBtn.layer.cornerRadius = 20;
    _saleBtn.layer.shadowOffset =  CGSizeMake(0, 3);
    _saleBtn.layer.shadowOpacity = 0.5;
    _saleBtn.layer.shadowColor =  [UIColor redColor].CGColor;
    
    _nextBtn.layer.cornerRadius = 20;
    _nextBtn.layer.shadowOffset =  CGSizeMake(0, 3);
    _nextBtn.layer.shadowOpacity = 0.5;
    _nextBtn.layer.shadowColor =  [UIColor redColor].CGColor;
    
    [self registerCell];
    
    GetVisitEnterShopService *s = [[GetVisitEnterShopService alloc] init];
    s.delegate = self;
    [s GetFatherAddress:_pvItemM.aDDRESSIDX];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if([_pvItemM.gRADE isEqualToString:@"0"]) {
        
        [Tools showAlert:self.view andTitle:@"当前被拜访的客户为供货商，无出库单"];
    }else if([_pvItemM.gRADE isEqualToString:@"1"]) {
        
        [_service_visitOrder GetVisitAppOrde_AGENT:_pvItemM.vISITIDX andStrType:@"AppOrder"];
    }else if([_pvItemM.gRADE isEqualToString:@"2"]) {
        
        [_service_visitOrder GetVisitAppOrder:_pvItemM.vISITIDX andStrType:@"OutPut"];
    }else {
        
        [Tools showAlert:self.view andTitle:@"未知客户类型，字段GRADE"];
    }
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
    _scrollContainerViewHeight.constant = _SuggestViewHeight.constant + _CheckViewHeight.constant;
}


#pragma mark - 功能函数

// 注册Cell
- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellNameGetOupputList bundle:nil] forCellReuseIdentifier:kCellNameGetOupputList];
    [_tableView registerNib:[UINib nibWithNibName:kCellNameCheckAgentOrder bundle:nil] forCellReuseIdentifier:kCellNameCheckAgentOrder];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //『供货商』对『经销商』的入库单
    if(_CheckOrderListM) {
        
        return _CheckOrderListM.checkOrderItemModel.count;
    }
    //『经销商』对『门店』的出库单
    else {
        
        return _getOupputListM.getOupputModel.count;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //『供货商』对『经销商』的入库单
    if(_CheckOrderListM) {
        
        return kCellHeight;
    }
    //『经销商』对『门店』的出库单
    else {
        
        GetOupputModel *getOupputM = _getOupputListM.getOupputModel[indexPath.row];
        return getOupputM.cellHeight;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //『供货商』对『经销商』的入库单
    if(_CheckOrderListM) {
        
        static NSString *cellID = kCellNameCheckAgentOrder;
        CheckAgentOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        
        CheckOrderItemModel *CheckOrderItemM = _CheckOrderListM.checkOrderItemModel[indexPath.row];
        
        cell.CheckOrderItemM = CheckOrderItemM;
        
        return cell;
    }
    //『经销商』对『门店』的出库单
    else {
        
        static NSString *cellId = kCellNameGetOupputList;
        GetOupputListTableViewCell *cell = (GetOupputListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        
        GetOupputModel *getOupputM = _getOupputListM.getOupputModel[indexPath.row];
        
        cell.getOupputM = getOupputM;
        
        return cell;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //『供货商』对『经销商』的入库单
    if(_CheckOrderListM) {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        CheckOrderItemModel *m = _CheckOrderListM.checkOrderItemModel[indexPath.row];
        OrderDetailService *service = [[OrderDetailService alloc] init];
        service.delegate = self;
        [service getOrderDetailsData:m.iDX];
    }
    //『经销商』对『门店』的出库单
    else {
        
        [_tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        GetOupputModel *m = _getOupputListM.getOupputModel[indexPath.row];
        
        GetOupputInfoViewController *vc = [[GetOupputInfoViewController alloc] init];
        vc.oupputM = m;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - 事件

- (IBAction)saleOnclick {
    
    if([_pvItemM.gRADE isEqualToString:@"0"]) {
        
        [Tools showAlert:self.view andTitle:@"当前被拜访的客户为供货商，无出库单"];
    }else if([_pvItemM.gRADE isEqualToString:@"1"]) {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service_make getPartygetAddressInfo:_pvItemM.iDX];
    }else if([_pvItemM.gRADE isEqualToString:@"2"]) {
        
        [MBProgressHUD showHUDAddedTo:_app.window animated:YES];
        [_selectGoodsService getPayTypeData];
    }else {
        
        [Tools showAlert:self.view andTitle:@"未知客户类型，字段GRADE"];
    }
}

- (IBAction)nextOnclick {
    
    NSString *msgTitle = @"";
    NSString *cancleTitle = @"";
    if(_getOupputListM.getOupputModel.count > 0) {
        
        msgTitle = @"确定订单无误？";
        cancleTitle = @"再看看";
    }else {
        
        msgTitle = @"确定门店不需要补货吗？";
        cancleTitle = @"再想想";
    }
    [LM_alert showLMAlertViewWithTitle:msgTitle message:@"" cancleButtonTitle:cancleTitle okButtonTitle:@"确定" okClickHandle:^{
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        GetVisitEnterShopService *s = [[GetVisitEnterShopService alloc] init];
        s.delegate = self;
        [s GetVisitRecommendedOrder:_pvItemM.vISITIDX andStrRecommendedOrder:_strRecommendedOrder.text];
    } cancelClickHandle:nil];
}

- (void)successOfGetVisitRecommendedOrder:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    
    GetVisitVividDisplayViewController *vc = [[GetVisitVividDisplayViewController alloc] init];
    vc.pvItemM = _pvItemM;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)failureOfGetVisitRecommendedOrder:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}


#pragma mark - 键盘回收

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text {
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    if (![text isEqualToString:@""]) {
        _placeholderLabel.hidden = YES;
    }
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
        _placeholderLabel.hidden = NO;
    }
    
    return YES;
}


#pragma mark - SelectGoodsServiceDelegate

// 获取支付类型回调
- (void)successOfGetPayTypeData:(NSMutableArray *)payTypes {
    
    _payTypes = payTypes;
    
    // 关闭上一个菊花
    [MBProgressHUD hideHUDForView:_app.window animated:YES];
    
    // 开启一个新菊花来请求网络，这两个菊花可以打平
    [MBProgressHUD showHUDAddedTo:_app.window animated:YES];
    
    // 1为经销商，2为门店
    if([_pvItemM.gRADE isEqualToString:@"1"]) {
        
        [_selectGoodsService getProductTypesData];
    }else if([_pvItemM.gRADE isEqualToString:@"2"]) {
        
        [_getOutProductTypeService GetOutProductType:_addressM.IDX];
    }
}


- (void)failureOfGetPayTypeData:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:_app.window animated:YES];
    
    [Tools showAlert:_app.window andTitle:[msg isEqualToString:@""] ? @"获取支付方式失败" : msg];
}


// 获取产品类型回调
- (void)successOfGetOutProductType:(NSMutableArray *)productTypes {
    
    _productTypes = productTypes;
    
    // 关闭上一个菊花
    [MBProgressHUD hideHUDForView:_app.window animated:YES];
    
    // 开启一个新菊花来请求网络，这两个菊花可以打平
    [MBProgressHUD showHUDAddedTo:_app.window animated:YES];
    
    [_store_GetOutProductListService GetOutProductList:@"" andstrProductClass:@"" andstrPartyAddressIdx:[_addressM.IDX integerValue] andstrPage:1 andstrPageCount:999];
}


- (void)failureOfGetOutProductType:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:_app.window animated:YES];
    
    [Tools showAlert:_app.window andTitle:[msg isEqualToString:@""] ? @"获取产品类型失败,可能仓库没货哦" : msg andTime:4.5];
}

- (void)successOfGetFatherAddress:(NSString *)msg andPartyM:(PartyModel *)partyM andAddressM:(AddressModel *)addressM {
    
    _partyM = partyM;
    _addressM = addressM;
}

- (void)failureOfGetFatherAddress:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:_app.window animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

- (void)failureOfGetOutProductList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:_app.window animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

- (void)successOfGetOutProductList:(NSMutableArray *)products {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [MBProgressHUD hideHUDForView:_app.window animated:YES];
    StockOutViewController *vc = [[StockOutViewController alloc] init];
    vc.didselectIndex = 1006;
    vc.payTypes = _payTypes;
    vc.productTypes = _productTypes;
    NSDictionary *dict = [NSDictionary dictionaryWithObject:products forKey:@(0)];
    vc.dictProducts = [NSMutableDictionary dictionaryWithObject:dict forKey:@(0)];
    vc.address = _addressM;
    vc.party = _partyM;
    GetToAddressModel *getToAddressM = [[GetToAddressModel alloc] init];
    getToAddressM.aDDRESSINFO = _pvItemM.pARTYADDRESS;
    getToAddressM.cONTACTPERSON = _pvItemM.cONTACTS;
    getToAddressM.cONTACTTEL = _pvItemM.cONTACTSTEL;
    getToAddressM.iDX = _pvItemM.aDDRESSIDX;
    getToAddressM.iTEMCODE = _pvItemM.pARTYNO;
    getToAddressM.pARTYNAME = _pvItemM.pARTYNAME;
    getToAddressM.pARTYTYPE = _pvItemM.pARTYTYPE;
    vc.visitPartyAndAddress = getToAddressM;
    vc.VISIT_IDX = _pvItemM.vISITIDX;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)successOfGetOutProductList_NoData {
    
    [MBProgressHUD hideHUDForView:_app.window animated:YES];
    [Tools showAlert:self.view andTitle:@"没有数据--"];
}


#pragma mark - Store_GetOupputListServiceDelegate

- (void)successOfGetOupputList:(GetOupputListModel *)getOupputListM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _getOupputListM = getOupputListM;
    
    CGFloat tableViewHeight = 0;
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
        
        tableViewHeight += oneCellHeight;
    }
    _CheckViewHeight.constant = 30 + tableViewHeight;
    [self updateViewConstraints];
    
    [_tableView removeNoOrderPrompt];
    [_tableView reloadData];
    [_CheckOrderView setHidden:NO];
}


- (void)successOfGetOupputList_NoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView noData:@"没有销售订单" andImageName:LM_NoResult_noOrder];
}


- (void)failureOfGetOupputList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取出库列表失败"];
}


- (void)successOfGetOupputList_CheckOrder:(CheckOrderListModel *)CheckOrderListM {
    
    _CheckOrderListM = CheckOrderListM;
    
    [_tableView removeNoOrderPrompt];
    [_tableView reloadData];
    [_CheckOrderView setHidden:NO];
}

#pragma mark - MakeOrderServiceDelegate

// 获取客户地址列表回调
- (void)successOfGetPartygetAddressInfo:(NSMutableArray *)address {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if(address.count > 0) {
        
        if(address.count > 1) {
            
            [Tools showAlert:self.view andTitle:@"当前客户有多地址"];
        }
        _addressM_make = address[0];
        [_selectGoodsService getPayTypeData];
    } else {
        
        [Tools showAlert:self.view andTitle:@"没有可用地址"];
    }
}


#pragma mark - SelectGoodsServiceDelegate

// 获取产品类型回调
- (void)successOfGetProductTypeData:(NSMutableArray *)productTypes {
    
    _productTypes = productTypes;
    
    // 关闭上一个菊花
    [MBProgressHUD hideHUDForView:_app.window animated:YES];
    
    // 开启一个新菊花来请求网络，这两个菊花可以打平
    [MBProgressHUD showHUDAddedTo:_app.window animated:YES];
    
    [_selectGoodsService getProductsData:_pvItemM.iDX andOrderAddressIdx:_addressM_make.IDX andProductTypeIndex:0 andProductType:@"" andOrderBrand:@""];
}


// 获取产品数据回调
- (void)successOfGetProductData:(NSMutableArray *)products {
    
    [MBProgressHUD hideHUDForView:_app.window animated:YES];
    
    SelectGoodsViewController *vc = [[SelectGoodsViewController alloc] init];
    vc.payTypes = _payTypes;
    vc.productTypes = _productTypes;
    vc.address = _addressM_make;
    PartyModel *party = [[PartyModel alloc] init];
    party.IDX = _pvItemM.iDX;
    party.PARTY_NAME = _pvItemM.pARTYNAME;
    vc.party = party;
    vc.VISIT_IDX = _pvItemM.vISITIDX;
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:products forKey:@(0)];
    NSMutableDictionary *dictP = [NSMutableDictionary dictionaryWithObject:dict forKey:@(0)];
    vc.dictProducts = dictP;
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - OrderDetailServiceDelegate

- (void)successOfOrderDetail:(OrderModel *)order {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    OrderDetailViewController *vc = [[OrderDetailViewController alloc] init];
    vc.order = order;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)failureOfOrderDetail:(NSString *)msg {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取失败"];
}

@end
