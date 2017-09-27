//
//  StockOutConfirmViewController.m
//  Order
//
//  Created by 凯东源 on 16/10/21.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import "StockOutConfirmViewController.h"
#import "ConfirmOrderTableViewCell.h"
#import "ProductModel.h"
#import "PromotionDetailModel.h"
#import "Tools.h"
#import "AppDelegate.h"
#import "AddGiftsViewController.h"
#import "AddGiftsService.h"
#import "MBProgressHUD.h"
#import "OrderGiftModel.h"
#import "ConfirmOrderGiftsTableViewCell.h"
#import "NSString+Trim.h"
#import "Store_StockOutConfirmService.h"
#import <Masonry.h>
#import "LMPickerView.h"
#import "StockManViewController.h"

@interface StockOutConfirmViewController ()<UITableViewDelegate, UITableViewDataSource, ConfirmOrderTableViewCellDelegate, AddGiftsServiceDelegate, Store_StockOutConfirmServiceDelegate, LMPickerViewDelegate>

#define ProductTableViewCellHeight 69
#define GiftTableViewCellHeight 69

//  虚化值 0 - 10
#define kBlurryLevel 5.1

// datePickerContainerView alpha渐变时间
#define kDatePickerContainerView_alpha_Duration 0.47f



#pragma mark - 通用

// scrollView里的视图高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

// 全局变量
@property (strong, nonatomic) AppDelegate *app;



#pragma mark - 发货信息

// 发货信息高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sendViewHeight;

// 客户名称
@property (weak, nonatomic) IBOutlet UILabel *PARTY_NAME;

// 联系人名
@property (weak, nonatomic) IBOutlet UILabel *CONTACT_PERSON;

// 联系方式
@property (weak, nonatomic) IBOutlet UILabel *CONTACT_TEL;

// 地址详情
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_INFO;



#pragma mark - 收货信息

// 收货信息高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *receiveViewHeight;

// 门店名称
@property (weak, nonatomic) IBOutlet UILabel *PARTY_NAME_receive;

// 联系人名
@property (weak, nonatomic) IBOutlet UILabel *CONTACT_PERSON_receive;

// 联系方式
@property (weak, nonatomic) IBOutlet UILabel *CONTACT_TEL_receive;

// 地址详情
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_INFO_receive;

#pragma mark - 订单信息

// 订单TableView
@property (weak, nonatomic) IBOutlet UITableView *orderTableView;

// 订单TableView父视图的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *orderTableSuperViewHeight;



#pragma mark - 赠品信息

// 赠品网络层
@property (strong, nonatomic) AddGiftsService *addGiftsService;

// 赠品TableView父视图高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *giftsTableSuperViewHeight;

// 提示无赠品
@property (weak, nonatomic) IBOutlet UILabel *noGiftPromptLabel;

// 赠品TableView
@property (weak, nonatomic) IBOutlet UITableView *giftTableView;

// 添加赠品
@property (weak, nonatomic) IBOutlet UIButton *addGiftButton;

// 已选择的赠品
@property (strong, nonatomic) NSMutableArray *selectedGifts;



#pragma mark - 汇总信息

// 总计高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sumInfoSuperViewHeight;

// 产品总数
@property (weak, nonatomic) IBOutlet UILabel *totalCountLabel;

// 产品原价
@property (weak, nonatomic) IBOutlet UILabel *orgPriceLabel;

// 付款方式
@property (weak, nonatomic) IBOutlet UILabel *payTypeLabel;

// 促销策略提示
@property (weak, nonatomic) IBOutlet UILabel *promotionPromptLabel;

// 促销策略
@property (weak, nonatomic) IBOutlet UILabel *promotionLabel;

// 满减总计提示
@property (weak, nonatomic) IBOutlet UILabel *mjTotalPromptLabel;

// 满减总计
@property (weak, nonatomic) IBOutlet UILabel *mjTotalLabel;

