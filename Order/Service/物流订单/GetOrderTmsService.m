//
//  GetOrderTmsService.m
//  Order
//
//  Created by 凯东源 on 2018/1/4.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetOrderTmsService.h"
#import "AppDelegate.h"
#import <AFNetworking.h>
#import "NSString+Trim.h"

@interface GetOrderTmsService ()

@property (strong, nonatomic) AppDelegate *app;

@end

@implementation GetOrderTmsService

- (instancetype)init {
    if (self = [super init]) {
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)GetOrderTms:(NSString *)orderId {
    
    if([[orderId trim] isEqualToString:@""] || orderId == nil) {
        [self failureOfGetOrderTms:@"物流订单明细失败！"];
    }
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                orderId, @"OrderIdx",
                                @"", @"strLicense",
                                nil];
    
    NSLog(@"获取订单物流信息参数:%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetOrderTms parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        if(_type == 1) {
            NSDictionary *dicResult = responseObject[@"result"];
            OrderTmsModel *tms = [[OrderTmsModel alloc] init];
            [tms setDict:dicResult];
            
            if([_delegate respondsToSelector:@selector(successOfGetOrderTms:)]) {
                [_delegate successOfGetOrderTms:tms];
            }
        } else {
            
            [self failureOfGetOrderTms:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求订单物流信息失败:%@", error);
        [self failureOfGetOrderTms:nil];
    }];
}

- (void)failureOfGetOrderTms:(NSString *)msg {
    if([_delegate respondsToSelector:@selector(failureOfGetOrderTms:)]) {
        [_delegate failureOfGetOrderTms:msg];
    }
}

@end
