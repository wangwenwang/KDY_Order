//
//  Store_GetPartyStockListService.h
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockProductListModel.h"


@protocol Store_GetPartyStockListServiceDelegate <NSObject>

/// 出库产品列表 成功
@optional
- (void)successOfGetPartyStockList:(StockProductListModel * _Nullable )stockProductListM;

/// 出库产品列表 没有数据
@optional
- (void)successOfGetPartyStockList_NoData;

/// 出库产品列表 失败
@optional
- (void)failureOfGetPartyStockList:(NSString * _Nullable)msg;

@end

@interface Store_GetPartyStockListService : NSObject

@property (weak, nonatomic, nullable)id <Store_GetPartyStockListServiceDelegate> delegate;



/**
 获取库存列表数据

 @param ADDRESS_IDX  客户id
 @param BUSINESS_IDX 业务id
 @param strPage      页码
 @param strPageCount 页面条数
 */
- (void)GetPartyStockList:(nullable NSString *)ADDRESS_IDX andBUSINESS_IDX:(nullable NSString *)BUSINESS_IDX andstrPage:(NSInteger)strPage andstrPageCount:(NSInteger)strPageCount;

@end