// 实际付款
@property (weak, nonatomic) IBOutlet UILabel *actPriceLabel;



#pragma mark - 调整价格

// 自定义价格视图
@property (weak, nonatomic) IBOutlet UIView *customizePriceView;

// 价格上限
@property (weak, nonatomic) IBOutlet UILabel *upperLimi;

// 价格下限
@property (weak, nonatomic) IBOutlet UILabel *lowerLimi;

// 自定义价格输入框
@property (weak, nonatomic) IBOutlet UITextField *customizePriceF;

// 取消自定义价格
- (IBAction)cancelCustomizePriceOnclick:(UIButton *)sender;

// 确定自定义价格
- (IBAction)confirmCustomizePriceOnclick:(UIButton *)sender;

// 当前弹出自定义价格框的indexRow
@property (assign, nonatomic) NSInteger customizePriceIndexRow;

// 遮罩视图
@property (weak, nonatomic) IBOutlet UIView *coverView;



#pragma mark - 时间模块

// 显示时间选择器控件
@property (strong, nonatomic) UIView *datePickerContainerView;

// 时间格式
@property (strong, nonatomic) NSDateFormatter *formatter;

// 送货时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

/// 已经选择的时间
@property (strong, nonatomic) NSDate *selectedDate;

/// 是否点击了时间的确定按钮。如果没点击，代表用户没选择时间，即使selectedDate有值也不使用
@property (assign, nonatomic) BOOL isOnclickDateSure;

// 选择时间事件
- (IBAction)timeOnclick:(UITapGestureRecognizer *)sender;

// 时间选择
@property (strong, nonatomic)LMPickerView *LM;




#pragma mark - 备注

// 备注
@property (weak, nonatomic) IBOutlet UITextView *remarkTextV;

// textView的placeholder
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;



#pragma mark - 确认

// 时间、备注、确认高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *time_remark_commit_Height;

// 订单确认服务
@property (strong, nonatomic) Store_StockOutConfirmService *service;

- (IBAction)confirmOnclick:(UIButton *)sender;

// 确认
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;

@end



#pragma mark - 枚举

// 关闭时间选择器类型
typedef enum _CloseDatePicker {
    
    CloseDatePicker_TYPE_SURE  = 0,         // 确定
    CloseDatePicker_TYPE_CANCEL,            // 取消
} DateType;

static CGFloat g_sumInfoSuperViewHeight_c = 0;


@implementation StockOutConfirmViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _selectedGifts = [[NSMutableArray alloc] init];
        _customizePriceIndexRow = 0;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _addGiftsService = [[AddGiftsService alloc] init];
        _addGiftsService.delegate = self;
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"yyyy-MM-dd"];
        _selectedDate = [NSDate date];
        _service = [[Store_StockOutConfirmService alloc] init];
        _service.delegate = self;
        _isOnclickDateSure = NO;
        
        _LM = [[LMPickerView alloc] init];
        _LM.delegate = self;
        [_LM initDatePicker];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"订单确认";
    
    [self registerCell];
    
    [self dealWithData];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self initUI];
    
    [self addNotification];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
    // 赠品模块高度
    _giftsTableSuperViewHeight.constant = 30 + GiftTableViewCellHeight * _selectedGifts.count + 60;
    
    // 总高度
    _scrollContentViewHeight.constant = _sendViewHeight.constant + _receiveViewHeight.constant + _orderTableSuperViewHeight.constant + _giftsTableSuperViewHeight.constant + _sumInfoSuperViewHeight.constant + _time_remark_commit_Height.constant;
}


- (void)dealloc {
    
    NSLog(@"%s", __func__);
    [self removeNotification];
}


#pragma mark - 私有方法

