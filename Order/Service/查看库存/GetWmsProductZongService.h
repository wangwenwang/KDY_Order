//
//  GetWmsProductZongService.h
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckStockListModel.h"

@protocol GetWmsProductZongServiceDelegate <NSObject>

@optional
- (void)successOfGetWmsProductZong:(nullable CheckStockListModel *)checkStockListM;

@optional
- (void)successOfGetWmsProductZong_NoData;

@optional
- (void)failureOfGetWmsProductZong:(nullable NSString *)msg;

@end

@interface GetWmsProductZongService : NSObject

@property (weak, nonatomic, nullable) id <GetWmsProductZongServiceDelegate> delegate;

/**
 获取物流订单列表
 
 @param BusinessCode     业务code
 @param ProductNo        产品号
 @param strPage          页数
 @param strPageCount     数目
 */
- (void)GetWmsProductZong:(nullable NSString *)BusinessCode andProductNo:(nullable NSString *)ProductNo andstrPage:(NSUInteger)strPage andstrPageCount:(NSUInteger)strPageCount;

@end
