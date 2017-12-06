//
//  GetOrderPlanDetailService.h
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonthlyPlanInfoModel.h"

@protocol GetOrderPlanDetailServiceDelegate <NSObject>

@optional
- (void)successOfGetOrderPlanDetail:(nullable MonthlyPlanInfoModel *)monthlyPlanInfoM;

@optional
- (void)failureOfGetOrderPlanDetail:(nullable NSString *)msg;

@end

@interface GetOrderPlanDetailService : NSObject

@property (weak, nonatomic, nullable) id <GetOrderPlanDetailServiceDelegate> delegate;


/**
 获取回瓶详情列表

 @param ORDER_IDX 订单idx
 */
- (void)GetOrderPlanDetail:(nullable NSString *)ORDER_IDX;

@end
