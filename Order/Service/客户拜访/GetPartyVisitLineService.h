//
//  GetPartyVisitLineService.h
//  Order
//
//  Created by wenwang wang on 2018/11/15.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 客户拜访线路
 */
@protocol GetPartyVisitLineServiceDelegate <NSObject>

@optional
- (void)successOfGetPartyVisitLine:(nullable NSArray *)line;

@optional
- (void)failureOfGetPartyVisitLine:(nullable NSString *)msg;

// 获取渠道
@optional
- (void)successOfGetPartyVisitChannel:(nullable NSArray *)arr;

@optional
- (void)failureOfGetPartyVisitChannel:(nullable NSString *)msg;

@end

@interface GetPartyVisitLineService : NSObject

@property (nullable, weak, nonatomic)id <GetPartyVisitLineServiceDelegate> delegate;

- (void)GetPartyVisitLine;


/**
 获取渠道
 */
- (void)GetPartyVisitChannel;

@end