- (void)dealWithData {
    
    // 发货地址换行
    CGFloat contentWidth = ScreenWidth - 12 - 61 - 8;
    
    CGFloat oneLineHeight = [Tools getHeightOfString:@"fds" fontSize:12 andWidth:999.9];
    
    CGFloat overflowHeight = [Tools getHeightOfString:_addressM.ADDRESS_INFO fontSize:12 andWidth:contentWidth] - oneLineHeight;
    
    if(overflowHeight > 0) {
        
        _sendViewHeight.constant += overflowHeight;
    }
    
    // 收货地址换行
    overflowHeight = [Tools getHeightOfString:_getToAddressM.aDDRESSINFO fontSize:12 andWidth:contentWidth] - oneLineHeight;
    
    if(overflowHeight > 0) {
        
        _receiveViewHeight.constant += overflowHeight;
    }
    
    // 产品名称换行
    CGFloat tableViewHeight = 0;
    for (int i = 0; i < _promotionDetailsOfServer.count; i++) {
        
        PromotionDetailModel *m = _promotionDetailsOfServer[i];
        
        // Label 容器宽度
        CGFloat contentWidth = 0;
        if([m.LOTTABLE06 isEqualToString:@"Y"]) {
            
            contentWidth = ScreenWidth - 17 - 118;
        } else {
            
            contentWidth = ScreenWidth - 17 - 88;
        }
        // Label 单行高度
        CGFloat oneLineHeight = [Tools getHeightOfString:@"fds" fontSize:13 andWidth:999.9];
        
        CGFloat overflowHeight = [Tools getHeightOfString:m.PRODUCT_NAME fontSize:13 andWidth:contentWidth] - oneLineHeight;
        
        if(overflowHeight > 0) {
            
            m.cellHeight = ProductTableViewCellHeight + overflowHeight;
        } else {
            
            m.cellHeight = ProductTableViewCellHeight;
        }
        
        m.cellHeight = m.cellHeight + ([m.SALE_REMARK isEqualToString:@""] ? 0 : 15);
        
        tableViewHeight += m.cellHeight;
    }
    
    //设置产品TableView高度
    _orderTableSuperViewHeight.constant = 30 + tableViewHeight;
}


- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshGifts:) name:kConfirmOrderViewControllerRefreshGifts object:nil];
}


- (void)removeNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kConfirmOrderViewControllerRefreshGifts object:nil];
}


- (void)refreshGifts:(NSNotification *)aNotification {
    
    _selectedGifts = aNotification.userInfo[@"gifts"];
}


- (void)initUI {
    
    // 发货信息
    _PARTY_NAME.text = _partyM.PARTY_NAME;
    _CONTACT_PERSON.text = _addressM.CONTACT_PERSON;
    _CONTACT_TEL.text = _addressM.CONTACT_TEL;
    _ADDRESS_INFO.text = _addressM.ADDRESS_INFO;
    
    // 收货信息
    _PARTY_NAME_receive.text = _getToAddressM.pARTYNAME;
    _CONTACT_PERSON_receive.text = _getToAddressM.cONTACTPERSON;
    _CONTACT_TEL_receive.text = _getToAddressM.cONTACTTEL;
    _ADDRESS_INFO_receive.text = _getToAddressM.aDDRESSINFO;
    
    
    // 没有赠品
    _noGiftPromptLabel.hidden = _selectedGifts.count;
    
    _giftTableView.hidden = !_selectedGifts.count;
    
    _customizePriceView.hidden = YES;
    _coverView.hidden = YES;
    
    // 设置添加赠品按钮是否可见
    NSString *bussinessCode = _app.business.BUSINESS_CODE;
    if([bussinessCode rangeOfString:@"QH"].length > 0 && [_promotionOrder.HAVE_GIFT isEqualToString:@"Y"]) {
        //  if([bussinessName isEqualToString:@"凯东源前海项目"] && [_promotionOrder.HAVE_GIFT isEqualToString:@"Y"]) {
        
        _addGiftButton.hidden = NO;
    } else {
        
        _addGiftButton.hidden = YES;
    }
    
    [self refreshCollectDada];
    
    [_orderTableView reloadData];
    [_giftTableView reloadData];
}


