//
//  CustomerListSearchResultsViewController.m
//  Order
//
//  Created by 凯东源 on 17/6/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "CustomerListSearchResultsViewController.h"
#import "MakeOrderTableViewCell.h"
#import "PartyModel.h"
#import "AddStockViewController.h"
#import "CustomerListViewController.h"
#import "GetStockListViewController.h"
#import "MainViewController.h"
#import "GetAppBillFeeListViewController.h"
#import <MBProgressHUD.h>
#import "MakeOrderService.h"
#import "AddressModel.h"
#import "Tools.h"
#import "LMBlurredView.h"
#import <Masonry.h>
#import "AppDelegate.h"
#import "StockManViewController.h"

@interface CustomerListSearchResultsViewController ()<MakeOrderServiceDelegate, LMBlurredViewDelegate, UITableViewDataSource, UITableViewDelegate>

// 网络层
@property (strong, nonatomic) MakeOrderService *service;

// 客户地址列表
@property (strong, nonatomic) NSMutableArray *address;

// 虚化层
@property (strong, nonatomic) LMBlurredView *blurredView;

// 全局变量
@property (strong, nonatomic) AppDelegate *app;

// 客户地址
@property (strong, nonatomic) AddressModel *currentAddress;

@end

#define kCellName @"MakeOrderTableViewCell"

#define kCellHeight 95

#define kAddressCellHeight 72

@implementation CustomerListSearchResultsViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[MakeOrderService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.definesPresentationContext = YES;
    
    NSLog(@"result viewDidLoad");
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    NSLog(@"result dealloc");
}


- (void)pushStockManVC {
    
    StockManViewController *vc = [[StockManViewController alloc] init];
    vc.partyM = _currentParty;
    vc.addressM = _currentAddress;
    
    [_nav pushViewController:vc animated:YES];
}


#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 95.0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.searchDataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = kCellName;
    MakeOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    PartyModel *m = _searchDataArray[indexPath.row];
    cell.customerTypeLabel.text = m.PARTY_TYPE;
    cell.customerCodeLabel.text = m.PARTY_CODE;
    cell.customerCityLabel.text = m.PARTY_CITY;
    cell.customerNameLabel.text = m.PARTY_NAME;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    PartyModel *party = _searchDataArray[indexPath.row];
//
//    if([_vcClass isEqualToString:NSStringFromClass([GetStockListViewController class])]) {
//
//        AddStockViewController *vc = [[AddStockViewController alloc] init];
//        vc.partyM = party;
//        [_nav pushViewController:vc animated:YES];
//    } else if([_vcClass isEqualToString:NSStringFromClass([MainViewController class])]) {
//
//        GetAppBillFeeListViewController *vc = [[GetAppBillFeeListViewController alloc] init];
//        vc.PARTY_IDX = party.IDX;
//        [_nav pushViewController:vc animated:YES];
//    }
    
    
    PartyModel *party = _searchDataArray[indexPath.row];
    
    if([_vcClass isEqualToString:NSStringFromClass([GetStockListViewController class])]) {
        
        AddStockViewController *vc = [[AddStockViewController alloc] init];
        vc.partyM = party;
        [_nav pushViewController:vc animated:YES];
    } else if([_vcClass isEqualToString:NSStringFromClass([MainViewController class])] && [_functionName isEqualToString:@"费用帐单"]) {
        
        GetAppBillFeeListViewController *vc = [[GetAppBillFeeListViewController alloc] init];
        vc.PARTY_IDX = party.IDX;
        [_nav pushViewController:vc animated:YES];
    } else if([_vcClass isEqualToString:NSStringFromClass([MainViewController class])] && [_functionName isEqualToString:@"库存管理"]) {
        
        PartyModel *m = _searchDataArray[indexPath.row];
        _currentParty = m;
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service getPartygetAddressInfo:m.IDX];
    }
}


#pragma mark - MakeOrderServiceDelegate

