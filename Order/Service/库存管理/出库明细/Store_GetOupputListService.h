//
//  Store_GetOupputListService.h
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetOupputListModel.h"
#import "CheckOrderListModel.h"

@protocol Store_GetOupputListServiceDelegate <NSObject>

/// 出库列表 成功
@optional
- (void)successOfGetOupputList:(nullable GetOupputListModel *)getOupputListM;

/// 出库列表 没有数据
@optional
- (void)successOfGetOupputList_NoData;

/// 出库列表 失败
@optional
- (void)failureOfGetOupputList:(nullable NSString *)msg;

/// 出库列表 成功（经销商的，与下单里的列表数据一致）
@optional
- (void)successOfGetOupputList_CheckOrder:(nullable CheckOrderListModel *)CheckOrderListM;

@end

@interface Store_GetOupputListService : NSObject

@property (weak, nonatomic)id <Store_GetOupputListServiceDelegate> delegate;

- (void)GetOupputList:(nullable NSString *)addressIDX andstrPage:(NSInteger)strPage andstrPageCount:(NSInteger)strPageCount andBUSINESS_IDX:(nullable NSString *)BUSINESS_IDX;

// 获取门店出库单
- (void)GetVisitAppOrder:(nullable NSString *)strVisitIdx andStrType:(nullable NSString *)strType;

// 获取经销商出库单
- (void)GetVisitAppOrde_AGENT:(nullable NSString *)strVisitIdx andStrType:(nullable NSString *)strType;

@end
