//
//  ImportToOrderPlanListService.h
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PromotionOrderModel.h"

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

/**
 * 设置提交订单的订单信息
 * @param returnGiftData 用户手动添加的赠品集合
 * @param choicedProducts 用户在上一个商品选择界面选择的商品
 * @param tempTotalQTY 商品总数过度值
 * @param date 用户选择的送货时间
 * @param remark 用户填写的备注信息
 * @param promotionOrder 服务器获取的整张订单
 * @param selectPronotionDetails 已经选择的产品
 */
- (void)setConfirmData:(NSMutableArray *)returnGiftData andProducts:(NSMutableArray *)choicedProducts andTempTotalQTY:(long long)tempTotalQTY andDate:(NSDate *)date andRemark:(NSString *)remark andPromotionOrder:(PromotionOrderModel *)order andSelectPronotionDetails:(NSMutableArray *)selectPronotionDetails;

@end
