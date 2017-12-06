//
//  GetOrderPlanListService.m
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetOrderPlanListService.h"
#import <AFNetworking.h>

#define kAPI_NAME @"每月计划列表"

@implementation GetOrderPlanListService

- (void)GetOrderPlanList:(nullable NSString *)strBusinessId andstrUserId:(nullable NSString *)strUserId andstrPartyType:(nullable NSString *)strPartyType andstrPartyId:(nullable NSString *)strPartyId andstrState:(nullable NSString *)strState andstrPage:(NSInteger)strPage andstrPageCount:(NSInteger)strPageCount {
    
    NSDictionary *parameters = @{
                                 @"strBusinessId" : strBusinessId,
                                 @"strUserId" : strUserId,
                                 @"strPartyType" : strPartyType,
                                 @"strPartyId" : strPartyId,
                                 @"strState" : strState,
                                 @"strEndDate" : @"",
                                 @"strStartDate" : @"",
                                 @"strPage" : @(strPage),
                                 @"strPageCount" : @(strPageCount),
                                 @"strLicense" : @"",
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetOrderPlanList, kAPI_NAME, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetOrderPlanList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求%@成功---%@", kAPI_NAME, responseObject);
        
        
        MonthlyPlanListModel *monthlyPlanListM = [[MonthlyPlanListModel alloc] initWithDictionary:responseObject];
        
        if([monthlyPlanListM.type intValue] == 1) {

            if(monthlyPlanListM.monthlyPlanModel.count < 1) {

                [self successOfGetOrderPlanList_NoData];
            } else {

                [self successOfGetOrderPlanList:monthlyPlanListM];
            }
        } else if([monthlyPlanListM.type intValue] == -2) {

            [self successOfGetOrderPlanList_NoData];
        } else {

            [self failureOfGetOrderPlanList:monthlyPlanListM.msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求%@失败:%@", kAPI_NAME, error);
        [self failureOfGetOrderPlanList:[NSString stringWithFormat:@"请求%@失败", kAPI_NAME]];
    }];
}


// 成功
- (void)successOfGetOrderPlanList:(MonthlyPlanListModel *)monthlyPlanListM {
    
    if([_delegate respondsToSelector:@selector(successOfGetOrderPlanList:)]) {
        
        [_delegate successOfGetOrderPlanList:monthlyPlanListM];
    }
}


// 没有数据
- (void)successOfGetOrderPlanList_NoData {
    
    if([_delegate respondsToSelector:@selector(successOfGetOrderPlanList_NoData)]) {
        
        [_delegate successOfGetOrderPlanList_NoData];
    }
}


// 失败
- (void)failureOfGetOrderPlanList:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetOrderPlanList:)]) {
        
        [_delegate failureOfGetOrderPlanList:msg];
    }
}

@end
