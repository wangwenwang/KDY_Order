//
//  GetPartyVisitLineService.m
//  Order
//
//  Created by wenwang wang on 2018/11/15.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitLineService.h"
#import <AFNetworking.h>

#define kAPI_NAME_GetPartyVisitLine @"获取拜访路线"
#define kAPI_NAME_GetPartyVisitChannel @"获取渠道"

@implementation GetPartyVisitLineService


- (void)GetPartyVisitLine {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strLicense" : @""
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetPartyVisitUpdate, kAPI_NAME_GetPartyVisitLine, parameters);
    
    [manager POST:API_GetPartyVisitLine parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME_GetPartyVisitLine, responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        NSArray *result = responseObject[@"result"];
        
        
        if(_type == 1) {
            
            if([_delegate respondsToSelector:@selector(successOfGetPartyVisitLine:)]) {
                
                [_delegate successOfGetPartyVisitLine:result];
            }
        }else {
            
            if([_delegate respondsToSelector:@selector(failureOfGetPartyVisitLine:)]) {
                
                [_delegate failureOfGetPartyVisitLine:msg];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@|请求失败:%@", kAPI_NAME_GetPartyVisitLine, error);
        if([_delegate respondsToSelector:@selector(failureOfGetPartyVisitLine:)]) {
            
            [_delegate failureOfGetPartyVisitLine:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME_GetPartyVisitLine]];
        }
    }];
}


- (void)GetPartyVisitChannel {
    
    NSDictionary *parameters = @{
                                 @"strLicense" : @""
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetPartyVisitChannel, kAPI_NAME_GetPartyVisitChannel, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetPartyVisitChannel parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求%@成功---%@", kAPI_NAME_GetPartyVisitChannel, responseObject);
        
        int type = [responseObject[@"type"] intValue];
        NSArray *result = responseObject[@"result"];
        NSString *msg = responseObject[@"msg"];
        
        NSMutableArray *arrM = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in result) {
            
            [arrM addObject:dict[@"ITEM_NAME"]];
        }
        if(type == 1) {
            
            if([_delegate respondsToSelector:@selector(successOfGetPartyVisitChannel:)]) {
                
                [_delegate successOfGetPartyVisitChannel:[arrM copy]];
            }
        } else {
            
            if([_delegate respondsToSelector:@selector(failureOfGetPartyVisitChannel:)]) {
                
                [_delegate failureOfGetPartyVisitChannel:msg];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求%@失败:%@", kAPI_NAME_GetPartyVisitChannel, error);
        if([_delegate respondsToSelector:@selector(failureOfGetPartyVisitChannel:)]) {
            
            [_delegate failureOfGetPartyVisitChannel:[NSString stringWithFormat:@"请求%@失败", kAPI_NAME_GetPartyVisitChannel]];
        }
    }];
}

@end
