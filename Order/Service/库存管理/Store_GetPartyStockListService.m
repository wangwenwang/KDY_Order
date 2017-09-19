//
//  Store_GetPartyStockListService.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "Store_GetPartyStockListService.h"
#import <AFNetworking.h>

@implementation Store_GetPartyStockListService

- (void)GetPartyStockList:(nullable NSString *)ADDRESS_IDX andBUSINESS_IDX:(nullable NSString *)BUSINESS_IDX andstrPage:(NSInteger)strPage andstrPageCount:(NSInteger)strPageCount {
    
    NSDictionary *parameters = @{
                                 @"ADDRESS_IDX" : ADDRESS_IDX,
                                 @"BUSINESS_IDX" : BUSINESS_IDX,
                                 @"strPage" : @(strPage),
                                 @"strPageCount" : @(strPageCount),
                                 @"strLicense" : @"",
                                 };
    
    NSLog(@"获取库存列表：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetPartyStockList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求库存列表数据成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            StockProductListModel *stockProductListM = [[StockProductListModel alloc] initWithDictionary:responseObject[@"result"]];
            
            if(stockProductListM.stockProductModel.count < 1) {
                
                [self successOfGetPartyStockList_NoData];
            } else {
                
                if([_delegate respondsToSelector:@selector(successOfGetPartyStockList:)]) {
                    
                    [_delegate successOfGetPartyStockList:stockProductListM];
                }
            }
        } else {
            
            [self failureOfGetPartyStockList:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求库存列表失败:%@", error);
        [self failureOfGetPartyStockList:nil];
    }];
}


// 成功
- (void)successOfGetPartyStockList:(StockProductListModel *)stockProductListM {
    
    if([_delegate respondsToSelector:@selector(successOfGetPartyStockList:)]) {
        
        [_delegate successOfGetPartyStockList:stockProductListM];
    }
}


// 没有数据
- (void)successOfGetPartyStockList_NoData {
    
    if([_delegate respondsToSelector:@selector(successOfGetPartyStockList_NoData)]) {
        
        [_delegate successOfGetPartyStockList_NoData];
    }
}


// 失败
- (void)failureOfGetPartyStockList:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetPartyStockList:)]) {
        
        [_delegate failureOfGetPartyStockList:msg];
    }
}

@end
