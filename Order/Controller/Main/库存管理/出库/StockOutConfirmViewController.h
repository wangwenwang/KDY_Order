//
//  StockOutConfirmViewController.h
//  Order
//
//  Created by 凯东源 on 16/10/21.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromotionOrderModel.h"
#import "PartyModel.h"
#import "AddressModel.h"

@interface StockOutConfirmViewController : UIViewController

@property (strong, nonatomic) PromotionOrderModel *promotionOrder;

/// 已下单的产品(ProductModel)，本地push过来的
@property (strong, nonatomic) NSMutableArray *productsOfLocal;

/// 已下单的产品(PromotionDetailModel)，服务器获取
@property (strong, nonatomic) NSMutableArray *promotionDetailsOfServer;

/// 用户地址代码
@property (copy, nonatomic) NSString *orderAddressCode;

/// 客户地址
@property (strong, nonatomic) AddressModel *addressM;

/// 支付方式
@property (copy, nonatomic) NSString *orderPayType;

/// 客户信息
@property (strong, nonatomic) PartyModel *partyM;

/// 生产日期
@property (copy, nonatomic) NSString *PRODUCTION_DATE;

@end
