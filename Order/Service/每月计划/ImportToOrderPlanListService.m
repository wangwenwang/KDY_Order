//
//  ImportToOrderPlanListService.m
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "ImportToOrderPlanListService.h"
#import <AFNetworking.h>

@implementation ImportToOrderPlanListService

- (void)ImportToOrderPlanList:(NSString *)order {
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                order, @"strOrderInfo",
                                @"", @"strLicense",
                                nil];
    
    NSLog(@"%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];;
    
    [manager POST:API_ImportToOrderPlanList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"下单成功---%@", responseObject);
        
        int type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(type == 0) {
            
            [_delegate successOfImportToOrderPlanList:msg];
        } else {
            
            [self failureOfImportToOrderPlanList:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败---%@", error);
        [self failureOfImportToOrderPlanList:nil];
    }];
}


- (void)failureOfImportToOrderPlanList:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfImportToOrderPlanList:)]) {
        
        [_delegate failureOfImportToOrderPlanList:msg];
    }
}

@end
