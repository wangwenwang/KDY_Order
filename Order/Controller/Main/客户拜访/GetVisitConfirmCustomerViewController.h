//
//  GetVisitConfirmCustomerViewController.h
//  Order
//
//  Created by wenwang wang on 2018/11/20.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartyModel.h"
#import "AddressModel.h"
#import "GetPartyVisitItemModel.h"

@interface GetVisitConfirmCustomerViewController : UIViewController

// 客户信息
@property (strong, nonatomic) PartyModel *partyM;

// 客户地址
@property (strong, nonatomic) AddressModel *addressM;

// 列表信息
@property (strong, nonatomic) GetPartyVisitItemModel * pvItemM;

@end
