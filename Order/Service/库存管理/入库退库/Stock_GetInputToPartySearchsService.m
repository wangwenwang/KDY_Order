//
//  Stock_GetInputToPartySearchsService.m
//  Order
//
//  Created by 凯东源 on 2017/9/20.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "Stock_GetInputToPartySearchsService.h"
#import <AFNetworking.h>

@implementation Stock_GetInputToPartySearchsService


- (void)GetInputToPartySearchs:(NSString *)strBusinessIdxs andstrAddressIdx:(NSString *)strAddressIdx {
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                strBusinessIdxs, @"strBusinessIdx",
                                strAddressIdx, @"strAddressIdx",
                                @"", @"strLicense",
                                nil];
    
    NSLog(@"请求上一级地址参数：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetInputToPartySearch parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求上一级地址成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            InputToAddressModel *inputToAddressM = [[InputToAddressModel alloc] initWithDictionary:responseObject[@"result"][@"List"]];
            
            [self successOfGetGetInputToPartySearchs:inputToAddressM];
        } else {
            
            [self failureOfGetInputToPartySearchs:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求上一级地址失败:%@", error);
        [self failureOfGetInputToPartySearchs:nil];
    }];
}


// 成功
- (void)successOfGetGetInputToPartySearchs:(InputToAddressModel *)inputToAddressM {
    
    if([_delegate respondsToSelector:@selector(successOfGetGetInputToPartySearchs:)]) {
        
        [_delegate successOfGetGetInputToPartySearchs:inputToAddressM];
    }
}


// 失败
- (void)failureOfGetInputToPartySearchs:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetInputToPartySearchs:)]) {
        
        [_delegate failureOfGetInputToPartySearchs:msg];
    }
}

@end
