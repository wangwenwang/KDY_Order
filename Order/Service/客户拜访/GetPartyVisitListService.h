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

@optional
- (void)successOfGetPartyVisitList:(nullable GetPartyVisitListModel *)getPartyVisitListM;

@optional
- (void)successOfGetPartyVisitList_NoData;

@optional
- (void)failureOfGetPartyVisitList:(nullable NSString *)msg;

@end

@interface GetPartyVisitListService : NSObject

@property (weak, nonatomic, nullable) id <GetPartyVisitListServiceDelegate> delegate;

/**
 获取客户拜访列表
 
 @param strPage          页数
 @param strPageCount     数目
 @param strSearch        搜索关键词
 @param strLine          拜访线路
 @param status           拜访状态
 @param strUserID        用户ID
 */
- (void)GetPartyVisitList:(NSUInteger)strPage andstrPageCount:(NSUInteger)strPageCount andStrSearch:(nullable NSString *)strSearch andStrLine:(nullable NSString *)strLine andStatus:(nullable NSString *)status andStrUserID:(nullable NSString *)strUserID;

@end
