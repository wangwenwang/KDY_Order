//
//  Store_GetOupputInfoService.m
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "Store_GetOupputInfoService.h"
#import <AFNetworking.h>

@implementation Store_GetOupputInfoService

#pragma mark - 出库列表

- (void)GetOupputInfo:(NSInteger)OutputIdx {
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @(OutputIdx), @"OutputIdx",
                                @"", @"strLicense",
                                nil];
    
    NSLog(@"请求出库详情参数：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetOupputInfo parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求出库详情成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            GetOupputDetailModel *getOupputDetailM = [[GetOupputDetailModel alloc] initWithDictionary:responseObject[@"result"]];
                
                [self successOfGetOupputInfo:getOupputDetailM];
        } else {
            
            [self failureOfGetOupputInfo:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求出库详情失败:%@", error);
        [self failureOfGetOupputInfo:nil];
    }];
}


// 成功
- (void)successOfGetOupputInfo:(GetOupputDetailModel *)getOupputDetailM {
    
    if([_delegate respondsToSelector:@selector(successOfGetOupputInfo:)]) {
        
        [_delegate successOfGetOupputInfo:getOupputDetailM];
    }
}


// 失败
- (void)failureOfGetOupputInfo:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetOupputInfo:)]) {
        
        [_delegate failureOfGetOupputInfo:msg];
    }
}


#pragma mark - 确认出库

- (void)confirm:(NSInteger)Output_idx andADUT_USER:(NSString *)ADUT_USER {
    
    NSDictionary *parameters = @{
                                 @"Output_idx": @(Output_idx),
                                 @"ADUT_USER": ADUT_USER,
                                 @"strLicense": @""
                                 };
    
    NSLog(@"确认出库参数：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_OutPutWorkflow parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            NSLog(@"确认出库成功---%@", responseObject);
            if([_delegate respondsToSelector:@selector(successOfOutPutWorkflow:)]) {
                
                [_delegate successOfOutPutWorkflow:msg];
            }
        } else {
            
            NSLog(@"确认出库失败---%@", responseObject);
            [self failureOfOutPutWorkflow:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"确认出库失败:%@", error);
        [self failureOfOutPutWorkflow:@"请求失败"];
    }];
}


- (void)failureOfOutPutWorkflow:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfOutPutWorkflow:)]) {
        
        [_delegate failureOfOutPutWorkflow:msg];
    }
}


#pragma mark - 取消出库

- (void)cancel:(NSInteger)OutputIdx andOPER_USER:(NSString *)OPER_USER {
    
    NSDictionary *parameters = @{
                                 @"OutputIdx": @(OutputIdx),
                                 @"OPER_USER": OPER_USER,
                                 @"strLicense": @""
                                 };
    
    NSLog(@"取消出库参数：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_OutPutCancel parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"取消出库成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            if([_delegate respondsToSelector:@selector(successOfOutPutCancel:)]) {
                
                [_delegate successOfOutPutCancel:msg];
            }
        } else {
            
            [self failureOfOutPutCancel:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"确认出库失败:%@", error);
        [self failureOfOutPutCancel:@"请求失败"];
    }];
}




- (void)failureOfOutPutCancel:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfOutPutCancel:)]) {
        
        [_delegate failureOfOutPutCancel:msg];
    }
}

@end
