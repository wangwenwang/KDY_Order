//
//  AddPartyVisitViewController.m
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "AddPartyVisitViewController.h"
#import "LMPickerView.h"
#import "AppDelegate.h"
#import "TimeLabel.h"
#import "Tools.h"
#import "LM_alert.h"
#import "AddPartyVisitLabel.h"
#import <BMKLocationkit/BMKLocationComponent.h>
#import <BMKLocationkit/BMKLocationAuth.h>
#import "GetPartyVisitInsertService.h"
#import "GetPartyVisitListViewController.h"
#import "CustomerListViewController.h"
#import "GetPartyVisitUpdateService.h"
#import <MBProgressHUD.h>
#import "GetVisitEnterShopViewController.h"
#import "GetVisitConfirmCustomerViewController.h"
#import "GetVisitCheckInventoryViewController.h"
#import "GetVisitRecommendedOrderViewController.h"
#import "GetVisitEnterShopService.h"


@interface AddPartyVisitViewController ()<LMPickerViewDelegate, BMKLocationManagerDelegate, BMKLocationAuthDelegate, GetPartyVisitInsertServiceDelegate, GetPartyVisitUpdateServiceDelegate, GetVisitEnterShopServiceDelegate>


// 拜访日期
@property (weak, nonatomic) IBOutlet TimeLabel *VISIT_DATE;

// 拜访日期 下划线
@property (weak, nonatomic) IBOutlet UIView *VISIT_DATE_line;

// 客户代码
@property (weak, nonatomic) IBOutlet UILabel *PARTY_CODE;

// 客户名称
@property (weak, nonatomic) IBOutlet UILabel *PARTY_NAME;

// 联系人名
@property (weak, nonatomic) IBOutlet UILabel *CONTACT_PERSON;

// 地址代码
@property (weak, nonatomic) IBOutlet UILabel *CONTACT_TEL;

// 地址详情
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_INFO;

// 客户等级
@property (weak, nonatomic) IBOutlet UILabel *PARTY_LEVEL;

// 客户状态码
@property (weak, nonatomic) IBOutlet UILabel *PARTY_STATES;

// 渠道
@property (weak, nonatomic) IBOutlet UILabel *CHANNEL;

// 拜访线路
@property (weak, nonatomic) IBOutlet UILabel *LINE;

// 每周拜访频率
@property (weak, nonatomic) IBOutlet UILabel *WEEKLY_VISIT_FREQUENCY;

// 单店销量/天
@property (weak, nonatomic) IBOutlet UILabel *SINGLE_STORE_SALES;

// 达成情况
@property (weak, nonatomic) IBOutlet UITextView *REACH_THE_SITUATION;

// 达成情况placeholder
@property (weak, nonatomic) IBOutlet UILabel *REACH_THE_SITUATION_PlaceholderLabel;

// 确认按钮
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

// 内容总高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

// 拜访日期高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *VISIT_DATEHeight;

// 客户信息高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *partyViewHeight;

// 客户地址高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addressViewHeight;

// 其它信息高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherMsgHeight;

// 确认按钮高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *confirmBtnHeight;

// 时间选择器
@property (strong, nonatomic)LMPickerView *LM;

// 时间格式 yyyy-MM-dd
@property (strong, nonatomic) NSDateFormatter *formatter_dd;

// 时间格式 yyyy-MM-dd HH:mm:ss
@property (strong, nonatomic) NSDateFormatter *formatter_ss;

// 全局变量
@property (strong, nonatomic) AppDelegate *app;

// 网络层 添加客户拜访
@property (strong, nonatomic) GetPartyVisitInsertService *service_add;

// 修改客户信息
@property (weak, nonatomic) IBOutlet UIView *PARTY_Modify_View;

// 客户名称
@property (weak, nonatomic) IBOutlet UITextField *PARTY_NAME_F;

// 地址详情
@property (weak, nonatomic) IBOutlet UITextField *ADDRESS_INFO_F;

// 联系人名
@property (weak, nonatomic) IBOutlet UITextField *CONTACT_PERSON_F;

// 联系电话
@property (weak, nonatomic) IBOutlet UITextField *CONTACT_TEL_F;

// 网络层
@property (strong, nonatomic) GetVisitEnterShopService *service_enter;


@end

