//
//  Stock_InPutWorkflowService.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "Stock_InPutWorkflowService.h"
#import <AFNetworking.h>

@implementation Stock_InPutWorkflowService

- (void)InPutWorkflow:(nullable NSString *)Input_idx andADUT_USER:(nullable NSString *)ADUT_USER {
    
    NSDictionary *parameters = @{
                                 @"Input_idx" : Input_idx,
                                 @"ADUT_USER" : ADUT_USER,
                                 @"strLicense" : @"",
                                 };
    
    NSLog(@"请求入库确认参数：%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_InPutWorkflow parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求入库确认成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
//        if(_type == 1) {
//            
//            InputInfoListModel *inputInfoListM = [[InputInfoListModel alloc] initWithDictionary:responseObject[@"result"]];
//            
//            [self successOfGetInputInfo:inputInfoListM];
//        } else if(_type == -2) {
//            
//            [self successOfGetInputInfo_NoData];
//        } else {
//            
//            [self failureOfGetInputInfo:msg];
//        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求入库确认失败:%@", error);
//        [self failureOfGetInputInfo:nil];
    }];
}

@end
