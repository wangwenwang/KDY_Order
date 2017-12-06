//
//  ConfirmMonthlyPlanViewController.m
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "ConfirmMonthlyPlanViewController.h"
#import "ConfirmMonthlyPlanTableViewCell.h"
#import "Tools.h"
#import "ImportToOrderPlanListService.h"
#import <MBProgressHUD.h>
#import "AppDelegate.h"

@interface ConfirmMonthlyPlanViewController ()<ImportToOrderPlanListServiceDelegate>

@property (strong, nonatomic) ImportToOrderPlanListService *service;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *customerViewHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addressViewHeight;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *productViewHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@property (strong, nonatomic) AppDelegate *app;

@end


#define kCellHeight 44

#define kCellName @"ConfirmMonthlyPlanTableViewCell"

@implementation ConfirmMonthlyPlanViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[ImportToOrderPlanListService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewDidLoad {
    
    self.title = @"订单确认";
    
    [super viewDidLoad];
    
    [self registerCell];
    
    [self dealWithData];
}


- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
    _scrollContentViewHeight.constant = _customerViewHeight.constant +
    _addressViewHeight.constant +
    _productViewHeight.constant;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 事件

- (IBAction)confirmOnclick {
    
    
    
    [_service setConfirmData:nil andProducts:_productsOfLocal andTempTotalQTY:_promotionOrder.TOTAL_QTY andDate:nil andRemark:@"备注" andPromotionOrder:_promotionOrder andSelectPronotionDetails:_promotionDetailsOfServer];
    
    NSString *promotionOrderStr = [self promotionOrderModelTransfromNSString:_promotionOrder];
    
    if([promotionOrderStr isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"订单处理异常"];
    } else {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service ImportToOrderPlanList:promotionOrderStr];
    }
}


#pragma mark - 功能函数

- (void)registerCell {
    
    // 注册Cell
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)dealWithData {
    
    CGFloat tableViewHeight = 0;
    for (int i = 0; i < _promotionDetailsOfServer.count; i++) {
        
        PromotionDetailModel *m = _promotionDetailsOfServer[i];
        CGFloat oneLineHeight = [Tools getHeightOfString:@"fds" fontSize:13 andWidth:999.9];
        
        m.cellHeight = kCellHeight;
        tableViewHeight += m.cellHeight;
    }
    
    // 设置产品信息高度
    _productViewHeight.constant = tableViewHeight;
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return _promotionDetailsOfServer.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        PromotionDetailModel *m = _promotionDetailsOfServer[indexPath.row];
        return m.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 界面处理
    static NSString *cellId = kCellName;
    ConfirmMonthlyPlanTableViewCell *cell = (ConfirmMonthlyPlanTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    // 获取数据
    PromotionDetailModel *m = _promotionDetailsOfServer[indexPath.row];
    cell.promotionDetailM = m;
    
    // 返回Cell
    return cell;
}


#pragma mark - 不明觉历函数

- (NSString *)promotionOrderModelTransfromNSString:(PromotionOrderModel *)p {
    
    NSMutableArray *OrderDetails = [self promotionDetailModelTransfromNSString:p.OrderDetails];
    NSMutableArray *GiftClasses = [[NSMutableArray alloc] init];
    
    @try {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              @(p.ACT_PRICE), @"ACT_PRICE",
                              p.ADD_DATE, @"ADD_DATE",
                              _app.business.BUSINESS_IDX, @"BUSINESS_IDX",
                              @(p.BUSINESS_TYPE), @"BUSINESS_TYPE",
                              p.CONSIGNEE_REMARK, @"CONSIGNEE_REMARK",
                              p.EDIT_DATE, @"EDIT_DATE",
                              @(9008), @"ENT_IDX",
                              p.FROM_ADDRESS, @"FROM_ADDRESS",
                              p.FROM_CITY, @"FROM_CITY",
                              p.FROM_CNAME, @"FROM_CNAME",
                              p.FROM_CODE, @"FROM_CODE",
                              p.FROM_COUNTRY, @"FROM_COUNTRY",
                              p.FROM_CSMS, @"FROM_CSMS",
                              p.FROM_CTEL, @"FROM_CTEL",
                              @(p.FROM_IDX), @"FROM_IDX",
                              p.FROM_NAME, @"FROM_NAME",
                              p.FROM_PROPERTY, @"FROM_PROPERTY",
                              p.FROM_PROVINCE, @"FROM_PROVINCE",
                              p.FROM_REGION, @"FROM_REGION",
                              p.FROM_ZIP, @"FROM_ZIP",
                              p.GROUP_NO, @"GROUP_NO",
                              GiftClasses, @"GiftClasses",
                              p.HAVE_GIFT, @"HAVE_GIFT",
                              @(p.IDX), @"IDX",
                              @(p.MJ_PRICE), @"MJ_PRICE",
                              p.MJ_REMARK, @"MJ_REMARK",
                              @(p.OPERATOR_IDX), @"OPERATOR_IDX",
                              p.ORD_NO, @"ORD_NO",
                              p.ORD_NO_CLIENT, @"ORD_NO_CLIENT",
                              p.ORD_NO_CONSIGNEE, @"ORD_NO_CONSIGNEE",
                              p.ORD_STATE, @"ORD_STATE",
                              _partyId, @"ORG_IDX",
                              @(p.ORG_PRICE), @"ORG_PRICE",
                              OrderDetails, @"OrderPlanDetails",
                              p.PARTY_IDX, @"PARTY_IDX",
                              p.PAYMENT_TYPE, @"PAYMENT_TYPE",
                              p.REQUEST_DELIVERY, @"REQUEST_DELIVERY",
                              p.REQUEST_ISSUE, @"REQUEST_ISSUE",
                              @(p.TOTAL_QTY), @"ORD_QTY",
                              @(p.TOTAL_VOLUME), @"ORD_VOLUME",
                              @(p.TOTAL_WEIGHT), @"ORD_WEIGHT",
                              p.TO_ADDRESS, @"TO_ADDRESS",
                              p.TO_CITY, @"TO_CITY",
                              p.TO_CNAME, @"TO_CNAME",
                              p.TO_CODE, @"TO_CODE",
                              p.TO_COUNTRY, @"TO_COUNTRY",
                              p.TO_CSMS, @"TO_CSMS",
                              p.TO_CTEL, @"TO_CTEL",
                              _orderAddressIdx, @"TO_IDX",
                              p.TO_NAME, @"TO_NAME",
                              p.TO_PROPERTY, @"TO_PROPERTY",
                              p.TO_PROVINCE, @"TO_PROVINCE",
                              p.TO_REGION, @"TO_REGION",
                              p.TO_ZIP, @"TO_ZIP",
                              nil];
        
        NSString *s = [Tools JsonStringWithDictonary:dict];
        return s;
    } @catch (NSException *exception) {
        return @"";
    }
}


