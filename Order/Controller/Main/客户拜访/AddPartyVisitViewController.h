//
//  AddPartyVisitViewController.h
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressModel.h"
#import "PartyModel.h"
#import "GetPartyVisitItemModel.h"

@interface AddPartyVisitViewController : UIViewController


// 客户信息
@property (strong, nonatomic) PartyModel *partyM;

// 客户地址
@property (strong, nonatomic) AddressModel *addressM;

// 列表信息
@property (strong, nonatomic) GetPartyVisitItemModel *pvItemM;

// 拜访线路
@property (strong, nonatomic) NSArray *lines;

@end
