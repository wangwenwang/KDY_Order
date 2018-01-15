//
//  GetWmsProductSumService.m
//  Order
//
//  Created by 凯东源 on 2018/1/11.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetWmsProductSumService.h"
#import <AFNetworking.h>

#define kAPI_NAME @"查看产品库存明细列表"

@implementation GetWmsProductSumService

- (void)GetWmsProductSum:(nullable NSString *)BusinessCode andProductNo:(nullable NSString *)ProductNo andstrPage:(NSUInteger)strPage andstrPageCount:(NSUInteger)strPageCount {
    
    NSDictionary *parameters = @{
                                 @"BusinessCode" : BusinessCode,
                                 @"ProductNo" : ProductNo,
                                 @"strPage" : @(strPage),
                                 @"strPageCount" : @(strPageCount),
                                 @"strLicense" : @""
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetWmsProductSum, kAPI_NAME, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetWmsProductSum parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求%@成功---%@", kAPI_NAME, responseObject);
        
        int type = [responseObject[@"type"] intValue];
        NSDictionary *result = responseObject[@"result"];
        NSString *msg = responseObject[@"msg"];
        
        
        if([result isKindOfClass:[NSDictionary class]]) {
            CheckStockDetailListModel *checkStockDetailListM = [[CheckStockDetailListModel alloc] initWithDictionary:result];
            
            if(type == 1) {
                
                if(checkStockDetailListM.checkStockDetailItemModel.count < 1) {
                    
                    [self successOfGetWmsProductSumService_NoData];
                } else {
                    
                    [self successOfGetWmsProductSumService:checkStockDetailListM];
                }
            } else if(type == -2) {
                
                [self failureOfGetWmsProductSumService:msg];
            } else {
                
                [self failureOfGetWmsProductSumService:msg];
            }
        } else {
            [self successOfGetWmsProductSumService_NoData];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求%@失败:%@", kAPI_NAME, error);
        [self failureOfGetWmsProductSumService:[NSString stringWithFormat:@"请求%@失败", kAPI_NAME]];
    }];
}


// 成功
- (void)successOfGetWmsProductSumService:(CheckStockDetailListModel *)checkStockDetailListM {
    
    if([_delegate respondsToSelector:@selector(successOfGetWmsProductSumService:)]) {
        
        [_delegate successOfGetWmsProductSumService:checkStockDetailListM];
    }
}


// 没有数据
- (void)successOfGetWmsProductSumService_NoData {
    
    if([_delegate respondsToSelector:@selector(successOfGetWmsProductSumService_NoData)]) {
        
        [_delegate successOfGetWmsProductSumService_NoData];
    }
}


// 失败
- (void)failureOfGetWmsProductSumService:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetWmsProductSumService:)]) {
        
        [_delegate failureOfGetWmsProductSumService:msg];
    }
}

@end
