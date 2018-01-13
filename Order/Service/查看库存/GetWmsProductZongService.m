//
//  GetWmsProductZongService.m
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetWmsProductZongService.h"
#import <AFNetworking.h>

#define kAPI_NAME @"查看产品库存汇总列表"

@implementation GetWmsProductZongService

- (void)GetWmsProductZong:(nullable NSString *)BusinessCode andProductNo:(nullable NSString *)ProductNo andstrPage:(NSUInteger)strPage andstrPageCount:(NSUInteger)strPageCount {
    
    NSDictionary *parameters = @{
                                 @"BusinessCode" : BusinessCode,
                                 @"ProductNo" : ProductNo,
                                 @"strPage" : @(strPage),
                                 @"strPageCount" : @(strPageCount),
                                 @"strLicense" : @""
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetWmsProductZong, kAPI_NAME, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetWmsProductZong parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求%@成功---%@", kAPI_NAME, responseObject);
        
        int type = [responseObject[@"type"] intValue];
        id result = responseObject[@"result"];
        NSString *msg = responseObject[@"msg"];
        
        if([result isKindOfClass:[NSDictionary class]]) {
            CheckStockListModel *checkStockListM = [[CheckStockListModel alloc] initWithDictionary:result];
            
            if(type == 1) {
                
                if(checkStockListM.checkStockItemModel.count < 1) {
                    
                    [self successOfGetWmsProductZong_NoData];
                } else {
                    
                    [self successOfGetWmsProductZong:checkStockListM];
                }
            } else if(type == -2) {
                
                [self failureOfGetWmsProductZong:msg];
            } else {
                
                [self failureOfGetWmsProductZong:msg];
            }
        } else {
            [self successOfGetWmsProductZong_NoData];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求%@失败:%@", kAPI_NAME, error);
        [self failureOfGetWmsProductZong:[NSString stringWithFormat:@"请求%@失败", kAPI_NAME]];
    }];
}


// 成功
- (void)successOfGetWmsProductZong:(CheckStockListModel *)checkStockListM {
    
    if([_delegate respondsToSelector:@selector(successOfGetWmsProductZong:)]) {
        
        [_delegate successOfGetWmsProductZong:checkStockListM];
    }
}


// 没有数据
- (void)successOfGetWmsProductZong_NoData {
    
    if([_delegate respondsToSelector:@selector(successOfGetWmsProductZong_NoData)]) {
        
        [_delegate successOfGetWmsProductZong_NoData];
    }
}


// 失败
- (void)failureOfGetWmsProductZong:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetWmsProductZong:)]) {
        
        [_delegate failureOfGetWmsProductZong:msg];
    }
}

@end
