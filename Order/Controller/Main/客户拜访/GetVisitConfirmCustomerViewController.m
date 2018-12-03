//
//  GetVisitConfirmCustomerViewController.m
//  Order
//
//  Created by wenwang wang on 2018/11/20.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetVisitConfirmCustomerViewController.h"
#import "GetVisitEnterShopService.h"
#import "AppDelegate.h"
#import "LM_alert.h"
#import "Tools.h"
#import <MBProgressHUD.h>
#import "GetVisitCheckInventoryViewController.h"

@interface GetVisitConfirmCustomerViewController ()<GetVisitEnterShopServiceDelegate>

// 客户名称
@property (weak, nonatomic) IBOutlet UILabel *PARTY_NAME;

// 地址详情
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_INFO;

// 联系人名
@property (weak, nonatomic) IBOutlet UILabel *CONTACT_PERSON;

// 联系电话
@property (weak, nonatomic) IBOutlet UILabel *CONTACT_TEL;

// 客户名称
@property (weak, nonatomic) IBOutlet UITextField *PARTY_NAME_F;

// 地址详情
@property (weak, nonatomic) IBOutlet UITextField *ADDRESS_INFO_F;

// 联系人名
@property (weak, nonatomic) IBOutlet UITextField *CONTACT_PERSON_F;

// 联系电话
@property (weak, nonatomic) IBOutlet UITextField *CONTACT_TEL_F;

// 修改客户信息视图
@property (weak, nonatomic) IBOutlet UIView *UpdateView;

// 网络层
@property (strong, nonatomic) GetVisitEnterShopService *service;

@property (strong, nonatomic) AppDelegate *app;

// 确认修改 或 下一步
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation GetVisitConfirmCustomerViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[GetVisitEnterShopService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"确认信息";
    
    [self initUI];
    
    [_UpdateView setAlpha:0];
    
    [self addRightBtn];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 事件

- (IBAction)nextOnclick {
    
    if([[_nextBtn titleForState:UIControlStateNormal] isEqualToString:@"确认修改"]) {
        
        [LM_alert showLMAlertViewWithTitle:@"确认修改客户信息吗？" message:@"" cancleButtonTitle:@"取消" okButtonTitle:@"确认" okClickHandle:^{
            
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [_service GetVisitConfirmCustomer:_pvItemM.iDX andStrUserIDX:_app.user.IDX andStrPartyName:_PARTY_NAME_F.text andStrAddress:_ADDRESS_INFO_F.text andStrContacts:_CONTACT_PERSON_F.text andStrContactsTel:_CONTACT_TEL_F.text andStrChange:@"true" andStrBussenIdx:@"" andStrPartyCode:_pvItemM.pARTYNO];
        } cancelClickHandle:^{
            
        }];
    }else if([[_nextBtn titleForState:UIControlStateNormal] isEqualToString:@"下一步"]) {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service GetVisitConfirmCustomer:_pvItemM.iDX andStrUserIDX:_app.user.IDX andStrPartyName:_PARTY_NAME.text andStrAddress:_ADDRESS_INFO.text andStrContacts:_CONTACT_PERSON.text andStrContactsTel:_CONTACT_TEL.text andStrChange:@"false" andStrBussenIdx:_app.business.BUSINESS_IDX andStrPartyCode:_partyM.PARTY_CODE];
    }
}


#pragma mark - 功能函数

- (void)initUI {
    
    _PARTY_NAME.text = _partyM.PARTY_NAME;
    _ADDRESS_INFO.text = _addressM.ADDRESS_INFO;
    _CONTACT_PERSON.text = _addressM.CONTACT_PERSON;
    _CONTACT_TEL.text = _addressM.CONTACT_TEL;
    
    _PARTY_NAME_F.text = _partyM.PARTY_NAME;
    _ADDRESS_INFO_F.text = _addressM.ADDRESS_INFO;
    _CONTACT_PERSON_F.text = _addressM.CONTACT_PERSON;
    _CONTACT_TEL_F.text = _addressM.CONTACT_TEL;
}


- (void)addRightBtn {
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnOnclick)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}


// 修改客户信息
- (void)rightBtnOnclick {
    
    [_PARTY_NAME_F becomeFirstResponder];
    [_nextBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        [_UpdateView setAlpha:1];
        
    } completion:^(BOOL finished) {
        
    }];
}


#pragma mark - GetVisitEnterShopServiceDelegate

- (void)successOfGetVisitConfirmCustomer:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    
    GetVisitCheckInventoryViewController *vc = [[GetVisitCheckInventoryViewController alloc] init];
    vc.pvItemM = _pvItemM;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)failureOfGetVisitConfirmCustomer:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
