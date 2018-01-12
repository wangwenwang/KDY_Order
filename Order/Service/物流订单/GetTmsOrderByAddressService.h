//
//  GetTmsOrderByAddressService.h
//  Order
//
//  Created by 凯东源 on 2018/1/3.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TmsOrderListModel.h"

@protocol GetTmsOrderByAddressServiceDelegate <NSObject>

@optional
- (void)successOfGetTmsOrderByAddress:(nullable TmsOrderListModel *)tmsOrderListM;

@optional
- (void)successOfGetTmsOrderByAddress_NoData;

@optional
- (void)failureOfGetTmsOrderByAddress:(nullable NSString *)msg;

@end

@interface GetTmsOrderByAddressService : NSObject

@property (weak, nonatomic, nullable) id <GetTmsOrderByAddressServiceDelegate> delegate;

/**
 获取物流订单列表

 @param BusinessId     业务代码
 @param UserIdx        用户id
 @param PartyAdressId  客户地址id
 @param Page           页数
 @param Pagesize       数目
 */
- (void)GetTmsOrderByAddress:(nullable NSString *)BusinessId andUserIdx:(nullable NSString *)UserIdx  andPartyAdressId:(nullable NSString *)PartyAdressId andPage:(NSUInteger)Page andPagesize:(NSUInteger)Pagesize;

@end
