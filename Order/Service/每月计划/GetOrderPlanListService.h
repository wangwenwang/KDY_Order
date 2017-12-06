//
//  GetOrderPlanListService.h
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonthlyPlanListModel.h"

@protocol GetOrderPlanListServiceDelegate <NSObject>

@optional
- (void)successOfGetOrderPlanList:(nullable MonthlyPlanListModel *)monthlyPlanListM;

@optional
- (void)successOfGetOrderPlanList_NoData;

@optional
- (void)failureOfGetOrderPlanList:(nullable NSString *)msg;

@end

@interface GetOrderPlanListService : NSObject

@property (weak, nonatomic, nullable) id <GetOrderPlanListServiceDelegate> delegate;


/**
 获取采购计划列表

 @param strBusinessId 业务代码
 @param strUserId 用户idx
 @param strPartyType 客户类型
 @param strPartyId 客户id
 @param strState 状态
 @param strPage 页码
 @param strPageCount 页面条数
 */
- (void)GetOrderPlanList:(nullable NSString *)strBusinessId andstrUserId:(nullable NSString *)strUserId andstrPartyType:(nullable NSString *)strPartyType andstrPartyId:(nullable NSString *)strPartyId andstrState:(nullable NSString *)strState andstrPage:(NSInteger)strPage andstrPageCount:(NSInteger)strPageCount;

@end
