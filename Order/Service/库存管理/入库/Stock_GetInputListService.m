//
//  Stock_GetInputListService.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "Stock_GetInputListService.h"
#import <AFNetworking.h>

@implementation Stock_GetInputListService

- (void)GetInputList:(nullable NSString *)ADD_USER andstrPage:(NSInteger)strPage andstrPageCount:(NSInteger)strPageCount {
    
    NSDictionary *parameters = @{
                                 @"ADD_USER" : ADD_USER,
                                 @"strPage" : @(strPage),
                                 @"strPageCount" : @(strPageCount),
                                 @"strLicense" : @"",
                                 };
    
    NSLog(@"请求产品参数：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetInputList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求入库列表成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            InputListModel *inputListM = [[InputListModel alloc] initWithDictionary:responseObject[@"result"]];
            
            if(inputListM.inputModel.count < 1) {
                
                [self successOfGetInputList_NoData];
            } else {
                
                [self successOfGetInputList:inputListM];
            }
        } else if(_type == -2) {
            
            [self successOfGetInputList_NoData];
        } else {
            
            [self failureOfGetInputList:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求入库列表失败:%@", error);
        [self failureOfGetInputList:nil];
    }];
}


// 成功
- (void)successOfGetInputList:(InputListModel *)inputListM {
    
    if([_delegate respondsToSelector:@selector(successOfGetInputList:)]) {
        
        [_delegate successOfGetInputList:inputListM];
    }
}


// 没有数据
- (void)successOfGetInputList_NoData {
    
    if([_delegate respondsToSelector:@selector(successOfGetInputList_NoData)]) {
        
        [_delegate successOfGetInputList_NoData];
    }
}


// 失败
- (void)failureOfGetInputList:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetInputList:)]) {
        
        [_delegate failureOfGetInputList:msg];
    }
}

@end
