//
//  AddPartyViewController.m
//  Order
//
//  Created by 凯东源 on 17/7/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "AddPartyViewController.h"
#import "AddPartyService.h"
#import <MBProgressHUD.h>
#import "AppDelegate.h"
#import "Tools.h"
#import "AddAddressService.h"
#import "LM_A_B_C_D.h"
#import "NormalAdressListViewController.h"
#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <AddressBook/ABPerson.h>
#import <AddressBookUI/ABPersonViewController.h>
#import <ContactsUI/ContactsUI.h>
#import "GetPartyVisitLineService.h"
#import "LM_alert.h"
#include <Masonry.h>
#import "LMDropDownMenuTableViewCell.h"
#import "DataItemModel.h"
#import "MakeOrderService.h"
#import "PartyTableViewCell.h"
#import "PartyModel.h"
#import "AddressModel.h"

// 拜访线路
#define kCellName_LINE @"LMDropDownMenuTableViewCell"

// 选择客户
#define kCellName_PARTY @"PartyTableViewCell"

@interface AddPartyViewController ()<AddPartyServiceDelegate, AddAddressServiceDelegate, ABPeoplePickerNavigationControllerDelegate, CNContactPickerDelegate, GetPartyVisitLineServiceDelegate, UITableViewDataSource, UITableViewDelegate, MakeOrderServiceDelegate>

/************ 添加客户 ************/

// 客户名称
@property (weak, nonatomic) IBOutlet UITextField *PARTY_NAME;

// 客户代码
@property (weak, nonatomic) IBOutlet UITextField *PARTY_CODE;

// 备注
@property (weak, nonatomic) IBOutlet UITextField *PARTY_REMARK;

// 网络层
@property (strong, nonatomic) AddPartyService *service;

// 全局变量
@property (strong, nonatomic) AppDelegate *app;

// 容器高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

// AddPartyM
@property (strong, nonatomic) AddPartyModel *AddPartyM;

// 渠道 数据
@property (nonatomic, strong) NSArray *channel;

// 拜访线路 数据
@property (nonatomic, strong) NSArray *lines;

// 渠道
@property (weak, nonatomic) IBOutlet UILabel *CHANNEL_NO;

// 拜访线路
@property (weak, nonatomic) IBOutlet UILabel *LINE;


/************ 添加地址 ************/

// 收货人
@property (weak, nonatomic) IBOutlet UITextField *nameF;


// 联系方式
@property (weak, nonatomic) IBOutlet UITextField *telF;


// 所在地区
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;


// 详细地址
@property (weak, nonatomic) IBOutlet UITextField *detailAddressLabel;


// 网络层
@property (strong, nonatomic) AddAddressService *service_addAddress;

// 网络层 获取渠道
@property (strong, nonatomic) GetPartyVisitLineService *service_getParty;

// 详细地址
@property (strong, nonatomic) LM_A_B_C_D *a_b_c_d;

// 统计ContentView高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *customerPromptViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *customerViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addressPromptViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addressViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *saveBtneight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *saveBtnBottomHeight;


@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UITableView *tableViewParty;

@property (strong, nonatomic) NSArray *MultiArrListTem;

@property (strong, nonatomic) NSArray *lastMultiArrListTem;

// 多选星期背景
@property (strong, nonatomic) UIView *mulAlertBg;

// 多选星期
@property (strong, nonatomic) UIView *mulAlert;

// 多选客户背景
@property (strong, nonatomic) UIView *mulPartyBg;

// 多选客户
@property (strong, nonatomic) UIView *mulParty;

// 多选客户数据
@property (strong, nonatomic) NSArray *MultiArrParty;

// 多选客户地址数据
@property (strong, nonatomic) NSArray *MultiArrPartyAddress;

// 获取上级客户
@property (strong, nonatomic) MakeOrderService *service_makeOrder;

@end


@implementation AddPartyViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[AddPartyService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        _service_addAddress = [[AddAddressService alloc] init];
        _service_addAddress.delegate = self;
        
        _service_getParty = [[GetPartyVisitLineService alloc] init];
        _service_getParty.delegate = self;
        
        _service_makeOrder = [[MakeOrderService alloc] init];
        _service_makeOrder.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"新建客户";
    
    _addBtn.layer.cornerRadius = 20;
    _addBtn.layer.shadowOffset =  CGSizeMake(0, 3);
    _addBtn.layer.shadowOpacity = 0.5;
    _addBtn.layer.shadowColor =  [UIColor redColor].CGColor;
    
    [self initUI];
    
    [self addNotification];
    
    // 请求渠道
    [_service_getParty GetPartyVisitChannel];
    
    // 拜访线路
    [_service_getParty GetPartyVisitLine];
}


- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
    // 客户提示 + 客户 + 地址提示 + 地址 + 保存按钮 + 保存按钮距下
    _saveBtnBottomHeight.constant = SafeAreaBottomHeight + 20;
    _scrollContentViewHeight.constant = _customerPromptViewHeight.constant + _customerViewHeight.constant + _addressPromptViewHeight.constant + _addressViewHeight.constant + _saveBtneight.constant + _saveBtnBottomHeight.constant;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    [self removeNotification];
}


#pragma mark - 通知

- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMsg:) name:kAdd_AddressViewController_receiveMsg object:nil];
}


- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kGetPartyListViewController_receiveMsg object:nil];
}


- (void)receiveMsg:(NSNotification *)aNotify {
    
    LM_A_B_C_D *msg = aNotify.userInfo[@"msg"];
    
    _a_b_c_d = msg;
    
    _areaLabel.text = [NSString stringWithFormat:@"%@%@%@%@", _a_b_c_d.A.iTEMNAME, _a_b_c_d.B.iTEMNAME, _a_b_c_d.C.iTEMNAME, _a_b_c_d.D.iTEMNAME];
}


#pragma mark - 功能函数

- (void)initUI {
    
    _areaLabel.text = @"";
}


- (void)saveAddress {
    
    NSString *a = [NSString stringWithFormat:@"%@%@%@%@%@", _a_b_c_d.A.iTEMNAME, _a_b_c_d.B.iTEMNAME, _a_b_c_d.C.iTEMNAME, _a_b_c_d.D.iTEMNAME, _detailAddressLabel.textTrim];
    
    if(![_areaLabel.text isEqualToString:@""]) {
        
        if(![_detailAddressLabel.textTrim isEqualToString:@""]) {
            
            if(![_nameF.textTrim isEqualToString:@""]) {
                
                if(![_telF.textTrim isEqualToString:@""]) {
                    
                    if(_a_b_c_d) {
                        
                        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        
                        NSString *address_idx = @"";
                        if(_MultiArrPartyAddress.count > 0) {
                            AddressModel *m =_MultiArrPartyAddress[0];
                            address_idx = m.IDX;
                        }
                        
                        [_service_addAddress AddAddress:_app.user.IDX andPARTY_IDX:_AddPartyM.iDX andADDRESS_CODE:_AddPartyM.strPartyCode andADDRESS_PROVINCE:_a_b_c_d.A.iTEMIDX andADDRESS_CITY:_a_b_c_d.B.iTEMIDX andADDRESS_AREA:_a_b_c_d.C.iTEMIDX andADDRESS_RURAL:_a_b_c_d.D.iTEMIDX andADDRESS_ADDRESS:_detailAddressLabel.textTrim andCONTACT_PERSON:_nameF.textTrim andCONTACT_TEL:_telF.textTrim andADDRESS_INFO:a andADDRESS_CODE:_PARTY_CODE.text andStrFatherPartyIDX:address_idx];
                    } else {
                        
                        [Tools showAlert:self.view andTitle:@"所在地区不能为空"];
                    }
                } else {
                    
                    [Tools showAlert:self.view andTitle:@"收货人电话不能为空"];
                }
            } else {
                
                [Tools showAlert:self.view andTitle:@"收货人名称不能为空"];
            }
        } else {
            
            [Tools showAlert:self.view andTitle:@"详细地址不能为空"];
        }
    } else {
        
        [Tools showAlert:self.view andTitle:@"所在区域不能为空"];
    }
}


#pragma mark - 多日期筛选

- (void)initAlertData:(NSArray *)lines {
    
    // 如果选择过拜访线路，读取上一次数据。否则初始化
    if(_lastMultiArrListTem) {
        
        _MultiArrListTem = _lastMultiArrListTem;
    }else {
        
        NSString *currWeek = [Tools getCurrentWeekDay];
        NSMutableArray *array1 = [[NSMutableArray alloc] init];
        for (int i = 0; i < lines.count; i++) {
            
            DataItemModel *m = [[DataItemModel alloc] init];
            m.title = lines[i];
            m.selected = NO;
            
            if([currWeek isEqualToString:lines[i]]) {
                
                m.selected = YES;
            }
            [array1 addObject:m];
        }
        _MultiArrListTem = [array1 copy];
    }
}