// 结算，汇总信息
- (void)refreshCollectDada {
    long long totalCount = 0;
    double orgPrice = 0;
    double actPrice = 0;
    for(int i = 0; i < _promotionDetailsOfServer.count; i++) {
        PromotionDetailModel *m = _promotionDetailsOfServer[i];
        totalCount += m.PO_QTY;
        orgPrice += m.ORG_PRICE * m.PO_QTY;
        actPrice += m.ACT_PRICE * m.PO_QTY;
    }
    _promotionOrder.ACT_PRICE = actPrice;
    for(int i = 0; i < _selectedGifts.count; i++) {
        PromotionDetailModel *m = _selectedGifts[i];
        totalCount += m.PO_QTY;
    }
    _promotionOrder.TOTAL_QTY = totalCount;
    
    // 总数
    _totalCountLabel.text = [NSString stringWithFormat:@"%lld", _promotionOrder.TOTAL_QTY];
    
    // 原价
    _orgPriceLabel.text = [NSString stringWithFormat:@"￥%.1f", orgPrice];
    
    // 付款方式
    _payTypeLabel.text = [Tools getPaymentType:_orderPayType];
    if(_selectedGifts.count > 0) {
        [_addGiftButton setTitle:@"重新添加" forState:UIControlStateNormal];
    } else {
        [_addGiftButton setTitle:@"添加赠品" forState:UIControlStateNormal];
    }
    if([_promotionOrder.MJ_REMARK isEqualToString:@""] || [_promotionOrder.MJ_REMARK isEqualToString:@"+|+"]) {
        _promotionPromptLabel.text = nil;
        _mjTotalPromptLabel.text = nil;
        _promotionLabel.text = nil;
        _mjTotalLabel.text = nil;
        _actPriceLabel.text = [NSString stringWithFormat:@"￥%.1f", _promotionOrder.ACT_PRICE];
        
        if(!g_sumInfoSuperViewHeight_c) {
            
            _sumInfoSuperViewHeight.constant -= 30;
            g_sumInfoSuperViewHeight_c = _sumInfoSuperViewHeight.constant;
        }
    } else {
        _promotionPromptLabel.text = @"促销策略：";
        _mjTotalPromptLabel.text = @"满减总计：";
        _promotionLabel.text = _promotionOrder.MJ_REMARK;
        _mjTotalLabel.text = [NSString stringWithFormat:@"￥%.1f", _promotionOrder.MJ_PRICE];
        _actPriceLabel.text = [NSString stringWithFormat:@"￥%.1f", _promotionOrder.ACT_PRICE - _promotionOrder.MJ_PRICE];
    }
}


