//
//  Stock_GetOutProductTypeService.m
//  Order
//
//  Created by 凯东源 on 2017/9/21.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "Stock_GetOutProductTypeService.h"
#import <AFNetworking.h>
#import "AppDelegate.h"
#import "ProductTbModel.h"

@interface Stock_GetOutProductTypeService ()

@property (strong, nonatomic) AppDelegate *app;

@end

@implementation Stock_GetOutProductTypeService

- (instancetype)init {
    if (self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)GetOutProductType:(NSString *)strAddressIdx {
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                _app.business.BUSINESS_IDX, @"strBusinessId",
                                strAddressIdx, @"strAddressIdx",
                                @"", @"strLicense",
                                nil];
    
    NSLog(@"请求出库产品类型参数:%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetOutProductType parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求出库产品类型成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            NSMutableArray *productTypes = [[NSMutableArray alloc] init];
            ProductTbModel *model = [[ProductTbModel alloc] init];
            model.PRODUCT_TYPE = @"全部";
            model.PRODUCT_CLASS = @"全部";
            model.IDX = 100000086;
            [productTypes addObject:model];
            
            NSArray *arrResult = responseObject[@"result"];
            if([arrResult isKindOfClass:[NSArray class]]) {
                
                if(arrResult.count < 1) {
                    
                    [self failureOfGetOutProductType:@"获取产品类型失败，数据为空！"];
                } else {
                    
                    for(int i = 0; i < arrResult.count; i++) {
                        
                        ProductTbModel *m = [[ProductTbModel alloc] init];
                        [m setDict:arrResult[i]];
                        
                        
                        //剔除重复的类型，添加到productTypes
                        int k = 0;
                        int j;
                        for(j = 0; j < productTypes.count; j++) {
                            
                            ProductTbModel *mOfArr = productTypes[j];
                            if(([[m.PRODUCT_TYPE trim] isEqualToString:@""] && [[m.PRODUCT_CLASS trim] isEqualToString:@""]) || ([m.PRODUCT_TYPE isEqualToString:mOfArr.PRODUCT_TYPE] && [m.PRODUCT_CLASS isEqualToString:mOfArr.PRODUCT_CLASS])) {
                                
                                break;
                            } else {
                                
                                k++;
                            }
                        }
                        if(k == productTypes.count) {
                            [productTypes addObject:m];
                        }
                    }
                    
                    if([_delegate respondsToSelector:@selector(successOfGetOutProductType:)]) {
                        
                        [_delegate successOfGetOutProductType:productTypes];
                    }
                }
            } else {
                
                [self failureOfGetOutProductType:msg];
            }
        } else {
            
            [self failureOfGetOutProductType:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求出库产品类型失败:%@", error);
        [self failureOfGetOutProductType:@"请求出库产品类型失败"];
    }];
}

- (void)failureOfGetOutProductType:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetOutProductType:)]) {
        
        [_delegate failureOfGetOutProductType:msg];
    }
}


- (void)getProductTypesData_All {
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                _app.business.BUSINESS_IDX, @"strBusinessId",
                                @"", @"strLicense",
                                nil];
    
    NSLog(@"请求产品类型参数:%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GET_PRODUCT_TYPE parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求产品类型成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(_type == 1) {
            
            NSMutableArray *productTypes = [[NSMutableArray alloc] init];
            ProductTbModel *model = [[ProductTbModel alloc] init];
            model.PRODUCT_TYPE = @"全部";
            model.PRODUCT_CLASS = @"全部";
            model.IDX = 100000086;
            [productTypes addObject:model];
            
            NSArray *arrResult = responseObject[@"result"];
            if([arrResult isKindOfClass:[NSArray class]]) {
                
                if(arrResult.count < 1) {
                    
                    [self failureOfGetOutProductType:@"获取产品类型失败，数据为空！"];
                } else {
                    
                    for(int i = 0; i < arrResult.count; i++) {
                        
                        ProductTbModel *m = [[ProductTbModel alloc] init];
                        [m setDict:arrResult[i]];
                        
                        
                        //剔除重复的类型，添加到productTypes
                        int k = 0;
                        int j;
                        for(j = 0; j < productTypes.count; j++) {
                            
                            ProductTbModel *mOfArr = productTypes[j];
                            if(([[m.PRODUCT_TYPE trim] isEqualToString:@""] && [[m.PRODUCT_CLASS trim] isEqualToString:@""]) || ([m.PRODUCT_TYPE isEqualToString:mOfArr.PRODUCT_TYPE] && [m.PRODUCT_CLASS isEqualToString:mOfArr.PRODUCT_CLASS])) {
                                
                                break;
                            } else {
                                
                                k++;
                            }
                        }
                        if(k == productTypes.count) {
                            [productTypes addObject:m];
                        }
                    }
                    
                    if([_delegate respondsToSelector:@selector(successOfGetOutProductType:)]) {
                        
                        [_delegate successOfGetOutProductType:productTypes];
                    }
                }
            }else {
                [self failureOfGetOutProductType:msg];
            }
        }else {
            [self failureOfGetOutProductType:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求产品类型失败:%@", error);
        [self failureOfGetOutProductType:nil];
    }];
}

@end