- (NSMutableArray *)promotionDetailModelTransfromNSString:(NSMutableArray *)ps {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    @try {
        for(int i = 0; i < ps.count; i++) {
            PromotionDetailModel *p = ps[i];
            NSDictionary *dict = nil;
            if([p.PRODUCT_TYPE isEqualToString:@"NR"]) {
                dict = [NSDictionary dictionaryWithObjectsAndKeys:
                        @(p.ACT_PRICE), @"ACT_PRICE",
                        p.ADD_DATE, @"ADD_DATE",
                        p.EDIT_DATE, @"EDIT_DATE",
                        @(p.ENT_IDX), @"ENT_IDX",
                        @(p.IDX), @"IDX",
                        @(p.LINE_NO), @"LINE_NO",
                        p.LOTTABLE01, @"LOTTABLE01",
                        p.LOTTABLE02, @"LOTTABLE02",
                        p.LOTTABLE03, @"LOTTABLE03",
                        p.LOTTABLE04, @"LOTTABLE04",
                        p.LOTTABLE05, @"LOTTABLE05",
                        p.LOTTABLE06, @"LOTTABLE06",
                        p.LOTTABLE07, @"LOTTABLE07",
                        p.LOTTABLE08, @"LOTTABLE08",
                        p.LOTTABLE09, @"LOTTABLE09",
                        p.LOTTABLE10, @"LOTTABLE10",
                        @(p.LOTTABLE11), @"LOTTABLE11",
                        @(p.LOTTABLE12), @"LOTTABLE12",
                        @(p.LOTTABLE13), @"LOTTABLE13",
                        @(p.MJ_PRICE), @"MJ_PRICE",
                        p.MJ_REMARK, @"MJ_REMARK",
                        @(p.OPERATOR_IDX), @"OPERATOR_IDX",
                        @(p.ORDER_IDX), @"ORDER_IDX",
                        @(p.ORG_PRICE), @"ORG_PRICE",
                        @(p.PO_QTY), @"PO_QTY",
                        p.PO_UOM, @"PO_UOM",
                        @(p.PO_VOLUME), @"PO_VOLUME",
                        @(p.PO_WEIGHT), @"PO_WEIGHT",
                        @(p.PRODUCT_IDX), @"PRODUCT_IDX",
                        p.PRODUCT_NAME, @"PRODUCT_NAME",
                        p.PRODUCT_NO, @"PRODUCT_NO",
                        p.PRODUCT_TYPE, @"PRODUCT_TYPE",
                        p.PRODUCT_URL, @"PRODUCT_URL",
                        p.SALE_REMARK, @"SALE_REMARK",
                        nil];
            } else {
                
                dict = [[NSDictionary alloc] init];
            }
            
            NSString *s = [Tools JsonStringWithDictonary:dict];
            [array addObject:s];
        }
    } @catch (NSException *exception) {
        
        return [[NSMutableArray alloc] init];
    }
    
    return array;
}


#pragma mark - ImportToOrderPlanListServiceDelegate

- (void)successOfImportToOrderPlanList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"提交成功!"];
    [_confirmBtn setEnabled:NO];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.navigationController popToRootViewControllerAnimated:YES];
        });
    });
}


- (void)failureOfImportToOrderPlanList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [Tools showAlert:self.view andTitle:msg ? msg : @"提交失败"];
}

@end