- (void)registerCell {
    
    [_orderTableView registerNib:[UINib nibWithNibName:@"ConfirmOrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"ConfirmOrderTableViewCell"];
    _orderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_giftTableView registerNib:[UINib nibWithNibName:@"ConfirmOrderGiftsTableViewCell" bundle:nil] forCellReuseIdentifier:@"ConfirmOrderGiftsTableViewCell"];
    _giftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


- (void)setNewPrice:(PromotionDetailModel *)m andPrice:(CGFloat)price {
    m.ACT_PRICE = price;
    for (int i = 0; i < _productsOfLocal.count; i++) {
        ProductModel *product = _productsOfLocal[i];
        if(m.PRODUCT_IDX == product.IDX) {
            product.PRODUCT_CURRENT_PRICE += 0.1;
        }
    }
    [_orderTableView reloadData];
}


#pragma mark - 点击事件

- (IBAction)addGiftOnclick:(UIButton *)sender {
    
    if([_promotionOrder.HAVE_GIFT isEqualToString:@"Y"] && _promotionOrder.OrderDetails.count > 0) {
        if(_promotionOrder.GiftClasses.count > 0) {
            
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            OrderGiftModel *m = _promotionOrder.GiftClasses[0];
            [_addGiftsService getAddGiftsData:_app.business.BUSINESS_IDX andPartyIdx:_partyM.IDX andPartyAddressIdx:_addressM.IDX andProductName:m.TYPE_NAME];
        } else {
            
            [Tools showAlert:self.view andTitle:@"没有可用产品类别"];
        }
    }
}

// 获取选择赠品开始的 LINE_NO
- (int)getPromotionNumber {
    
    @try {
        
        int lineNumber = 0;
        
        for(int i = 0; i < _promotionOrder.OrderDetails.count; i++) {
            
            PromotionDetailModel *m = _promotionOrder.OrderDetails[i];
            if(m.LINE_NO > lineNumber) {
                
                lineNumber = (int)m.LINE_NO;
            }
        }
        return lineNumber;
    } @catch (NSException *exception) {
        
        return 0;
    }
}


- (IBAction)confirmCustomizePriceOnclick:(UIButton *)sender {
    [self.view endEditing:YES];
    _customizePriceView.hidden = YES;
    _coverView.hidden = YES;
    
    double price = [_customizePriceF.text doubleValue];
    price = [Tools getDouble:price];
    PromotionDetailModel *m = _promotionDetailsOfServer[_customizePriceIndexRow];
    
    if([Tools getDouble:price] <= [Tools getDouble:m.LOTTABLE12]) {
        
        if([Tools getDouble:price] >= [Tools getDouble:m.LOTTABLE13]) {
            
            [self setNewPrice:m andPrice:price];
            [self refreshCollectDada];
        } else {
            
            [Tools showAlert:self.view andTitle:@"价格超出下限"];
        }
    } else {
        
        [Tools showAlert:self.view andTitle:@"价格超出上限"];
    }
}

- (IBAction)cancelCustomizePriceOnclick:(UIButton *)sender {
    
    [self.view endEditing:YES];
    _customizePriceView.hidden = YES;
    _coverView.hidden = YES;
}

// 选择时间
- (IBAction)timeOnclick:(UITapGestureRecognizer *)sender {
    
    [_LM showDatePicker];
}

// 确认订单，最后一步提交到服务器
- (IBAction)confirmOnclick:(UIButton *)sender {
    
    [self.view endEditing:YES];
    NSString *remark = [_remarkTextV.text trim];
    NSDate *date = _isOnclickDateSure ? _selectedDate : nil;
    
    [_service setConfirmData:_selectedGifts andProducts:_productsOfLocal andTempTotalQTY:_promotionOrder.TOTAL_QTY andDate:date andRemark:remark andPromotionOrder:_promotionOrder andSelectPronotionDetails:_promotionDetailsOfServer];
    
    NSDictionary *dict = [self promotionOrderModelTransfromNSString:_promotionOrder];
    
    NSString *dictStr = [Tools JsonStringWithDictonary:dict];
    
    if(dict == nil) {
        [Tools showAlert:self.view andTitle:@"订单处理异常"];
    } else {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service confirm:dictStr];
    }
}

- (NSDictionary *)promotionOrderModelTransfromNSString:(PromotionOrderModel *)p {
    
    NSMutableArray *OrderDetails = [self promotionDetailModelTransfromNSString:p.OrderDetails];
    
    
    // 总重量
    CGFloat OUTPUT_WEIGHT = 0;
    // 总体积
    CGFloat OUTPUT_VOLUME = 0;
    
    
    
    for (int i = 0; i < p.OrderDetails.count; i++) {
        
        PromotionDetailModel *detailPro = p.OrderDetails[i];
        OUTPUT_WEIGHT += detailPro.PO_WEIGHT * detailPro.PO_QTY;
        OUTPUT_VOLUME += detailPro.PO_VOLUME * detailPro.PO_QTY;
    }
    
    
    
    NSDictionary *Result = @{@"Result" : OrderDetails};
    
    // 总原价
    NSString *orgPrice = [_orgPriceLabel.text stringByReplacingOccurrencesOfString:@"￥" withString:@""];
    
    // 总付款价
    NSString *actPrice = [_actPriceLabel.text stringByReplacingOccurrencesOfString:@"￥" withString:@""];
    
    
    NSString *OUTPUT_TYPE =  @"";  // 出库类型
    NSString *PARTY_CODE = @"";    // 门店代码
    NSString *PARTY_NAME = @"";    // 门店名称
    NSString *PARTY_INFO = @"";    // 门店地址
    
    // 销售出库
    if(_didselectIndex == 1006) {
        
        OUTPUT_TYPE = @"销售出库";
        PARTY_CODE = _getToAddressM.iTEMCODE;
        PARTY_NAME = _getToAddressM.pARTYNAME;
        PARTY_INFO = _getToAddressM.aDDRESSINFO;
    }
    // 其它出库
    else if(_didselectIndex == 1008) {
        
        OUTPUT_TYPE = @"其它出库";
        PARTY_CODE = @"";
        PARTY_NAME = @"";
        PARTY_INFO = @"";
    }
    
    
    @try {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              _app.business.BUSINESS_IDX, @"BUSINESS_IDX",
                              OUTPUT_TYPE, @"OUTPUT_TYPE",
                              _addressM.IDX, @"ADDRESS_IDX",
                              _addressM.ADDRESS_CODE, @"ADDRESS_CODE",
                              _partyM.PARTY_NAME, @"ADDRESS_NAME",
                              _addressM.ADDRESS_INFO, @"ADDRESS_INFO",
                              @"", @"OUTPUT_NO",      // 出库单号未知
                              @"", @"INPUT_NO",       // 原采购单号未知
                              PARTY_CODE, @"PARTY_CODE",
                              PARTY_NAME, @"PARTY_NAME",
                              PARTY_INFO, @"PARTY_INFO",
                              @(p.TOTAL_QTY), @"OUTPUT_QTY",
                              actPrice, @"OUTPUT_SUM",
                              orgPrice, @"PRICE",
                              @"", @"OUTPUT_DATE",    // 出库时间未知
                              @(OUTPUT_WEIGHT), @"OUTPUT_WEIGHT",
                              @(OUTPUT_VOLUME), @"OUTPUT_VOLUME",
                              _remarkTextV.text, @"PARTY_MARK",
                              @"", @"ADUT_MARK",      // 审核备注未知
                              _app.user.IDX, @"ADD_USER",
                              [Tools getCurrentDate], @"ADD_DATE",
                              _app.user.USER_NAME, @"OPER_USER",
                              Result, @"Info",
                              nil];
        return dict;
    } @catch (NSException *exception) {
        
        return [[NSDictionary alloc] init];
    }
}

