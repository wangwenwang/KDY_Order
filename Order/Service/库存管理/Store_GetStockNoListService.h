//
//  Store_GetStockNoListService.h
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockNoWaterListModel.h"
#import "StockNoListModel.h"


@protocol Store_GetStockNoListServiceDelegate <NSObject>

/// 出库产品流水列表 成功
@optional
- (void)successOfGetStockNoWaterList:(StockNoWaterListModel * _Nullable )stockNoListM;

/// 出库产品流水列表 没有数据
@optional
- (void)successOfGetStockNoWaterList_NoData;

/// 出库产品流水列表 失败
@optional
- (void)failureOfGetStockNoWaterList:(NSString * _Nullable)msg;



/// 出库产品列表 成功
@optional
- (void)successOfGetStockNoList:(StockNoWaterListModel * _Nullable )stockNoListM;

/// 出库产品列表 没有数据
@optional
- (void)successOfGetStockNoList_NoData;

/// 出库产品列表 失败
@optional
- (void)failureOfGetStockNoList:(NSString * _Nullable)msg;

@end

@interface Store_GetStockNoListService : NSObject

@property (weak, nonatomic, nullable)id <Store_GetStockNoListServiceDelegate> delegate;

- (void)GetStockNoWaterList:(nullable NSString *)IDX andstrPage:(NSUInteger)strPage;

- (void)GetStockNoList:(nullable NSString *)IDX;

@end