@implementation AddPartyVisitViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service_add = [[GetPartyVisitInsertService alloc] init];
        _service_add.delegate = self;
        
        _service_enter = [[GetVisitEnterShopService alloc] init];
        _service_enter.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        _formatter_dd = [[NSDateFormatter alloc] init];
        [_formatter_dd setDateFormat:@"yyyy-MM-dd"];
        
        _formatter_ss = [[NSDateFormatter alloc] init];
        [_formatter_ss setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        _LM = [[LMPickerView alloc] init];
        _LM.delegate = self;
        [_LM initDatePicker];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _VISIT_DATE.time = @"";
    _VISIT_DATE.text = @"拜访日期：";
    
    _confirmBtn.layer.cornerRadius = 20;
    _confirmBtn.layer.shadowOffset =  CGSizeMake(0, 3);
    _confirmBtn.layer.shadowOpacity = 0.5;
    _confirmBtn.layer.shadowColor =  [UIColor redColor].CGColor;
    
    [self initUI];
    [self addRightBtn];
    
    // 新建拜访
    self.title = @"新建拜访";
    _confirmBtn.tag = 10086;
    
    // 默认当天，有日期就直接覆盖
    [_VISIT_DATE_line removeFromSuperview];
    _VISIT_DATE.text = [NSString stringWithFormat:@"拜访日期：%@", [Tools getCurrentDate_yyyy_mm_dd]];
    _VISIT_DATE.date = [NSDate date];
    _VISIT_DATE.time = [Tools getCurrentDate_yyyy_mm_dd];
    if(![_pvItemM.vISITDATE isEqualToString:@""]) {
        
        NSDate *date = [Tools dateFromString:_pvItemM.vISITDATE];
        _VISIT_DATE.text = [NSString stringWithFormat:@"拜访日期：%@", [_formatter_dd stringFromDate:date]];
    }
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
    _scrollContentViewHeight.constant = _VISIT_DATEHeight.constant + _partyViewHeight.constant + _addressViewHeight.constant + _otherMsgHeight.constant + _confirmBtnHeight.constant + 30;
}

#pragma mark - 事件

- (IBAction)confirmOnclick:(UIButton *)sender {
    
    if([Tools isEmpty:_pvItemM.bUSINESSIDX]) {
        
        [Tools showAlert:self.view andTitle:@"业务代码不能为空"];
        return;
    }
    if([Tools isEmpty:_partyM.PARTY_CODE]) {
        
        [Tools showAlert:self.view andTitle:@"客户代码不能为空"];
        return;
    }
    if([Tools isEmpty:_partyM.PARTY_NAME]) {
        
        [Tools showAlert:self.view andTitle:@"客名称不能为空"];
        return;
    }
    if([Tools isEmpty:_addressM.CONTACT_PERSON]) {
        
        [Tools showAlert:self.view andTitle:@"客户联系人不能为空"];
        return;
    }
    if([Tools isEmpty:_addressM.CONTACT_TEL]) {
        
        [Tools showAlert:self.view andTitle:@"客户联系电话不能为空"];
        return;
    }
    if([Tools isEmpty:_addressM.ADDRESS_INFO]) {
        
        [Tools showAlert:self.view andTitle:@"客户地址"];
        return;
    }
    // 拜访日期
    NSString *VISIT_DATE = _VISIT_DATE.date ? [_formatter_ss stringFromDate:_VISIT_DATE.date] : @"";
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if(sender.tag == 10086) {
        
        // 新建拜访
        [_service_add GetPartyVisitInsert:_partyM.PARTY_CODE
                            andPARTY_NAME:_partyM.PARTY_NAME
                              andCONTACTS:_addressM.CONTACT_PERSON
                          andCONTACTS_TEL:_addressM.CONTACT_TEL
                         andPARTY_ADDRESS:_addressM.ADDRESS_INFO
                             andUSER_NAME:_app.user.USER_NAME
                               andUSER_NO:_app.user.USER_CODE
                               andCHANNEL:_CHANNEL.text
                           andPARTY_LEVEL:_PARTY_LEVEL.text
                andWEEKLY_VISIT_FREQUENCY:_WEEKLY_VISIT_FREQUENCY.text
                            andVISIT_DATE:VISIT_DATE
                          andOPERATOR_IDX:_app.user.IDX
                          andPARTY_STATES:_PARTY_STATES.text
                   andREACH_THE_SITUATION:_REACH_THE_SITUATION.text
                          andBUSINESS_IDX:_pvItemM.bUSINESSIDX
                      andORGANIZATION_IDX: @"2"
                                  andLINE:_LINE.text];
    }else if(sender.tag == 10087) {
        
        // 修改拜访
        //        GetPartyVisitUpdateService *service_update = [[GetPartyVisitUpdateService alloc] init];
        //        service_update.delegate = self;
        //        [service_update GetPartyVisitUpdate:_pvItemM.iDX
        //                                andPARTY_NO:_partyM.PARTY_CODE
        //                              andPARTY_NAME:_partyM.PARTY_NAME
        //                                andCONTACTS:_addressM.CONTACT_PERSON
        //                            andCONTACTS_TEL:_addressM.CONTACT_TEL
        //                           andPARTY_ADDRESS:_addressM.ADDRESS_INFO
        //                               andUSER_NAME: @""
        //                                 andUSER_NO: @""
        //                              andCHANNEL_NO: @""
        //                             andPARTY_LEVEL:_PARTY_LEVEL.text
        //                  andWEEKLY_VISIT_FREQUENCY:_WEEKLY_VISIT_FREQUENCY.text
        //                              andVISIT_DATE:VISIT_DATE
        //                            andOPERATOR_IDX:_app.user.IDX
        //                            andPARTY_STATES:_PARTY_STATES.text
        //                           andNECESSARY_SKU: @""
        //                      andSINGLE_STORE_SALES: @""
        //                        andVISIT_THE_TARGET: @""
        //                     andREACH_THE_SITUATION:_REACH_THE_SITUATION.text
        //                            andBUSINESS_IDX:_app.business.BUSINESS_IDX
        //                        andORGANIZATION_IDX:@"2"
        //         andLINE:_LINE.text];
    }
}


