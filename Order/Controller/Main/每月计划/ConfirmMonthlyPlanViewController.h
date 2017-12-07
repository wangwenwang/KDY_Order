//
//  ConfirmMonthlyPlanViewController.h
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromotionOrderModel.h"
#import "PartyModel.h"
#import "AddressModel.h"

@interface ConfirmMonthlyPlanViewController : UIViewController

@property (strong, nonatomic) PromotionOrderModel *promotionOrder;

/// 已下单的产品(ProductModel)，本地push过来的
@property (strong, nonatomic) NSMutableArray *productsOfLocal;

/// 已下单的产品(PromotionDetailModel)，服务器获取 (正常品)
@property (strong, nonatomic) NSMutableArray *promotionDetailsOfServer;

/// 已下单的产品(PromotionDetailModel)，服务器获取 (赠品)
@property (strong, nonatomic) NSMutableArray *promotionDetailGiftsOfServer;

/// 客户信息
@property (strong, nonatomic) PartyModel *party;

/// 地址信息
@property (strong, nonatomic) AddressModel *address;

@end