- (NSMutableArray *)promotionDetailModelTransfromNSString:(NSMutableArray *)ps {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    @try {
        
        for(int i = 0; i < ps.count; i++) {
            PromotionDetailModel *p = ps[i];
            ProductModel *pro = _productsOfLocal[i];
            
            
            
            // 入库重量
            CGFloat OUTPUT_WEIGHT = p.PO_WEIGHT * p.PO_QTY;
            // 入库体积
            CGFloat OUTPUT_VOLUME = p.PO_VOLUME * p.PO_QTY;
            // 金额
            CGFloat SUM = p.ACT_PRICE * p.PO_QTY;
            
            
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                  p.PRODUCT_TYPE, @"PRODUCT_TYPE",
                                  @(p.PRODUCT_IDX), @"PRODUCT_IDX",
                                  p.PRODUCT_NO, @"PRODUCT_NO",
                                  p.PRODUCT_NAME, @"PRODUCT_NAME",
                                  @"", @"PRODUCT_DESC",
                                  @(SUM), @"SUM",
                                  @(p.PO_WEIGHT), @"PRODUCT_WEIGHT",
                                  @(p.PO_VOLUME), @"PRODUCT_VOLUME",
                                  @(p.PO_QTY), @"OUTPUT_QTY",
                                  pro.PRODUCT_UOM, @"OUTPUT_UOM",
                                  @(OUTPUT_WEIGHT), @"OUTPUT_WEIGHT",
                                  @(OUTPUT_VOLUME), @"OUTPUT_VOLUME",
                                  @(p.ORG_PRICE), @"ORG_PRICE",
                                  @(p.ACT_PRICE), @"ACT_PRICE",
                                  p.SALE_REMARK, @"SALE_REMARK",
                                  @(p.MJ_PRICE), @"MJ_PRICE",
                                  p.MJ_REMARK, @"MJ_REMARK",
                                  @"", @"PRODUCTION_DATE",     // 生产日期未知
                                  @"", @"BATCH_NUMBER",        // 批次未知
                                  @"", @"PRODUCT_STATE",       // 货物状态未知
                                  _app.user.USER_NAME, @"OPER_USER",
                                  nil];
            
            NSString *s = [Tools JsonStringWithDictonary:dict];
            [array addObject:s];
        }
    } @catch (NSException *exception) {
        
        return nil;
    }
    
    return array;
}