// 跳转至步骤页面
- (void)rightBtnOnclick {
    
    [_PARTY_Modify_View setHidden:NO];
    self.navigationItem.rightBarButtonItem = nil;
    _PARTY_NAME_F.text = _pvItemM.pARTYNAME;
    _ADDRESS_INFO_F.text = _addressM.ADDRESS_INFO;
    _CONTACT_PERSON_F.text = _addressM.CONTACT_PERSON;
    _CONTACT_TEL_F.text = _addressM.CONTACT_TEL;
}


- (IBAction)cancelModityOnclick {
    
    [self addRightBtn];
    [self.view endEditing:YES];
    [_PARTY_Modify_View setHidden:YES];
}


- (IBAction)confirmModityOnclick {
    
    [self addRightBtn];
    [self.view endEditing:YES];
    [_PARTY_Modify_View setHidden:YES];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_service_enter GetVisitConfirmCustomer:_pvItemM.iDX andStrUserIDX:_app.user.IDX andStrPartyName:_PARTY_NAME_F.text andStrAddress:_ADDRESS_INFO_F.text andStrContacts:_CONTACT_PERSON_F.text andStrContactsTel:_CONTACT_TEL_F.text andStrChange:@"true" andStrBussenIdx:_pvItemM.bUSINESSIDX  andStrPartyCode:_partyM.PARTY_CODE];
}



#pragma mark - 手势

- (IBAction)VISIT_DATE_onclick:(UITapGestureRecognizer *)sender {
    
    //    [self.view endEditing:YES];
    //
    //    NSDate *maxDate = [_formatter_ss dateFromString:[Tools getCurrentBeforeDate_Second:365 * 2 * 24 * 60 * 60]];
    //
    //    NSDate *defaultDate = nil;
    //    if([_VISIT_DATE.time isEqualToString:@""]) {
    //
    //        defaultDate = [NSDate date];
    //    } else {
    //
    //        defaultDate = [_formatter_dd dateFromString:_VISIT_DATE.time];
    //    }
    //
    //    NSDate *minDate = [_formatter_ss dateFromString:[Tools getCurrentBeforeDate_Second:-365 * 10 * 24 * 60 * 60]];
    //
    //    [self createDatePicker:defaultDate andMaxDate:maxDate andMinDate:minDate];
}


- (IBAction)LINE_onclick:(UITapGestureRecognizer *)sender {
    
    [self.view endEditing:YES];
    [LM_alert showLMAlertViewWithTitle:@"选择线路" message:@"" cancleButtonTitle:@"取消" okButtonTitle:nil otherButtonTitleArray:_lines clickHandle:^(NSInteger index) {
        
        if(index >= 1) {
            
            _LINE.text = _lines[index - 1];
        }
    }];
}


#pragma mark - 功能函数

