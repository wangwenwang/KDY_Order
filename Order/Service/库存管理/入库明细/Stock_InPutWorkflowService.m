//
//  Stock_InPutWorkflowService.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "Stock_InPutWorkflowService.h"
#import <AFNetworking.h>

@implementation Stock_InPutWorkflowService

- (void)InPutWorkflow:(nullable NSString *)Input_idx andADUT_USER:(nullable NSString *)ADUT_USER {
    
    NSDictionary *parameters = @{
                                 @"Input_idx" : Input_idx,
                                 @"ADUT_USER" : ADUT_USER,
                                 @"strLicense" : @"",
                                 };
    
    NSLog(@"请求入库确认参数：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_InPutWorkflow parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求入库确认成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            [self successOfInPutWorkflow:msg];
        } else {
            
            [self failureOfInPutWorkflow:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求入库确认失败:%@", error);
        [self failureOfInPutWorkflow:@"请求失败"];
    }];
}




// 成功
- (void)successOfInPutWorkflow:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(successOfInPutWorkflow:)]) {
        
        [_delegate successOfInPutWorkflow:msg];
    }
}


// 失败
- (void)failureOfInPutWorkflow:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfInPutWorkflow:)]) {
        
        [_delegate failureOfInPutWorkflow:msg];
    }
}

@end