- (void)createAlert {
    
    _tableView = [[UITableView alloc] init];
    _tableView.tag = 10086;
    [_tableView registerNib:[UINib nibWithNibName:kCellName_LINE bundle:nil] forCellReuseIdentifier:kCellName_LINE];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 背景
    UIView *mulAlertBg =[[UIView alloc] init];
    [self.view.window addSubview:mulAlertBg];
    mulAlertBg.backgroundColor = [UIColor blackColor];
    [mulAlertBg setAlpha:0.5];
    [mulAlertBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    _mulAlertBg = mulAlertBg;
    
    // 多选Alert
    UIView *mulAlert = [[UIView alloc] init];
    [self.view.window addSubview:mulAlert];
    
    mulAlert.backgroundColor = [UIColor greenColor];
    [mulAlert mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(290);
        make.height.mas_equalTo(_MultiArrListTem.count * 44 + 40 + 70);
        make.centerY.offset(0);
        make.centerX.offset(0);
    }];
    _mulAlert = mulAlert;
    
    // 头部
    UILabel *mulAlertH = [[UILabel alloc] init];
    [mulAlert addSubview:mulAlertH];
//    [mulAlertH setClipsToBounds:YES];
    [mulAlertH setText:@"请选择拜访线路"];
    [mulAlertH setTextAlignment:NSTextAlignmentCenter];
    [mulAlertH setTextColor:[UIColor whiteColor]];
    [mulAlertH setBackgroundColor:RGB(91, 134, 247)];
    [mulAlertH mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
//    UIBezierPath *maskPath= [UIBezierPath bezierPathWithRoundedRect:mulAlertH.bounds
//                                                  byRoundingCorners:
//                             UIRectCornerBottomLeft |
//                             UIRectCornerBottomRight
//                                                        cornerRadii:CGSizeMake(20,20)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = mulAlertH.bounds;
//    maskLayer.path = maskPath.CGPath;
//    mulAlert.layer.mask = maskLayer;
    
    // 底部
    UIView *mulAlertBottom = [[UIView alloc] init];
    [mulAlertBottom setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [mulAlert addSubview:mulAlertBottom];
    [mulAlertBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(70);
    }];
    // 取消
    UIButton *mulAlertCancle = [[UIButton alloc] init];
    [mulAlertCancle.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    [mulAlertCancle setTitle:@"取消" forState:UIControlStateNormal];
    [mulAlertCancle addTarget:self action:@selector(cancleOnclick) forControlEvents:UIControlEventTouchUpInside];
    [mulAlertCancle setBackgroundColor:[UIColor redColor]];
    [mulAlertCancle.layer setCornerRadius:5.0];
    [mulAlertBottom addSubview:mulAlertCancle];
    // 确定
    UIButton *mulAlertOk = [[UIButton alloc] init];
    [mulAlertCancle.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    [mulAlertOk setTitle:@"确定" forState:UIControlStateNormal];
    [mulAlertOk addTarget:self action:@selector(okOnclick) forControlEvents:UIControlEventTouchUpInside];
    [mulAlertOk setBackgroundColor:RGB(91, 134, 247)];
    [mulAlertOk.layer setCornerRadius:5.0];
    [mulAlertBottom addSubview:mulAlertOk];
    [mulAlertCancle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(mulAlertOk.mas_left).offset(-16);
        make.width.mas_equalTo(mulAlertOk.mas_width);
        make.height.mas_equalTo(40);
    }];
    [mulAlertOk mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.right.mas_equalTo(-16);
        make.width.mas_equalTo(mulAlertCancle.mas_width);
        make.height.mas_equalTo(40);
    }];
    
    // table
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [mulAlert addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(mulAlertH.mas_bottom);
        make.bottom.mas_equalTo(mulAlertBottom.mas_top);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
}


- (void)removeAlert {
    
    [self initAlertData:_lines];
    [_mulAlertBg removeFromSuperview];
    [_mulAlert removeFromSuperview];
    
}


- (void)cancleOnclick {
    
    [self removeAlert];
}

- (void)okOnclick {
    
    NSInteger selectedCount = 0;
    NSString *weekLabel = @"";
    for (DataItemModel *m in _MultiArrListTem) {
        
        if(m.selected) {
            
            NSLog(@"%@", m.title);
            selectedCount ++;
            weekLabel = [NSString stringWithFormat:@"%@%@ ", weekLabel, m.title];
        }
    }
    // 星期数超过2个简写，例如:二 四
    if(selectedCount > 1) {
        
        weekLabel = [weekLabel stringByReplacingOccurrencesOfString:@"星期" withString:@""];
    }
    [_LINE setText:weekLabel];
    if(selectedCount) {
        
        _lastMultiArrListTem = _MultiArrListTem;
        [self removeAlert];
    }else {
        
        [Tools showAlert:self.view.window andTitle:@"请选择拜访线路"];
    }
}

- (IBAction)alert {
    
    [self.view endEditing:YES];
    [self createAlert];
}


#pragma mark - 多客户选择筛选

- (void)createParty {
    
    _tableViewParty = [[UITableView alloc] init];
    _tableViewParty.tag = 10087;
    [_tableViewParty registerNib:[UINib nibWithNibName:kCellName_PARTY bundle:nil] forCellReuseIdentifier:kCellName_PARTY];
    _tableViewParty.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 背景
    UIView *mulPartyBg =[[UIView alloc] init];
    mulPartyBg.backgroundColor = [UIColor blackColor];
    [mulPartyBg setAlpha:0.5];
    [self.view.window addSubview:mulPartyBg];
    [mulPartyBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    _mulPartyBg = mulPartyBg;
    
    // 多选客户资料
    UIView *mulParty = [[UIView alloc] init];
    mulParty.layer.cornerRadius = 5.0f;
    mulParty.backgroundColor = [UIColor greenColor];
    [self.view.window addSubview:mulParty];
    [mulParty mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(290);
        CGFloat height = _MultiArrParty.count * 64 + 80;
        CGFloat edge = 120;
        if(height > (ScreenHeight - edge)) {
            height = ScreenHeight - edge;
        }
        make.height.mas_equalTo(height);
        make.centerY.offset(0);
        make.centerX.offset(0);
    }];
    _mulParty = mulParty;
    
    // 头部
    UILabel *mulH = [[UILabel alloc] init];
    [mulH setText:@"请选择上级客户"];
    [mulH setTextAlignment:NSTextAlignmentCenter];
    [mulH setTextColor:[UIColor whiteColor]];
    [mulH setBackgroundColor:RGB(91, 134, 247)];
    [_mulParty addSubview:mulH];
    [mulH mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    // 底部
    UIView *mulBottom = [[UIView alloc] init];
    [mulBottom setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [_mulParty addSubview:mulBottom];
    [mulBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(70);
    }];
    // 取消
    UIButton *mulCancle = [[UIButton alloc] init];
    mulCancle.layer.cornerRadius = 20;
    mulCancle.layer.shadowOffset =  CGSizeMake(0, 3);
    mulCancle.layer.shadowOpacity = 0.5;
    mulCancle.layer.shadowColor =  [UIColor redColor].CGColor;
    mulCancle.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    [mulCancle setTitle:@"取消" forState:UIControlStateNormal];
    [mulCancle addTarget:self action:@selector(canclePartyOnclick) forControlEvents:UIControlEventTouchUpInside];
    [mulCancle setBackgroundColor:[UIColor redColor]];
    [mulBottom addSubview:mulCancle];
    [mulCancle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.offset(0);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(40);
    }];
    
    // table
    _tableViewParty.dataSource = self;
    _tableViewParty.delegate = self;
    [mulParty addSubview:_tableViewParty];
    [_tableViewParty mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(mulH.mas_bottom);
        make.bottom.mas_equalTo(mulBottom.mas_top);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
}


- (void)removeParty {
    
    [self initAlertData:_lines];
    [_mulPartyBg removeFromSuperview];
    [_mulParty removeFromSuperview];
}


- (void)canclePartyOnclick {
    
    [self removeParty];
}

- (void)okPartyOnclick {
    
    
}

- (IBAction)alertParty {
    
    [self.view endEditing:YES];
    [self createParty];
}


#pragma mark - 事件

- (IBAction)saveOnclick:(UIButton *)sender {
    
    [_service_makeOrder getCustomerData];
    return;
    
    if([_PARTY_CODE.textTrim isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"客户代码不能为空"];
        return;
    }
    
    if(![_PARTY_NAME.textTrim isEqualToString:@""]) {
        
        if(![_areaLabel.text isEqualToString:@""]) {
            
            if(![_detailAddressLabel.textTrim isEqualToString:@""]) {
                
                if(![_nameF.textTrim isEqualToString:@""]) {
                    
                    if(![_telF.textTrim isEqualToString:@""]) {
                        
                        if(_a_b_c_d) {
                            
                            [self.view endEditing:YES];
                            
                            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                            [_service_makeOrder getCustomerData];
                        } else {
                            
                            [Tools showAlert:self.view andTitle:@"所在地区不能为空"];
                        }
                    } else {
                        
                        [Tools showAlert:self.view andTitle:@"收货人电话不能为空"];
                    }
                } else {
                    
                    [Tools showAlert:self.view andTitle:@"收货人名称不能为空"];
                }
            } else {
                
                [Tools showAlert:self.view andTitle:@"详细地址不能为空"];
            }
        } else {
            
            [Tools showAlert:self.view andTitle:@"所在区域不能为空"];
        }
    } else {
        
        [Tools showAlert:self.view andTitle:@"客户名称不能为空"];
    }
}


#pragma mark - 手势

- (IBAction)areaOnclick:(UITapGestureRecognizer *)sender {
    
    //    AreaProvinceViewController *vc = [[AreaProvinceViewController alloc] init];
    //
    //    //nav导航
    //    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    //    [self presentViewController:nav animated:YES completion:nil];
    
    [self.view endEditing:YES];
    NormalAdressListViewController *vc = [[NormalAdressListViewController alloc] init];
    vc.LM_CODE = @"A";
    vc.strPrentCode = @"0";
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)contactOnclick:(UITapGestureRecognizer *)sender {
    
    [self.view endEditing:YES];
    if(SystemVersion >= 10.0){
        //iOS 10
        //    AB_DEPRECATED("Use CNContactPickerViewController from ContactsUI.framework instead")
        CNContactPickerViewController * contactVc = [CNContactPickerViewController new];
        contactVc.delegate = self;
        [self presentViewController:contactVc animated:YES completion:^{
            
        }];
    } else {
        
        ABPeoplePickerNavigationController *nav = [[ABPeoplePickerNavigationController alloc] init];
        nav.peoplePickerDelegate = self;
        if(SystemVersion > 8.0){
            nav.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];
        }
        [self presentViewController:nav animated:YES completion:nil];
    }
}


// 渠道
- (IBAction)channelOnclick {
    
    [self.view endEditing:YES];
    [LM_alert showLMAlertViewWithTitle:@"渠道" message:@"" cancleButtonTitle:@"取消" okButtonTitle:nil otherButtonTitleArray:_channel clickHandle:^(NSInteger index) {
        
        if(index >= 1) {
            
            _CHANNEL_NO.text = _channel[index - 1];
        }
    }];
}


#pragma mark - iOS 10 联系人选择

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty{
    
    NSString *givenName = contactProperty.contact.givenName;
    NSString *familyName = contactProperty.contact.familyName;
    NSString *fullName = [NSString stringWithFormat:@"%@%@", givenName, familyName];
    
    NSString *tel = [contactProperty.value stringValue];
    tel = [tel stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    _nameF.text = fullName;
    _telF.text = tel;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - iOS 10以下 联系人选择

// 选择联系人某个属性时调用（展开详情）
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    
    CFStringRef firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
    CFStringRef lastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
    
    NSString *fir = CFBridgingRelease(firstName);
    NSString *las = CFBridgingRelease(lastName);
    
    NSString *fullName = [NSString stringWithFormat:@"%@%@", las ? las : @"", fir ? fir : @""];
    
    ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
    NSString *tel = (__bridge_transfer NSString *)  ABMultiValueCopyValueAtIndex(multi, identifier);
    tel = [tel stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    _nameF.text = fullName;
    _telF.text = tel;
    
    NSLog(@"");
}


#pragma mark - AddPartyServiceDelegate

- (void)successOfAddParty:(NSString *)msg andAddPartyM:(AddPartyModel *)AddPartyM {
    
    _AddPartyM = AddPartyM;
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [self saveAddress];
}


- (void)failureOfAddParty:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [Tools showAlert:self.view andTitle:msg];
}


#pragma mark - AddAddressServiceDelegate

- (void)successOfAddAddress:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kGetPartyListViewController_receiveMsg object:nil userInfo:@{@"msg" : msg}];
        [self.navigationController popViewControllerAnimated:YES];
    });
}


