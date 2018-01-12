//
//  GetTmsOrderByAddressService.m
//  Order
//
//  Created by 凯东源 on 2018/1/3.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetTmsOrderByAddressService.h"
#import <AFNetworking.h>
#import "Tools.h"

#define kAPI_NAME @"物流订单列表"

@implementation GetTmsOrderByAddressService

- (void)GetTmsOrderByAddress:(nullable NSString *)BusinessId andUserIdx:(nullable NSString *)UserIdx  andPartyAdressId:(nullable NSString *)PartyAdressId andPage:(NSUInteger)Page andPagesize:(NSUInteger)Pagesize {
    
    NSDictionary *dict = @{
                           @"BusinessId" : BusinessId,
                           @"UserIdx" : UserIdx,
                           @"PartyAdressId" : PartyAdressId,
                           @"Page" : @(Page),
                           @"Pagesize" : @(Pagesize)
                           };
    
    NSString *strParams = [Tools JsonStringWithDictonary:dict];
    
    NSDictionary *parameters = @{
                                 @"strParams" : strParams,
                                 @"strLicense" : @"",
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetOrderPlanList, kAPI_NAME, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetTmsOrderByAddress parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求%@成功---%@", kAPI_NAME, responseObject);
        
        int type = [responseObject[@"type"] intValue];
        NSDictionary *result = responseObject[@"result"];
        NSString *msg = responseObject[@"msg"];
        
        
        TmsOrderListModel *tmsOrderListM = [[TmsOrderListModel alloc] initWithDictionary:result];
        
        if(type == 1) {
            
            if(tmsOrderListM.tmsOrderItemModel.count < 1) {
                
                [self successOfGetTmsOrderByAddress_NoData];
            } else {
                
                [self successOfGetTmsOrderByAddress:tmsOrderListM];
            }
        } else if(type == -2) {
            
            [self failureOfGetTmsOrderByAddress:msg];
        } else {
            
            [self failureOfGetTmsOrderByAddress:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求%@失败:%@", kAPI_NAME, error);
        [self failureOfGetTmsOrderByAddress:[NSString stringWithFormat:@"请求%@失败", kAPI_NAME]];
    }];
}


// 成功
- (void)successOfGetTmsOrderByAddress:(TmsOrderListModel *)tmsOrderListM {
    
    if([_delegate respondsToSelector:@selector(successOfGetTmsOrderByAddress:)]) {
        
        [_delegate successOfGetTmsOrderByAddress:tmsOrderListM];
    }
}


// 没有数据
- (void)successOfGetTmsOrderByAddress_NoData {
    
    if([_delegate respondsToSelector:@selector(successOfGetTmsOrderByAddress_NoData)]) {
        
        [_delegate successOfGetTmsOrderByAddress_NoData];
    }
}


// 失败
- (void)failureOfGetTmsOrderByAddress:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetTmsOrderByAddress:)]) {
        
        [_delegate failureOfGetTmsOrderByAddress:msg];
    }
}

@end
