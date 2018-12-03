//
//  GetPartyVisitListSearchResultsViewController.m
//  Order
//
//  Created by wenwang wang on 2018/10/31.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitListSearchResultsViewController.h"
#import "GetPartyVisitListTableViewCell.h"
#import "Tools.h"
#import "AddPartyVisitViewController.h"

// 步骤
#import "GetVisitEnterShopViewController.h"
#import "GetVisitConfirmCustomerViewController.h"
#import "GetVisitCheckInventoryViewController.h"
#import "GetVisitRecommendedOrderViewController.h"
#import "KBShowStepViewController.h"

@interface GetPartyVisitListSearchResultsViewController ()<GetPartyVisitListTableViewCellDelegate>

@end

#define kCellHeight 132

#define kCellName @"GetPartyVisitListTableViewCell"

@implementation GetPartyVisitListSearchResultsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self registerCell];
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
    
    return cell;
}


#pragma mark - GetPartyVisitListTableViewCellDelegate

- (void)editOnclick:(NSUInteger)row {
    
    GetPartyVisitItemModel *m = _visitsFilter[row];
    
    PartyModel *partyM = [[PartyModel alloc] init];
    partyM.PARTY_CODE = m.pARTYNO;
    partyM.PARTY_NAME = m.pARTYNAME;
    
    AddressModel *addressM = [[AddressModel alloc] init];
    addressM.CONTACT_PERSON = m.cONTACTS;
    addressM.CONTACT_TEL = m.cONTACTSTEL;
    addressM.ADDRESS_INFO = m.pARTYADDRESS;
    
    AddPartyVisitViewController *vc = [[AddPartyVisitViewController alloc] init];
    vc.partyM = partyM;
    vc.addressM = addressM;
    vc.pvItemM = m;
    [_nav pushViewController:vc animated:YES];
    
    NSLog(@"%lu", (unsigned long)row);
}

// 添加步骤
- (void)addStepOnclick:(NSUInteger)row {
    
    GetPartyVisitItemModel *_pvItemM = _visitsFilter[row];
    if([_pvItemM.vISITSTATES isEqualToString:@"新建"]) {
        
        GetVisitEnterShopViewController *vc = [[GetVisitEnterShopViewController alloc] init];
        vc.pvItemM = _pvItemM;
        [_nav pushViewController:vc animated:YES];
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
        [_nav pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"确认客户信息"]){
        
        GetVisitCheckInventoryViewController *vc = [[GetVisitCheckInventoryViewController alloc] init];
        vc.pvItemM = _pvItemM;
        [_nav pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"检查库存"]){
        
        GetVisitRecommendedOrderViewController *vc = [[GetVisitRecommendedOrderViewController alloc] init];
        vc.pvItemM = _pvItemM;
        [_nav pushViewController:vc animated:YES];
    } else if([_pvItemM.vISITSTATES isEqualToString:@"建议订单"]){
        
    } else if([_pvItemM.vISITSTATES isEqualToString:@"生动化陈列"]){
        
    } else if([_pvItemM.vISITSTATES isEqualToString:@"离店"]){
        
    }
}

- (void)showStepOnclick:(NSUInteger)row {
    
    KBShowStepViewController *vc = [[KBShowStepViewController alloc] init];
    GetPartyVisitItemModel *m = _visitsFilter[row];
    vc.pvItemM = m;
    [_nav pushViewController:vc animated:YES];
}

@end
