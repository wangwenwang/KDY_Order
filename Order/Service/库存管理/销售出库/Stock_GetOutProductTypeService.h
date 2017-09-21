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

@end

@interface Stock_GetOutProductTypeService : NSObject

@property (weak, nonatomic)id <GetOutProductTypeServiceDelegate> delegate;

- (void)GetOutProductType;

@end
