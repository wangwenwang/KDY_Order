//
//  Stock_GetInputToPartySearchsService.h
//  Order
//
//  Created by 凯东源 on 2017/9/20.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputToAddressModel.h"

@protocol Store_GetInputToPartySearchsServiceDelegate <NSObject>

/// 上一级地址 成功
@optional
- (void)successOfGetGetInputToPartySearchs:(InputToAddressModel *)inputToAddressM;

/// 上一级地址 失败
@optional
- (void)failureOfGetInputToPartySearchs:(NSString *)msg;

@end

@interface Stock_GetInputToPartySearchsService : NSObject

@property (weak, nonatomic)id <Store_GetInputToPartySearchsServiceDelegate> delegate;


- (void)GetInputToPartySearchs:(NSString *)strBusinessIdxs andstrAddressIdx:(NSString *)strAddressIdx;

@end
