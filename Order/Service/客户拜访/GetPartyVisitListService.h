//
//  GetPartyVisitListService.h
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetPartyVisitListModel.h"

@protocol GetPartyVisitListServiceDelegate <NSObject>

/// 获取经销商客户列表
@optional
- (void)successOfGetFirstPartyList:(nullable GetPartyVisitListModel *)getFirstPartyListM;

@optional
- (void)failureOfGetFirstPartyList:(nullable NSString *)msg;

/// 获取客户拜访列表
@optional
- (void)successOfGetPartyVisitList:(nullable GetPartyVisitListModel *)getPartyVisitListM andsStrSearch:(nullable NSString *)strSearch;

@optional
- (void)successOfGetPartyVisitList_NoData:(nullable NSString *)strSearch;

@optional
- (void)failureOfGetPartyVisitList:(nullable NSString *)msg;

@end

@interface GetPartyVisitListService : NSObject

@property (weak, nonatomic, nullable) id <GetPartyVisitListServiceDelegate> delegate;

/**
 获取经销商客户列表
 
 @param strUserId         用户ID
 @param strBusinessId     业务代码ID
 */
- (void)GetFirstPartyList:(nullable NSString *)strUserId andStrBusinessId:(nullable NSString *)strBusinessId;


/**
 获取客户拜访列表
 
 @param strPage             页数
 @param strPageCount        数目
 @param strSearch           搜索关键词
 @param strLine             拜访线路
 @param status              拜访状态
 @param strUserID           用户ID
 @param strFartherPartyID   经销商ID（上级ID）
 */
- (void)GetPartyVisitList:(NSUInteger)strPage andstrPageCount:(NSUInteger)strPageCount andStrSearch:(nullable NSString *)strSearch andStrLine:(nullable NSString *)strLine andStatus:(nullable NSString *)status andStrUserID:(nullable NSString *)strUserID andStrFartherPartyID:(nullable NSString *)strFartherPartyID;

@end