- (void)initUI {
    
    _PARTY_CODE.text = _partyM.PARTY_CODE;
    _PARTY_NAME.text = _partyM.PARTY_NAME;
    _PARTY_LEVEL.text = _partyM.PARTY_LEVEL;
    _PARTY_STATES.text = _partyM.PARTY_STATES;
    _CHANNEL.text = _partyM.CHANNEL;
    _LINE.text = _partyM.LINE;
    _WEEKLY_VISIT_FREQUENCY.text = _partyM.WEEKLY_VISIT_FREQUENCY;
    _SINGLE_STORE_SALES.text = _partyM.SINGLE_STORE_SALES;
    
    _CONTACT_PERSON.text = _addressM.CONTACT_PERSON;
    _CONTACT_TEL.text = _addressM.CONTACT_TEL;
    _ADDRESS_INFO.text = _addressM.ADDRESS_INFO;
    
    // 地址信息换行
    CGFloat oneHeight = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:MAXFLOAT];
    CGFloat mulHeight = [Tools getHeightOfString:_addressM.ADDRESS_INFO fontSize:14 andWidth:ScreenWidth - 10 - 8 - 65 - 3 - 10];
    CGFloat overHeight = mulHeight - oneHeight * 2;
    if(overHeight >= 0) {
        _addressViewHeight.constant += overHeight;
    }
}


- (void)addRightBtn {
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnOnclick)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}


#pragma mark - 时间模块

- (void)PickerViewComplete:(NSDate *)date {
    
    _VISIT_DATE.date = date;
    _VISIT_DATE.time = [_formatter_dd stringFromDate:date];
    _VISIT_DATE.text = [NSString stringWithFormat:@"%@%@", @"拜访日期：", [_formatter_dd stringFromDate:date]];
    [_VISIT_DATE_line removeFromSuperview];
}


- (void)createDatePicker:(NSDate *)defaultDate andMaxDate:(NSDate *)maxDate andMinDate:(NSDate *)minDate {
    
    _LM.date = defaultDate;
    _LM.maximumDate = maxDate;
    _LM.minimumDate = minDate;
    [_LM showDatePicker];
}

#pragma mark - GetVisitEnterShopServiceDelegate

- (void)successOfGetVisitConfirmCustomer:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    
    _pvItemM.pARTYNAME = _PARTY_NAME_F.text;
    _addressM.ADDRESS_INFO = _ADDRESS_INFO_F.text;
    _addressM.CONTACT_PERSON = _CONTACT_PERSON_F.text;
    _addressM.CONTACT_TEL = _CONTACT_TEL_F.text;
    
    _partyM.PARTY_NAME = _PARTY_NAME_F.text;
    _pvItemM.pARTYADDRESS = _ADDRESS_INFO_F.text;
    _pvItemM.cONTACTS = _CONTACT_PERSON_F.text;
    _pvItemM.cONTACTSTEL = _CONTACT_TEL_F.text;
    
    [self initUI];
}


- (void)failureOfGetVisitConfirmCustomer:(NSString *)msg {
    
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
        [_REACH_THE_SITUATION_PlaceholderLabel setHidden:YES];
    }
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
        [_REACH_THE_SITUATION_PlaceholderLabel setHidden:NO];
    }
    return YES;
}

#pragma mark - GetPartyVisitInsertServiceDelegate

- (void)successOfGetPartyVisitInsertService:(NSString *)msg andVISIT_IDX:(NSString *)VISIT_IDX {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _pvItemM.vISITIDX = VISIT_IDX;
    NSLog(@"----------%@", VISIT_IDX);
    
    GetVisitEnterShopViewController *vc = [[GetVisitEnterShopViewController alloc] init];
    vc.pvItemM = _pvItemM;
    [self.navigationController pushViewController:vc animated:YES];
    
//    NSArray *array = self.navigationController.viewControllers;
//    for (UIViewController *vc in array) {
//
//        if([vc isMemberOfClass:[GetPartyVisitListViewController class]]) {
//
//            [[NSNotificationCenter defaultCenter] postNotificationName:kGetPartyVisitListViewController_receiveMsg object:nil userInfo:@{@"msg" : msg}];
//            [self.navigationController popToViewController:vc animated:YES];
//        }
//    }
    
}


- (void)failureOfGetPartyVisitInsertService:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}


#pragma mark - GetPartyVisitUpdateServiceDelegate

- (void)successOfGetPartyVisitUpdateService:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSArray *array = self.navigationController.viewControllers;
    for (UIViewController *vc in array) {
        
        if([vc isMemberOfClass:[GetPartyVisitListViewController class]]) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:kGetPartyVisitListViewController_receiveMsg object:nil userInfo:@{@"msg" : msg}];
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}

- (void)failureOfGetPartyVisitUpdateService:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
