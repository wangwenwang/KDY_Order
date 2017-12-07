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
#import "TimeLabel.h"
#import "LMPickerView.h"
#import "MonthlyPlanViewController.h"

@interface ConfirmMonthlyPlanViewController ()<ImportToOrderPlanListServiceDelegate, LMPickerViewDelegate>

// 网络层
@property (strong, nonatomic) ImportToOrderPlanListService *service;

// 月份信息
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dateInfoViewHeight;

// 客户信息
@property (weak, nonatomic) IBOutlet UILabel *PARTY_TYPE;
@property (weak, nonatomic) IBOutlet UILabel *PARTY_CODE;
@property (weak, nonatomic) IBOutlet UILabel *PARTY_CITY;
@property (weak, nonatomic) IBOutlet UILabel *PARTY_NAME;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *customerViewHeight;

// 地址信息高度
@property (weak, nonatomic) IBOutlet UILabel *CONTACT_PERSON;
@property (weak, nonatomic) IBOutlet UILabel *CONTACT_TEL;
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_INFO;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addressViewHeight;

// 物品列表
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// 物品信息高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *productViewHeight;

// 滑动视图高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

// 提交按钮
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

// 全局变量
@property (strong, nonatomic) AppDelegate *app;

// 时间控件
@property (strong, nonatomic)LMPickerView *LM;
// 时间格式 yyyy-MM
@property (strong, nonatomic) NSDateFormatter *formatter_mm;
// 时间Label
@property (weak, nonatomic) IBOutlet TimeLabel *REQUEST_ISSUE;
// 时间输入线
@property (weak, nonatomic) IBOutlet UIView *REQUEST_ISSUE_line;
// 月份距左
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *REQUEST_ISSUE_leading;

@end


#define kCellHeight 65

#define kCellName @"ConfirmMonthlyPlanTableViewCell"


@implementation ConfirmMonthlyPlanViewController

#pragma mark - 生命周期

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[ImportToOrderPlanListService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        _formatter_mm = [[NSDateFormatter alloc] init];
        [_formatter_mm setDateFormat:@"yyyy-MM"];
        
        _LM = [[LMPickerView alloc] init];
        _LM.delegate = self;
        [_LM initDatePicker];
    }
    return self;
}


- (void)viewDidLoad {
    
    self.title = @"订单确认";
    
    [super viewDidLoad];
    
    [self fullUI];
    
    [self registerCell];
    
    [self dealWithData];
    
    // 让月份站位居中
    CGFloat REQUEST_ISSUE_width = CGRectGetWidth(_REQUEST_ISSUE.frame);
    CGFloat REQUEST_ISSUE_line_width = CGRectGetWidth(_REQUEST_ISSUE_line.frame);
    _REQUEST_ISSUE_leading.constant = (ScreenWidth - REQUEST_ISSUE_width - REQUEST_ISSUE_line_width) / 2;
}


- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
    _scrollContentViewHeight.constant = _dateInfoViewHeight.constant + _customerViewHeight.constant + _addressViewHeight.constant + _productViewHeight.constant + 70;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 手势

// 库存月份
- (IBAction)REQUEST_ISSUE_DATE_onclick {
    
    NSDate *maxDate = nil;
    NSDate *defaultDate = nil;
    if(!_REQUEST_ISSUE.date) {
        
        defaultDate = [NSDate date];
    } else {
        
        defaultDate = _REQUEST_ISSUE.date;
    }
    NSDate *minDate = [NSDate date];
    
    _LM.date = defaultDate;
    _LM.maximumDate = maxDate;
    _LM.minimumDate = minDate;
    _LM.dateType = @"yyyy-MM";
    [_LM showDatePicker];
}


#pragma mark - 事件

