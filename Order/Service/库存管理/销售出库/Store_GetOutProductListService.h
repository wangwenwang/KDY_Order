//
//  Store_GetOutProductListService.h
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockProductListModel.h"


@protocol Store_GetOutProductListServiceDelegate <NSObject>

/// 出库产品列表 成功
@optional
- (void)successOfGetOutProductList:(nullable NSMutableArray *)products;

/// 出库产品列表 没有数据
@optional
- (void)successOfGetOutProductList_NoData;

/// 出库产品列表 失败
@optional
- (void)failureOfGetOutProductList:(nullable NSString *)msg;

@end


@interface Store_GetOutProductListService : NSObject

@property (weak, nonatomic)id <Store_GetOutProductListServiceDelegate> delegate;


/**
 获取产品列表

 @param strProductType        产品类型
 @param strProductClass       产品品类
 @param strPartyAddressIdx    客户地址idx
 @param strPage               页码
 @param strPageCount          页面条数
 */
- (void)GetOutProductList:(nullable NSString *)strProductType andstrProductClass:(nullable NSString *)strProductClass andstrPartyAddressIdx:(NSInteger)strPartyAddressIdx andstrPage:(NSInteger)strPage andstrPageCount:(NSInteger)strPageCount;

@end
