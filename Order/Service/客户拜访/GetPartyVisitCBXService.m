
//
//  GetPartyVisitCBXService.m
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitCBXService.h"

#import <AFNetworking.h>

#define kAPI_NAME_GetPartyVisitCBX @"获取下拉框数据"
#define kAPI_NAME_GetPartyVisitChannel @"获取渠道"

@implementation GetPartyVisitCBXService

- (void)GetPartyVisitCBX:(nullable NSString *)strBusinessCode {
    
    NSDictionary *parameters = @{
                                 @"strBusinessCode" : strBusinessCode,
                                 @"strLicense" : @""
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetPartyVisitCBX, kAPI_NAME_GetPartyVisitCBX, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetPartyVisitCBX parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求%@成功---%@", kAPI_NAME_GetPartyVisitCBX, responseObject);
        
        int type = [responseObject[@"type"] intValue];
        id result = responseObject[@"result"];
        NSString *msg = responseObject[@"msg"];
        
        GetPartyVisitCBXModel *getPartyVisitCBXM = [[GetPartyVisitCBXModel alloc] initWithDictionary:result];
        
        if(type == 1) {
            
            [self successOfGetPartyVisitCBX:getPartyVisitCBXM];
        } else {
            
            [self failureOfGetPartyVisitCBX:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求%@失败:%@", kAPI_NAME_GetPartyVisitCBX, error);
        [self failureOfGetPartyVisitCBX:[NSString stringWithFormat:@"请求%@失败", kAPI_NAME_GetPartyVisitCBX]];
    }];
}


// 成功
- (void)successOfGetPartyVisitCBX:(GetPartyVisitCBXModel *)getPartyVisitCBXM {
    
    if([_delegate respondsToSelector:@selector(successOfGetPartyVisitCBX:)]) {
        
        [_delegate successOfGetPartyVisitCBX:getPartyVisitCBXM];
    }
}


// 失败
- (void)failureOfGetPartyVisitCBX:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetPartyVisitCBX:)]) {
        
        [_delegate failureOfGetPartyVisitCBX:msg];
    }
}


@end
