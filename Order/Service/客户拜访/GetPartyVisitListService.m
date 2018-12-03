//
//  GetPartyVisitListService.m
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitListService.h"

#import <AFNetworking.h>

#define kAPI_NAME @"查看客户拜访列表"

@implementation GetPartyVisitListService

- (void)GetPartyVisitList:(NSUInteger)strPage andstrPageCount:(NSUInteger)strPageCount andStrSearch:(nullable NSString *)strSearch andStrLine:(nullable NSString *)strLine andStatus:(nullable NSString *)status andStrUserID:(nullable NSString *)strUserID {
    
    NSDictionary *parameters = @{
                                 @"strPage" : @(strPage),
                                 @"strPageCount" : @(strPageCount),
                                 @"strSearch" : strSearch,
                                 @"strLine" : strLine,
                                 @"strStates" : status,
                                 @"strUserID" : strUserID,
                                 @"strLicense" : @""
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetPartyVisitList, kAPI_NAME, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetPartyVisitList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSLog(@"%@|请求成功---%@", kAPI_NAME, responseObject);
        
        int type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            GetPartyVisitListModel *getPartyVisitListM = [[GetPartyVisitListModel alloc] initWithDictionary:responseObject];

            if(type == 1) {

                if(getPartyVisitListM.getPartyVisitItemModel.count < 1) {

                     [self successOfGetPartyVisitList_NoData];
                } else {

                    [self successOfGetPartyVisitList:getPartyVisitListM];
                }
            } else if(type == -2) {

                [self successOfGetPartyVisitList_NoData];
            } else {

                [self failureOfGetPartyVisitList:msg];
            }
        } else {
            
            [self failureOfGetPartyVisitList:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@|请求失败:%@", kAPI_NAME, error);
        [self failureOfGetPartyVisitList:[NSString stringWithFormat:@"请求%@失败", kAPI_NAME]];
    }];
}


// 成功
- (void)successOfGetPartyVisitList:(GetPartyVisitListModel *)checkStockListM {
    
    if([_delegate respondsToSelector:@selector(successOfGetPartyVisitList:)]) {
        
        [_delegate successOfGetPartyVisitList:checkStockListM];
    }
}


// 没有数据
- (void)successOfGetPartyVisitList_NoData {
    
    if([_delegate respondsToSelector:@selector(successOfGetPartyVisitList_NoData)]) {
        
        [_delegate successOfGetPartyVisitList_NoData];
    }
}


// 失败
- (void)failureOfGetPartyVisitList:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetPartyVisitList:)]) {
        
        [_delegate failureOfGetPartyVisitList:msg];
    }
}




@end
