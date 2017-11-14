//
//  Store_GetOutProductListService.m
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "Store_GetOutProductListService.h"
#import "AppDelegate.h"
#import <AFNetworking.h>
#import "ProductModel.h"

@interface Store_GetOutProductListService ()

@property (strong, nonatomic) AppDelegate *app;

@end

@implementation Store_GetOutProductListService



- (instancetype)init {
    
    if (self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)GetOutProductList:(nullable NSString *)strProductType andstrProductClass:(nullable NSString *)strProductClass andstrPartyAddressIdx:(NSInteger)strPartyAddressIdx andstrPage:(NSInteger)strPage andstrPageCount:(NSInteger)strPageCount {
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                _app.business.BUSINESS_IDX, @"Business_idx",
                                strProductType, @"strProductType",
                                strProductClass, @"strProductClass",
                                @(strPartyAddressIdx), @"strPartyAddressIdx",
                                @(strPage), @"strPage",
                                @(strPageCount), @"strPageCount",
                                @"", @"strLicense",
                                nil];
    
    NSLog(@"请求产品参数：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetOutProductList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求出库产品数据成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            NSMutableArray *products = [[NSMutableArray alloc] init];
            
            NSArray *arrResult = responseObject[@"result"];
            if([arrResult isKindOfClass:[NSArray class]]) {
                if(arrResult.count < 1) {
                    [self failureOfGetOutProductList:@"获取产品数据失败，数据为空！"];
                }else {
                    for(int i = 0; i < arrResult.count; i++) {
                        ProductModel *m = [[ProductModel alloc] init];
                        [m setDict:arrResult[i]];
                        
                        [products addObject:m];
                    }
                    
                    if([_delegate respondsToSelector:@selector(successOfGetOutProductList:)]) {
                        
                        [_delegate successOfGetOutProductList:products];
                    }
                }
            }else {
                [self failureOfGetOutProductList:msg];
            }
        } else {
            
            [self failureOfGetOutProductList:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求产品类型失败:%@", error);
        [self failureOfGetOutProductList:@"请求产品类型失败"];
    }];
}


// 成功
- (void)successOfGetOutProductList:(NSMutableArray *)products {
    
    if([_delegate respondsToSelector:@selector(successOfGetOutProductList:)]) {
        
        [_delegate successOfGetOutProductList:products];
    }
}


// 没有数据
- (void)successOfGetOutProductList_NoData {
    
    if([_delegate respondsToSelector:@selector(successOfGetOutProductList_NoData)]) {
        
        [_delegate successOfGetOutProductList_NoData];
    }
}


// 失败
- (void)failureOfGetOutProductList:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetOutProductList:)]) {
        
        [_delegate failureOfGetOutProductList:msg];
    }
}


- (void)getProductsData:(nullable NSString *)orderPartyId andOrderAddressIdx:(nullable NSString *)orderAddressIdx andProductTypeIndex:(int)index andProductType:(nullable NSString *)productType andOrderBrand:(nullable NSString *)orderBrand {
    
    orderPartyId = orderPartyId ? orderPartyId : @"";
    orderAddressIdx = orderAddressIdx ? orderAddressIdx : @"";
    index = index ? index : 0;
    productType = productType ? productType : @"";
    orderBrand = orderBrand ? orderBrand : @"";
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                _app.business.BUSINESS_IDX, @"strBusinessId",
                                orderPartyId, @"strPartyIdx",
                                orderAddressIdx, @"strPartyAddressIdx",
                                @"", @"strLicense",
                                productType, @"strProductType",
                                orderBrand, @"strProductClass",
                                nil];
    
    NSLog(@"请求产品参数：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetInputProductListType parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求产品数据成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            NSMutableArray *products = [[NSMutableArray alloc] init];
            
            NSArray *arrResult = responseObject[@"result"];
            if([arrResult isKindOfClass:[NSArray class]]) {
                if(arrResult.count < 1) {
                    [self failureOfGetOutProductList:@"获取产品数据失败，数据为空！"];
                }else {
                    for(int i = 0; i < arrResult.count; i++) {
                        ProductModel *m = [[ProductModel alloc] init];
                        [m setDict:arrResult[i]];
                        
                        [products addObject:m];
                    }
                    
                    if([_delegate respondsToSelector:@selector(successOfGetOutProductList:)]) {
                        
                        [_delegate successOfGetOutProductList:products];
                    }
                }
            }else {
                [self failureOfGetOutProductList:msg];
            }
        }else {
            [self failureOfGetOutProductList:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求产品类型失败:%@", error);
        [self failureOfGetOutProductList:nil];
    }];
}

@end
