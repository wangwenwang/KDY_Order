//
//  ImportToOrderPlanListService.h
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 每月订单计划

@protocol ImportToOrderPlanListServiceDelegate <NSObject>

/// 提交订单成功
@optional
- (void)successOfImportToOrderPlanList:(NSString *)msg;

/// 提交订单失败
@optional
- (void)failureOfImportToOrderPlanList:(NSString *)msg;

@end

@interface ImportToOrderPlanListService : NSObject

@property (weak, nonatomic)id <ImportToOrderPlanListServiceDelegate> delegate;

/**
 * 提交订单
 */
- (void)ImportToOrderPlanList:(NSString *)order;

@end