- (IBAction)confirmOnclick {
    
    if(_REQUEST_ISSUE.date) {
        
        [_service setConfirmData:nil andProducts:_productsOfLocal andTempTotalQTY:_promotionOrder.TOTAL_QTY andDate:_REQUEST_ISSUE.date andRemark:@"备注" andPromotionOrder:_promotionOrder andSelectPronotionDetails:_promotionDetailsOfServer];
        
        NSString *promotionOrderStr = [_service promotionOrderModelTransfromNSString:_promotionOrder andpartyId:_party.IDX andorderAddressIdx:_address.IDX];
        
        if([promotionOrderStr isEqualToString:@""]) {
            
            [Tools showAlert:self.view andTitle:@"订单处理异常"];
        } else {
            
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [_service ImportToOrderPlanList:promotionOrderStr];
        }
    } else {
        
        [Tools showAlert:self.view andTitle:@"请填写订单月份"];
    }
}


#pragma mark - 功能函数

- (void)registerCell {
    
    // 注册Cell
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


- (void)fullUI {
    
    _PARTY_TYPE.text = _party.PARTY_TYPE;
    _PARTY_CODE.text = _party.PARTY_CODE;
    _PARTY_CITY.text = _party.PARTY_CITY;
    _PARTY_NAME.text = _party.PARTY_NAME;
    CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:MAXFLOAT];
    CGFloat mulLine = [Tools getHeightOfString:_PARTY_NAME.text fontSize:14 andWidth:ScreenWidth - 8 - 65 - 3];
    _customerViewHeight.constant += (mulLine - oneLine);
    
    _CONTACT_PERSON.text = _address.CONTACT_PERSON;
    _CONTACT_TEL.text = _address.CONTACT_TEL;
    _ADDRESS_INFO.text = _address.ADDRESS_INFO;
    oneLine = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:MAXFLOAT];
    mulLine = [Tools getHeightOfString:_ADDRESS_INFO.text fontSize:14 andWidth:ScreenWidth - 8 - 65 - 3];
    _addressViewHeight.constant += (mulLine - oneLine);
}


- (void)dealWithData {
    
    CGFloat tableViewHeight = 0;
    for (int i = 0; i < _promotionDetailsOfServer.count; i++) {
        
        PromotionDetailModel *m = _promotionDetailsOfServer[i];
        CGFloat oneLineHeight = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:MAXFLOAT];
        CGFloat mulLineHeight = [Tools getHeightOfString:m.PRODUCT_NAME fontSize:14 andWidth:ScreenWidth - 8 - 36.5 - 3];
        
        m.cellHeight = kCellHeight + (mulLineHeight - oneLineHeight);
        tableViewHeight += m.cellHeight;
    }
    _productViewHeight.constant = 20 + tableViewHeight;
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


#pragma mark - ImportToOrderPlanListServiceDelegate

- (void)successOfImportToOrderPlanList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"提交成功!"];
    [_confirmBtn setEnabled:NO];
    
    // 找到nav上两层 并pop
    MonthlyPlanViewController *listVc = nil;
    for (int i = 0; i < self.navigationController.viewControllers.count; i++) {
        
        UIViewController *vc = self.navigationController.viewControllers[i];
        if([vc isKindOfClass:[MonthlyPlanViewController class]]) {
            
            listVc = (MonthlyPlanViewController *)vc;
            break;
        }
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kMonthlyPlanViewController_receiveMsg object:nil userInfo:@{@"msg":msg}];
    [self.navigationController popToViewController:listVc animated:YES];
}


- (void)failureOfImportToOrderPlanList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg ? msg : @"提交失败"];
}


#pragma mark - 时间模块

- (void)PickerViewComplete:(NSDate *)date {
    
    _REQUEST_ISSUE.text = [NSString stringWithFormat:@"%@%@", @"订单月份: ", [_formatter_mm stringFromDate:date]];
    _REQUEST_ISSUE.date = date;
    
    [_REQUEST_ISSUE sizeToFit];
    [_REQUEST_ISSUE_line setHidden:YES];
    CGFloat REQUEST_ISSUE_width = CGRectGetWidth(_REQUEST_ISSUE.frame);
    _REQUEST_ISSUE_leading.constant = (ScreenWidth - REQUEST_ISSUE_width) / 2;
}

@end
