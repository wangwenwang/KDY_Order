//
//  GetPartyVisitInsertService.m
//  Order
//
//  Created by wenwang wang on 2018/11/6.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitInsertService.h"

#import <AFNetworking.h>

#define kAPI_NAME @"添加客户拜访"

@implementation GetPartyVisitInsertService


- (void)GetPartyVisitInsert:(nullable NSString *)PARTY_NO
              andPARTY_NAME:(nullable NSString *)PARTY_NAME
                andCONTACTS:(nullable NSString *)CONTACTS
                andCONTACTS_TEL:(nullable NSString *)CONTACTS_TEL
                andPARTY_ADDRESS:(nullable NSString *)PARTY_ADDRESS
                andUSER_NAME:(nullable NSString *)USER_NAME
                andUSER_NO:(nullable NSString *)USER_NO
                andCHANNEL:(nullable NSString *)CHANNEL
                andPARTY_LEVEL:(nullable NSString *)PARTY_LEVEL
                andWEEKLY_VISIT_FREQUENCY:(nullable NSString *)WEEKLY_VISIT_FREQUENCY
                andVISIT_DATE:(nullable NSString *)VISIT_DATE
                andOPERATOR_IDX:(nullable NSString *)OPERATOR_IDX
                andPARTY_STATES:(nullable NSString *)PARTY_STATES
                andREACH_THE_SITUATION:(nullable NSString *)REACH_THE_SITUATION
                andBUSINESS_IDX:(nullable NSString *)BUSINESS_IDX
                andORGANIZATION_IDX:(nullable NSString *)ORGANIZATION_IDX
                andLINE:(nullable NSString *)LINE {
    
    NSDictionary *parameters = @{
                                 @"PARTY_NO" : PARTY_NO,
                                 @"PARTY_NAME" : PARTY_NAME,
                                 @"CONTACTS" : CONTACTS,
                                 @"CONTACTS_TEL" : CONTACTS_TEL,
                                 @"PARTY_ADDRESS" : PARTY_ADDRESS,
                                 @"USER_NAME" : USER_NAME,
                                 @"USER_NO" : USER_NO,
                                 @"CHANNEL" : CHANNEL,
                                 @"PARTY_LEVEL" : PARTY_LEVEL,
                                 @"WEEKLY_VISIT_FREQUENCY" : WEEKLY_VISIT_FREQUENCY,
                                 @"VISIT_DATE" : VISIT_DATE,
                                 @"OPERATOR_IDX" : OPERATOR_IDX,
                                 @"PARTY_STATES" : PARTY_STATES,
                                 @"REACH_THE_SITUATION" : REACH_THE_SITUATION,
                                 @"BUSINESS_IDX" : BUSINESS_IDX,
                                 @"ORGANIZATION_IDX" : ORGANIZATION_IDX,
                                 @"LINE" : LINE,
                                 @"strLicense" : @""
                                 };
    
    NSLog(@"接口:%@请求%@参数：%@", API_GetPartyVisitInsert, kAPI_NAME, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_GetPartyVisitInsert parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME, responseObject);
        
        int type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        NSArray *result = responseObject[@"result"];
        
        if(type == 1) {

            NSString *VISIT_IDX = result[0][@"VISIT_IDX"];
            [self successOfGetPartyVisitInsertService:msg andVISIT_IDX:VISIT_IDX];
        } else {

            [self failureOfGetPartyVisitInsertService:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@|请求失败:%@", kAPI_NAME, error);
        [self failureOfGetPartyVisitInsertService:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME]];
    }];
}


// 成功
- (void)successOfGetPartyVisitInsertService:(nullable NSString *)msg andVISIT_IDX:(nullable NSString *)VISIT_IDX {
    
    if([_delegate respondsToSelector:@selector(successOfGetPartyVisitInsertService:andVISIT_IDX:)]) {
        
        [_delegate successOfGetPartyVisitInsertService:msg andVISIT_IDX:VISIT_IDX];
    }
}


// 失败
- (void)failureOfGetPartyVisitInsertService:(nullable NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfGetPartyVisitInsertService:)]) {
        
        [_delegate failureOfGetPartyVisitInsertService:msg];
    }
}

@end
