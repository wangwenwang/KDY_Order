//
//  GetPartyVisitListService.m
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitListService.h"

#import <AFNetworking.h>

#define kAPI_NAME_GetFirstPartyList @"获取供货商客户列表"

#define kAPI_NAME_GetPartyVisitList @"获取客户拜访列表"

@implementation GetPartyVisitListService

- (void)GetFirstPartyList:(nullable NSString *)strUserId andStrBusinessId:(nullable NSString *)strBusinessId {
    
    NSDictionary *parameters = @{
                                 @"strUserId" : strUserId,
                                 @"strBusinessId" : strBusinessId,
                                 @"strLicense" : @""
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", kAPI_NAME_GetFirstPartyList, API_GetFirstPartyList, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetFirstPartyList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME_GetFirstPartyList, responseObject);
        
        int type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            GetPartyVisitListModel *getPartyVisitListM = [[GetPartyVisitListModel alloc] initWithDictionary:responseObject];
            
            if(type == 1) {
                
                if(getPartyVisitListM.getPartyVisitItemModel.count < 1) {
                    
                    [self failureOfGetFirstPartyList:@"找不到供货商，请联系管理员"];
                } else {
                    
                    [self successOfGetFirstPartyList:getPartyVisitListM];
                }
            } else if(type == -2) {
                
                [self failureOfGetFirstPartyList:@"找不到供货商，请联系管理员"];
            } else {
                
                [self failureOfGetFirstPartyList:msg];
            }
        } else {
            
            [self failureOfGetFirstPartyList:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@|请求失败:%@", kAPI_NAME_GetFirstPartyList, error);
        [self failureOfGetFirstPartyList:[NSString stringWithFormat:@"请求%@失败", kAPI_NAME_GetFirstPartyList]];
    }];
}


// 成功
- (void)successOfGetFirstPartyList:(GetPartyVisitListModel *)checkStockListM {
    
    if([_delegate respondsToSelector:@selector(successOfGetFirstPartyList:)]) {
        
        [_delegate successOfGetFirstPartyList:checkStockListM];
    }
}


// 失败
- (void)failureOfGetFirstPartyList:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetFirstPartyList:)]) {
        
        [_delegate failureOfGetFirstPartyList:msg];
    }
}

- (void)GetPartyVisitList:(NSUInteger)strPage andstrPageCount:(NSUInteger)strPageCount andStrSearch:(nullable NSString *)strSearch andStrLine:(nullable NSString *)strLine andStatus:(nullable NSString *)status andStrUserID:(nullable NSString *)strUserID andStrFartherPartyID:(nullable NSString *)strFartherPartyID {
    
    NSDictionary *parameters = @{
                                 @"strPage" : @(strPage),
                                 @"strPageCount" : @(strPageCount),
                                 @"strSearch" : strSearch,
                                 @"strLine" : strLine,
                                 @"strStates" : status,
                                 @"strUserID" : strUserID,
                                 @"strFartherPartyID" : strFartherPartyID,
                                 @"strLicense" : @""
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetPartyVisitList, kAPI_NAME_GetPartyVisitList, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetPartyVisitList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSLog(@"%@|请求成功---%@", kAPI_NAME_GetPartyVisitList, responseObject);
        
        int type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if([responseObject isKindOfClass:[NSDictionary class]]) {
            GetPartyVisitListModel *getPartyVisitListM = [[GetPartyVisitListModel alloc] initWithDictionary:responseObject];

            if(type == 1) {

                if(getPartyVisitListM.getPartyVisitItemModel.count < 1) {

                     [self successOfGetPartyVisitList_NoData:strSearch];
                } else {

                    [self successOfGetPartyVisitList:getPartyVisitListM andsStrSearch:strSearch];
                }
            } else if(type == -2) {

                [self successOfGetPartyVisitList_NoData:strSearch];
            } else {

                [self failureOfGetPartyVisitList:msg];
            }
        } else {
            
            [self failureOfGetPartyVisitList:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@|请求失败:%@", kAPI_NAME_GetPartyVisitList, error);
        [self failureOfGetPartyVisitList:[NSString stringWithFormat:@"请求%@失败", kAPI_NAME_GetPartyVisitList]];
    }];
}


// 成功
- (void)successOfGetPartyVisitList:(GetPartyVisitListModel *)checkStockListM andsStrSearch:(nullable NSString *)strSearch {
    
    if([_delegate respondsToSelector:@selector(successOfGetPartyVisitList:andsStrSearch:)]) {
        
        [_delegate successOfGetPartyVisitList:checkStockListM andsStrSearch:strSearch];
    }
}


// 没有数据
- (void)successOfGetPartyVisitList_NoData:(nullable NSString *)strSearch {
    
    if([_delegate respondsToSelector:@selector(successOfGetPartyVisitList_NoData:)]) {
        
        [_delegate successOfGetPartyVisitList_NoData:strSearch];
    }
}


// 失败
- (void)failureOfGetPartyVisitList:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetPartyVisitList:)]) {
        
        [_delegate failureOfGetPartyVisitList:msg];
    }
}

@end
