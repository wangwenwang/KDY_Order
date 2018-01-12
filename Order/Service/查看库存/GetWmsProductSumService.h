//
//  GetWmsProductSumService.h
//  Order
//
//  Created by 凯东源 on 2018/1/11.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckStockDetailListModel.h"

@protocol GetWmsProductSumServiceDelegate <NSObject>

@optional
- (void)successOfGetWmsProductSumService:(nullable CheckStockDetailListModel *)checkStockDetailListM;

@optional
- (void)successOfGetWmsProductSumService_NoData;

@optional
- (void)failureOfGetWmsProductSumService:(nullable NSString *)msg;

@end

@interface GetWmsProductSumService : NSObject

@property (weak, nonatomic, nullable) id <GetWmsProductSumServiceDelegate> delegate;

/**
 获取物流订单列表
 
 @param BusinessCode     业务code
 @param ProductNo        产品号
 @param strPage          页数
 @param strPageCount     数目
 */
- (void)GetWmsProductSum:(nullable NSString *)BusinessCode andProductNo:(nullable NSString *)ProductNo andstrPage:(NSUInteger)strPage andstrPageCount:(NSUInteger)strPageCount;

@end
