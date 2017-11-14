//
//  Stock_GetOutProductTypeService.h
//  Order
//
//  Created by 凯东源 on 2017/9/21.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol GetOutProductTypeServiceDelegate <NSObject>


/// 请求出库产品类型列表成功
@optional
- (void)successOfGetOutProductType:(NSMutableArray *)productTypes;

/// 请求出库产品类型列表失败
@optional
- (void)failureOfGetOutProductType:(NSString *)msg;


///// 请求出库产品类型列表成功_全部
//@optional
//- (void)successOfGetOutProductType_all:(NSMutableArray *)productTypes;
//
///// 请求出库产品类型列表失败_全部
//@optional
//- (void)failureOfGetOutProductType_all:(NSString *)msg;

@end

@interface Stock_GetOutProductTypeService : NSObject

@property (weak, nonatomic)id <GetOutProductTypeServiceDelegate> delegate;

- (void)GetOutProductType:(NSString *)strAddressIdx;


/**
 * 获取产品类型列表数据
 *
 * @return 发送请求是否成功
 */
- (void)getProductTypesData_All;

@end