#pragma mark - OrderConfirmServiceDelegate

- (void)successOfOrderConfirmWithCommit {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"提交成功!"];
    [_commitBtn setEnabled:NO];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // pop 回库存主页
            for (int i = 0; i < self.navigationController.viewControllers.count; i++) {
                
                UIViewController *vc = self.navigationController.viewControllers[i];
                
                if([vc isKindOfClass:[StockManViewController class]]) {
                    
                    [self.navigationController popToViewController:vc animated:YES];
                }
            }
        });
    });
}


- (void)failureOfOrderConfirmWithCommit:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [Tools showAlert:self.view andTitle:msg ? msg : @"提交失败"];
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(tableView.tag == 1001) {
        
        return _promotionDetailsOfServer.count;
    } else if(tableView.tag == 1002) {
        
        return _selectedGifts.count;
    } else {
        
        return 0;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(tableView.tag == 1001) {
        
        // 获取数据
        PromotionDetailModel *m = _promotionDetailsOfServer[indexPath.row];
        
        return m.cellHeight;
    } else if(tableView.tag == 1002) {
        
        return GiftTableViewCellHeight;
    } else {
        
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(tableView.tag == 1001) {
        
        // 界面处理
        static NSString *cellId = @"ConfirmOrderTableViewCell";
        ConfirmOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        cell.tag = indexPath.row;
        cell.delegate = self;
        
        // 获取数据
        PromotionDetailModel *m = _promotionDetailsOfServer[indexPath.row];
        
        // 填充数据
        cell.nameLabel.text = m.PRODUCT_NAME;
        cell.promotionNameLabel.text = [m.SALE_REMARK isEqualToString:@""] ? nil : m.SALE_REMARK;
        cell.originalPriceLabel.text = [NSString stringWithFormat:@"%.1f", m.ORG_PRICE];
        [cell.nowPriceButton setTitle:[NSString stringWithFormat:@"%.1f", m.ACT_PRICE] forState:UIControlStateNormal];
        cell.numberLabel.text = [NSString stringWithFormat:@"%lld", m.PO_QTY];
        if([m.LOTTABLE06 isEqualToString:@"Y"]) {
            
            cell.addButtonWidth.constant = 30;
            cell.delButtonWidth.constant = 30;
            cell.nowPriceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        } else {
            
            cell.addButtonWidth.constant = 0;
            cell.delButtonWidth.constant = 0;
            cell.nowPriceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        }
        
        // 返回Cell
        return cell;
        
    } else if(tableView.tag == 1002) {
        
        // 界面处理
        static NSString *cellId = @"ConfirmOrderGiftsTableViewCell";
        ConfirmOrderGiftsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        cell.tag = indexPath.row;
        
        // 获取数据
        PromotionDetailModel *m = _selectedGifts[indexPath.row];
        
        // 填充数据
        cell.name1Label.text = m.PRODUCT_NAME;
        if([[m.SALE_REMARK trim] isEqualToString:@""]) {
            cell.name2Label.text = nil;
        } else {
            cell.name2Label.text = m.SALE_REMARK;
        }
        cell.orgPriceLabel.text = [NSString stringWithFormat:@"%.1f", m.ORG_PRICE];
        cell.actPriceLabel.text = [NSString stringWithFormat:@"%.1f", m.ACT_PRICE];
        cell.numberLabel.text = [NSString stringWithFormat:@"%lld", m.PO_QTY];
        
        // 返回Cell
        return cell;
    } else {
        
        return [[UITableViewCell alloc] init];
    }
}

#pragma mark - ConfirmOrderTableViewCellDelegate


- (void)delOnclickOfConfirmOrderTableViewCell:(NSInteger)indexRow {
    
    PromotionDetailModel *m = _promotionDetailsOfServer[indexRow];
    double price = m.ACT_PRICE - 0.1;
    if([Tools getDouble:price] >= [Tools getDouble:m.LOTTABLE13]) {
        [self setNewPrice:m andPrice:price];
        [self refreshCollectDada];
    } else {
        
        [Tools showAlert:self.view andTitle:@"价格超出下限"];
    }
}

- (void)addOnclickOfConfirmOrderTableViewCell:(NSInteger)indexRow {
    
    PromotionDetailModel *m = _promotionDetailsOfServer[indexRow];
    CGFloat price = m.ACT_PRICE + 0.1;
    
    if([Tools getDouble:price] <= [Tools getDouble:m.LOTTABLE12]) {
        [self setNewPrice:m andPrice:price];
        [_orderTableView reloadData];
        [self refreshCollectDada];
    } else {
        
        [Tools showAlert:self.view andTitle:@"价格超出上限"];
    }
}

- (void)customizePriceOfConfirmOrderTableViewCell:(NSInteger)indexRow {
    
    PromotionDetailModel *m = _promotionDetailsOfServer[indexRow];
    
    if([m.LOTTABLE06 isEqualToString:@"Y"]) {
        
        _upperLimi.text = [NSString stringWithFormat:@"%.1f", m.LOTTABLE12];
        _lowerLimi.text = [NSString stringWithFormat:@"%.1f", m.LOTTABLE13];
        _customizePriceView.hidden = NO;
        _coverView.hidden = NO;
        _customizePriceIndexRow = indexRow;
        
        [self refreshCollectDada];
    } else {
        
    }
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


#pragma mark - AddGiftsServiceDelegate

- (void)successOfAddGifts:(NSMutableArray *)promotionDetails {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    // 防止变量被下个控制器修改
    NSMutableArray *giftsType = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < _promotionOrder.GiftClasses.count; i++) {
        
        OrderGiftModel *m1 = [_promotionOrder.GiftClasses[i] copy];
        [giftsType addObject:m1];
    }
    
    if(giftsType.count > 0) {
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:promotionDetails forKey:@(0)];
        
        AddGiftsViewController *vc = [[AddGiftsViewController alloc] init];
        vc.partyId = _partyM.IDX;
        vc.addressIdx = _addressM.IDX;
        vc.beginLine = [self getPromotionNumber];
        vc.giftTypes = giftsType;
        //    vc.orderDetails = _promotionOrder.OrderDetails;
        vc.dictPromotionDetails = dict;
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        
        [Tools showAlert:self.view andTitle:@"无赠品可添加"];
    }
}


- (void)failureOfAddGifts:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"获取赠品失败"];
}


#pragma mark - LMPickerViewDelegate

- (void)PickerViewComplete:(NSDate *)date {
    
    _timeLabel.text = [_formatter stringFromDate:date];
    _isOnclickDateSure = YES;
    _selectedDate = date;
}

@end
