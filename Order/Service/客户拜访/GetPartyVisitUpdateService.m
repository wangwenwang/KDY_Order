//
//  GetPartyVisitUpdateService.m
//  Order
//
//  Created by wenwang wang on 2018/11/7.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitUpdateService.h"

#import <AFNetworking.h>

#define kAPI_NAME @"修改客户拜访"

@implementation GetPartyVisitUpdateService

- (void)GetPartyVisitUpdate:(nullable NSString *)IDX
                andPARTY_NO:(nullable NSString *)PARTY_NO
              andPARTY_NAME:(nullable NSString *)PARTY_NAME
                andCONTACTS:(nullable NSString *)CONTACTS
            andCONTACTS_TEL:(nullable NSString *)CONTACTS_TEL
           andPARTY_ADDRESS:(nullable NSString *)PARTY_ADDRESS
               andUSER_NAME:(nullable NSString *)USER_NAME
                 andUSER_NO:(nullable NSString *)USER_NO
              andCHANNEL_NO:(nullable NSString *)CHANNEL_NO
             andPARTY_LEVEL:(nullable NSString *)PARTY_LEVEL
  andWEEKLY_VISIT_FREQUENCY:(nullable NSString *)WEEKLY_VISIT_FREQUENCY
              andVISIT_DATE:(nullable NSString *)VISIT_DATE
            andOPERATOR_IDX:(nullable NSString *)OPERATOR_IDX
            andPARTY_STATES:(nullable NSString *)PARTY_STATES
           andNECESSARY_SKU:(nullable NSString *)NECESSARY_SKU
      andSINGLE_STORE_SALES:(nullable NSString *)SINGLE_STORE_SALES
        andVISIT_THE_TARGET:(nullable NSString *)VISIT_THE_TARGET
     andREACH_THE_SITUATION:(nullable NSString *)REACH_THE_SITUATION
            andBUSINESS_IDX:(nullable NSString *)BUSINESS_IDX
        andORGANIZATION_IDX:(nullable NSString *)ORGANIZATION_IDX
        andLINE:(nullable NSString *)LINE {
    
    NSDictionary *parameters = @{
                                 @"IDX" : IDX,
                                 @"PARTY_NO" : PARTY_NO,
                                 @"PARTY_NAME" : PARTY_NAME,
                                 @"CONTACTS" : CONTACTS,
                                 @"CONTACTS_TEL" : CONTACTS_TEL,
                                 @"PARTY_ADDRESS" : PARTY_ADDRESS,
                                 @"USER_NAME" : USER_NAME,
                                 @"USER_NO" : USER_NO,
                                 @"CHANNEL_NO" : CHANNEL_NO,
                                 @"PARTY_LEVEL" : PARTY_LEVEL,
                                 @"WEEKLY_VISIT_FREQUENCY" : WEEKLY_VISIT_FREQUENCY,
                                 @"VISIT_DATE" : VISIT_DATE,
                                 @"OPERATOR_IDX" : OPERATOR_IDX,
                                 @"PARTY_STATES" : PARTY_STATES,
                                 @"NECESSARY_SKU" : NECESSARY_SKU,
                                 @"SINGLE_STORE_SALES" : SINGLE_STORE_SALES,
                                 @"VISIT_THE_TARGET" : VISIT_THE_TARGET,
                                 @"REACH_THE_SITUATION" : REACH_THE_SITUATION,
                                 @"BUSINESS_IDX" : BUSINESS_IDX,
                                 @"ORGANIZATION_IDX" : ORGANIZATION_IDX,
                                 @"LINE" : LINE,
                                 @"strLicense" : @""
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetPartyVisitUpdate, kAPI_NAME, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetPartyVisitUpdate parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME, responseObject);
        
        int type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(type == 1) {
            
            [self successOfGetPartyVisitUpdateService:msg];
        } else {
            
            [self failureOfGetPartyVisitUpdateService:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@|请求失败:%@", kAPI_NAME, error);
        [self failureOfGetPartyVisitUpdateService:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME]];
    }];
}


// 成功
- (void)successOfGetPartyVisitUpdateService:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(successOfGetPartyVisitUpdateService:)]) {
        
        [_delegate successOfGetPartyVisitUpdateService:msg];
    }
}


// 失败
- (void)failureOfGetPartyVisitUpdateService:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetPartyVisitUpdateService:)]) {
        
        [_delegate failureOfGetPartyVisitUpdateService:msg];
    }
}

@end
