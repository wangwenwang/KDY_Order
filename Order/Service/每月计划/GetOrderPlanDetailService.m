//
//  GetOrderPlanDetailService.m
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetOrderPlanDetailService.h"
#import <AFNetworking.h>

#define kAPI_NAME @"每月计划详情"

@implementation GetOrderPlanDetailService

- (void)GetOrderPlanDetail:(nullable NSString *)ORDER_IDX {
    
    NSDictionary *parameters = @{
                                 @"strOrderId" : ORDER_IDX,
                                 @"strLicense" : @"",
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetOrderPlanDetail, kAPI_NAME, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetOrderPlanDetail parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求%@成功---%@", kAPI_NAME, responseObject);
        
        int type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        MonthlyPlanInfoModel *monthlyPlanInfoM = [[MonthlyPlanInfoModel alloc] initWithDictionary:responseObject[@"result"][@"order"]];
        
        if(type == 1) {
            
            [self successOfGetOrderPlanDetail:monthlyPlanInfoM];
        } else {
            
            [self failureOfGetOrderPlanDetail:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求%@失败:%@", kAPI_NAME, error);
        [self failureOfGetOrderPlanDetail:[NSString stringWithFormat:@"请求%@失败", kAPI_NAME]];
    }];
}


// 成功
- (void)successOfGetOrderPlanDetail:(MonthlyPlanInfoModel *)monthlyPlanInfoM {
    
    if([_delegate respondsToSelector:@selector(successOfGetOrderPlanDetail:)]) {
        
        [_delegate successOfGetOrderPlanDetail:monthlyPlanInfoM];
    }
}


// 失败
- (void)failureOfGetOrderPlanDetail:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetOrderPlanDetail:)]) {
        
        [_delegate failureOfGetOrderPlanDetail:msg];
    }
}

@end
