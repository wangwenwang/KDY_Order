//
//  GetPartyVisitCBXService.h
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetPartyVisitCBXModel.h"

@protocol GetPartyVisitCBXServiceDelegate <NSObject>

@optional
- (void)successOfGetPartyVisitCBX:(nullable GetPartyVisitCBXModel *)getPartyVisitCBXM;

@optional
- (void)failureOfGetPartyVisitCBX:(nullable NSString *)msg;

@end

@interface GetPartyVisitCBXService : NSObject

@property (weak, nonatomic, nullable) id <GetPartyVisitCBXServiceDelegate> delegate;

/**
 获取下拉框数据
 */
- (void)GetPartyVisitCBX:(nullable NSString *)strBusinessCode;

@end