- (void)failureOfAddAddress:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

#pragma mark - GetPartyVisitLineServiceDelegate

- (void)successOfGetPartyVisitLine:(NSArray *)line {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
   
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in line) {
        
        [arrM addObject:dict[@"ITEM_NAME"]];
    }
    _lines = [arrM copy];
    
    // 获取当前星期几
    NSString *currWeek = [Tools getCurrentWeekDay];
    
    // 判断返回的线路中有没有当前星期
    BOOL hasCurrWeek = NO;
    for (NSString *week in _lines) {
        
        if([week isEqualToString:currWeek]) {
            
            hasCurrWeek = YES;
        }
    }
    
    // 有当前星期就设置默认当前星期，没有就默认返回的第一条数据
    if(hasCurrWeek == YES) {
        
        _LINE.text = currWeek;
    }else {
       
        if(_lines.count > 0) {
            
            _LINE.text = [_lines firstObject];
        }
    }

    // 路线弹框初始化
    [self initAlertData:_lines];
}

- (void)failureOfGetPartyVisitLine:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

- (void)successOfGetPartyVisitChannel:(NSArray *)arr {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    _channel = arr;
    if(_channel.count > 0) {
        
        _CHANNEL_NO.text = [_channel firstObject];
    }
}

- (void)failureOfGetPartyVisitChannel:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(tableView.tag == 10086) {
        
        return 44;
    }else if(tableView.tag == 10087) {
        
        return 63;
    }else {
        
        return 44;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(tableView.tag == 10086) {
        
        return _MultiArrListTem.count;
    }else if(tableView.tag == 10087) {
        
        return _MultiArrParty.count;
    }else {
        
        return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(tableView.tag == 10086) {
        
        static NSString *cellId = kCellName_LINE;
        LMDropDownMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        
        DataItemModel *item = _MultiArrListTem[indexPath.row];
        cell.item = item;
        
        return cell;
    }else if(tableView.tag == 10087) {
        
        static NSString *cellId = kCellName_PARTY;
         PartyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        
        PartyModel *party = _MultiArrParty[indexPath.row];
        cell.PARTY_CODE.text = party.PARTY_CODE;
        cell.PARTY_NAME.text = party.PARTY_NAME;
        return cell;
    }else {
        
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(tableView.tag == 10086) {
        
        DataItemModel *item = _MultiArrListTem[indexPath.row];
        item.selected = !item.selected;
        [_tableView reloadData];
    }else if(tableView.tag == 10087) {
        
        [self removeParty];
        PartyModel *party = _MultiArrParty[indexPath.row];
        [_service_makeOrder getPartygetAddressInfo:party.IDX];
    }
}

#pragma mark - MakeOrderServiceDelegate 获取上级客户

- (void)successOfMakeOrder:(NSMutableArray *)partys {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    _MultiArrParty = [partys copy];
    
    // 存在客户资料
    if(partys.count > 0) {
        
        // 只有一个客户资料，不弹框
        if(partys.count == 1) {
            
            PartyModel *party = partys[0];
            [_service_makeOrder getPartygetAddressInfo:party.IDX];
        }else {
            
            [self createParty];
        }
    }else {
        
        [Tools showAlert:self.view andTitle:@"缺少上级客户资料"];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
}

- (void)failureOfMakeOrder:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}


- (void)successOfGetPartygetAddressInfo:(NSMutableArray *)address {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    _MultiArrPartyAddress = [address copy];
    
    // 拜访线路用英文逗号隔开，例如：星期二,星期四
    NSString *weekArray = @"";
    int k = 0;
    for (int i = 0; i < _MultiArrListTem.count; i++) {
        DataItemModel *m = _MultiArrListTem[i];
        if(m.selected) {
            if(k == 0) {
                weekArray = m.title;
            }else {
                weekArray = [NSString stringWithFormat:@"%@,%@", weekArray, m.title];
            }
            k++;
        }
    }
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    if(address.count > 0) {
        
        AddressModel *addressM = address[0];
        
        [_service AddParty:_app.user.IDX andPARTY_NAME:_PARTY_NAME.textTrim andPARTY_CITY:@" " andPARTY_REMARK:_PARTY_REMARK.textTrim andBUSINESS_IDX:_app.business.BUSINESS_IDX andStrLINE:weekArray andStrCHANNEL:_CHANNEL_NO.text andPARTY_CODE:_PARTY_CODE.text andStrFatherPartyIDX:addressM.IDX];
    }else {
        
        [Tools showAlert:self.view andTitle:@"找不到地址"];
    }
}

- (void)successOfGetPartygetAddressInfoNoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"没有地址"];
}

- (void)failureOfGetPartygetAddressInfo:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
