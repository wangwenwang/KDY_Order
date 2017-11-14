//
//  Store_GetStockNoListService.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "Store_GetStockNoListService.h"
#import <AFNetworking.h>

@implementation Store_GetStockNoListService


- (void)GetStockNoList:(nullable NSString *)IDX {
    
    NSDictionary *parameters = @{
                                 @"IDX" : IDX,
                                 @"strLicense" : @"",
                                 };
    
    NSLog(@"获取库存批次：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetStockNoList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求库存产品批次数据失败---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            NSLog(@"请求库存产品批次数据成功---%@", responseObject);
            StockNoListModel *stockNoListM = [[StockNoListModel alloc] initWithDictionary:responseObject[@"result"]];
            
            if(stockNoListM.stockNoItemModel.count < 1) {
                
                [self successOfGetStockNoList_NoData];
            } else {
                
                if([_delegate respondsToSelector:@selector(successOfGetStockNoList:)]) {
                    
                    [_delegate successOfGetStockNoList:stockNoListM];
                }
            }
        } else {
            
            [self failureOfGetStockNoList:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求库存产品批次数据成功:%@", error);
        [self failureOfGetStockNoList:nil];
    }];
}


// 成功
- (void)successOfGetStockNoList:(StockNoListModel *)stockNoListM {
    
    if([_delegate respondsToSelector:@selector(successOfGetStockNoList:)]) {
        
        [_delegate successOfGetStockNoList:stockNoListM];
    }
}


// 没有数据
- (void)successOfGetStockNoList_NoData {
    
    if([_delegate respondsToSelector:@selector(successOfGetStockNoList_NoData)]) {
        
        [_delegate successOfGetStockNoList_NoData];
    }
}


// 失败
- (void)failureOfGetStockNoList:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetStockNoList:)]) {
        
        [_delegate failureOfGetStockNoList:msg];
    }
}


#pragma mark - 流水

- (void)GetStockNoWaterList:(nullable NSString *)IDX andstrPage:(NSUInteger)strPage {
    
    NSDictionary *parameters = @{
                                 @"IDX" : IDX,
                                 @"strLicense" : @"",
                                 @"strPage" : @(strPage),
                                 @"strPageCount" : @99999,
                                 };
    
    NSLog(@"获取库存批次：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetNewStockNoList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求库存产品批次数据失败---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            NSLog(@"请求库存产品批次数据成功---%@", responseObject);
            StockNoWaterListModel *stockNoListM = [[StockNoWaterListModel alloc] initWithDictionary:responseObject[@"result"]];
            
            if(stockNoListM.stockNoWaterItemModel.count < 1) {
                
                [self successOfGetStockNoWaterList_NoData];
            } else {
                
                if([_delegate respondsToSelector:@selector(successOfGetStockNoWaterList:)]) {
                    
                    [_delegate successOfGetStockNoWaterList:stockNoListM];
                }
            }
        } else {
            
            [self failureOfGetStockNoWaterList:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求库存产品批次数据成功:%@", error);
        [self failureOfGetStockNoWaterList:nil];
    }];
}


// 成功
- (void)successOfGetStockNoWaterList:(StockNoWaterListModel *)stockNoListM {
    
    if([_delegate respondsToSelector:@selector(successOfGetStockNoWaterList:)]) {
        
        [_delegate successOfGetStockNoWaterList:stockNoListM];
    }
}


// 没有数据
- (void)successOfGetStockNoWaterList_NoData {
    
    if([_delegate respondsToSelector:@selector(successOfGetStockNoWaterList_NoData)]) {
        
        [_delegate successOfGetStockNoWaterList_NoData];
    }
}


// 失败
- (void)failureOfGetStockNoWaterList:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetStockNoWaterList:)]) {
        
        [_delegate failureOfGetStockNoWaterList:msg];
    }
}

@end
