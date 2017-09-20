//
//  Store_StockOutConfirmService.h
//  Order
//
//  Created by 凯东源 on 2017/8/26.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PromotionOrderModel.h"

/// 订单确认界面的业务类

@protocol Store_StockOutConfirmServiceDelegate <NSObject>

/// 请求促销信息成功
@optional
- (void)successOfOrderConfirm:(PromotionOrderModel *)promotionOrder;

/// 请求促销信息失败
@optional
- (void)failureOfOrderConfirm:(NSString *)msg;


/// 提交订单成功
@optional
- (void)successOfOrderConfirmWithCommit;

/// 提交订单失败
@optional
- (void)failureOfOrderConfirmWithCommit:(NSString *)msg;

@end

@interface Store_StockOutConfirmService : NSObject

@property (weak, nonatomic)id <Store_StockOutConfirmServiceDelegate> delegate;


/**
 * 获取促销信息
 *
 * @param submitString 提交的订单信息
 * @return 发送请求是否成功
 */
- (void)getPromotionData:(NSString *)submitString;

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

/**
 * 提交订单
 */
- (void)confirm:(NSString *)result;

@end
