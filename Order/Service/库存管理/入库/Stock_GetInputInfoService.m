//
//  Stock_GetInputInfoService.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "Stock_GetInputInfoService.h"
#import <AFNetworking.h>

@implementation Stock_GetInputInfoService

- (void)GetInputInfo:(nullable NSString *)OutputIdx {
    
    NSDictionary *parameters = @{
                                 @"OutputIdx" : OutputIdx,
                                 @"strLicense" : @"",
                                 };
    
    NSLog(@"请求库存详情参数：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetInputInfo parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求库存详情成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            InputInfoListModel *inputInfoListM = [[InputInfoListModel alloc] initWithDictionary:responseObject[@"result"]];
            
                [self successOfGetInputInfo:inputInfoListM];
        } else if(_type == -2) {
            
            [self successOfGetInputInfo_NoData];
        } else {
            
            [self failureOfGetInputInfo:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求入库列表失败:%@", error);
        [self failureOfGetInputInfo:nil];
    }];
}


// 成功
- (void)successOfGetInputInfo:(InputInfoListModel *)inputInfoListM {
    
    if([_delegate respondsToSelector:@selector(successOfGetInputInfo:)]) {
        
        [_delegate successOfGetInputInfo:inputInfoListM];
    }
}


// 没有数据
- (void)successOfGetInputInfo_NoData {
    
    if([_delegate respondsToSelector:@selector(successOfGetInputInfo_NoData)]) {
        
        [_delegate successOfGetInputInfo_NoData];
    }
}


// 失败
- (void)failureOfGetInputInfo:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetInputInfo:)]) {
        
        [_delegate failureOfGetInputInfo:msg];
    }
}

@end
