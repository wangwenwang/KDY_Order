//
//  GetOrderTmsService.h
//  Order
//
//  Created by 凯东源 on 2018/1/4.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderTmsModel.h"

@protocol GetOrderTmsServiceDelegate <NSObject>

@optional
- (void)successOfGetOrderTms:(OrderTmsModel *)product;

@optional
- (void)failureOfGetOrderTms:(NSString *)msg;

@end

@interface GetOrderTmsService : NSObject

@property (weak, nonatomic) id <GetOrderTmsServiceDelegate> delegate;

/**
 物流订单明细

 @param orderId 物流编号
 */
- (void)GetOrderTms:(NSString *)orderId;

@end