// 获取客户地址列表回调
- (void)successOfGetPartygetAddressInfo:(NSMutableArray *)address {
    
    _address = address;
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if(address.count > 1) {
        
        CGFloat allCellHeight = 0;
        CGFloat threeCellHeight = 0;
        
        for(int i = 0; i < _address.count; i++) {
            
            AddressModel *m = _address[i];
            
            // Label 容器宽度
            CGFloat contentWidth = ScreenWidth - 8 - 66.5 - 5 - 35 * 2;
            // Label 单行高度
            CGFloat oneLineHeight = [Tools getHeightOfString:@"fds" fontSize:13 andWidth:999.9];
            
            // 地址详情的Label高度，根据文字计算出来
            CGFloat overflowHeight = [Tools getHeightOfString:m.ADDRESS_INFO fontSize:13 andWidth:contentWidth] - oneLineHeight;
            
            if(overflowHeight > 0) {
                
                m.cellHeight = kAddressCellHeight + overflowHeight;
            } else {
                
                m.cellHeight = kAddressCellHeight;
            }
            
            // 计算3个Cell的高度，方便给地址容器使用
            if(i < 3) {
                
                threeCellHeight += m.cellHeight;
            }
            allCellHeight += m.cellHeight;
        }
        
        // 虚化背景
        LMBlurredView *blurredView = [[LMBlurredView alloc] init];
        blurredView.delegate = self;
        [blurredView blurry:5.1];
        _blurredView = blurredView;
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:15.0];
        label.text = @"请选择下单客户地址";
        CGFloat labelHeight = [Tools getHeightOfString:label.text fontSize:label.font.pointSize andWidth:MAXFLOAT];
        CGFloat label_top = 5;
        CGFloat tableView_top = 5;
        CGFloat btn_top = 20;
        CGFloat btn_height = 35;
        CGFloat btn_bottom = 10;
        
        // 地址容器
        UIView *view = [[UIView alloc] init];
        view.tag = 1089;
        view.layer.cornerRadius = 2.0f;
        view.backgroundColor = RGB(239, 239, 244);
        [_app.window addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.left.equalTo(@(20));
            make.right.equalTo(@(-20));
            
            CGFloat viewHeight = (allCellHeight + label_top + labelHeight + tableView_top + btn_top + btn_height + btn_bottom);
            if(_address.count <= 3) {
                
                make.height.mas_equalTo(viewHeight);
            } else {
                
                make.height.mas_equalTo(threeCellHeight + kCellHeight / 2);
            }
        }];
        
        // 提示Label
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(label_top);
            make.left.mas_equalTo(8);
        }];
        
        // 取消按钮
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        btn.layer.cornerRadius = 2.0f;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        btn.backgroundColor = YBGreen;
        [btn addTarget:self action:@selector(cancelAddressOnclick) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(40);
            make.right.mas_equalTo(-40);
            make.height.mas_equalTo(btn_height);
            make.bottom.mas_equalTo(-btn_bottom);
        }];
        
        // tableView
        UITableView *tableView = [[UITableView alloc] init];
        tableView.layer.cornerRadius = 2.0f;
        tableView.backgroundColor = [UIColor clearColor];
        [tableView registerNib:[UINib nibWithNibName:@"CustomerAddressTableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomerAddressTableViewCell"];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = 1002;
        [view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(label.mas_bottom).offset(tableView_top);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(btn.mas_top).offset(-btn_top);
        }];
        
        [tableView reloadData];
    } else if(_address.count == 1) {
        
        _currentAddress = _address[0];
        [self pushStockManVC];
    } else {
        
        [Tools showAlert:self.view andTitle:@"没有可用地址"];
    }
}


- (void)successOfGetPartygetAddressInfoNoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"无地址"];
}


- (void)failureOfGetPartygetAddressInfo:(NSString *)msg {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取客户地址失败"];
}


#pragma mark - 点击事件

- (void)cancelAddressOnclick {
    
    [_blurredView clear];
    
    [self LMBlurredViewClear];
}

@end
