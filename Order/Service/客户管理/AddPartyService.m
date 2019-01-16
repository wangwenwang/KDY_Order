//
//  AddPartyService.m
//  Order
//
//  Created by 凯东源 on 17/7/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "AddPartyService.h"
#import <AFNetworking.h>

#define kAPIName_AddParty @"加入客户资料"

#define kAPIName_ObtainPartyCode @"获取客户编号"

#pragma mark - 加入客户资料


@implementation AddPartyService


- (void)AddParty:(NSString *)strUserId andPARTY_NAME:(NSString *)PARTY_NAME andPARTY_CITY:(NSString *)PARTY_CITY andPARTY_REMARK:(NSString *)PARTY_REMARK andBUSINESS_IDX:(NSString *)BUSINESS_IDX andStrLINE:(NSString *)strLINE andStrCHANNEL:(NSString *)strCHANNEL andPARTY_CODE:(NSString *)PARTY_CODE {
    
    strUserId = strUserId ? strUserId : @"";
    PARTY_NAME = PARTY_NAME ? PARTY_NAME : @"";
    PARTY_CITY = PARTY_CITY ? PARTY_CITY : @"";
    PARTY_REMARK = PARTY_REMARK ? PARTY_REMARK : @"";
    BUSINESS_IDX = BUSINESS_IDX ? BUSINESS_IDX : @"";
    strLINE = strLINE ? strLINE : @"";
    strCHANNEL = strCHANNEL ? strCHANNEL : @"";
    PARTY_CODE = PARTY_CODE ? PARTY_CODE : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strUserId" : strUserId,
                                 @"PARTY_NAME" : PARTY_NAME,
                                 @"PARTY_CITY" : PARTY_CITY,
                                 @"PARTY_REMARK" : PARTY_REMARK,
                                 @"BUSINESS_IDX" : BUSINESS_IDX,
                                 @"strLINE" : strLINE,
                                 @"strCHANNEL" : strCHANNEL,
                                 @"PARTY_CODE" : PARTY_CODE,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"接口:%@请求%@参数:%@", API_AddParty, kAPIName_AddParty, parameters);
    
    [manager POST:API_AddParty parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"%@,请求成功,返回值:%@", kAPIName_AddParty, responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        AddPartyModel *m;
        @try {
            m = [[AddPartyModel alloc] initWithDictionary:responseObject[@"result"]];
        }@catch (NSException *exception) {
        }

        if(type == 1) {
            
            [self successOfAddParty:msg andAddPartyM:m];
            LMLog(@"%@成功，msg:%@", kAPIName_AddParty, msg);
        } else if(type == -1){
            
            [self failureOfAddParty:msg];
            LMLog(@"%@失败，msg:%@", kAPIName_AddParty, msg);
        } else {
            
            [self failureOfAddParty:msg];
            LMLog(@"%@失败，msg:%@", kAPIName_AddParty, msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfAddParty:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName_AddParty, error);
    }];
    
}


#pragma mark - 功能函数

- (void)successOfAddParty:(NSString *)msg andAddPartyM:(AddPartyModel *)AddPartyM {
    
    if([_delegate respondsToSelector:@selector(successOfAddParty:andAddPartyM:)]) {
        
        [_delegate successOfAddParty:msg andAddPartyM:AddPartyM];
    }
}


- (void)failureOfAddParty:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfAddParty:)]) {
        
        [_delegate failureOfAddParty:msg];
    }
}


- (void)ObtainPartyCode:(NSString *)strBusinessCode andStrBusinessIDX:(NSString *)strBusinessIDX {
    
    strBusinessCode = strBusinessCode ? strBusinessCode : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strBusinessCode" : strBusinessCode,
                                 @"strBusinessIDX" : strBusinessIDX,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"接口:%@请求%@参数:%@", API_ObtainPartyCode, kAPIName_ObtainPartyCode, parameters);
    
    [manager POST:API_ObtainPartyCode parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"%@,请求成功,返回值:%@", kAPIName_ObtainPartyCode, responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *partyCode;
        @try {
           partyCode = responseObject[@"result"][0][@"PartyCode"];
        }@catch (NSException *exception) {
        }
        
        if(type == 1) {
            
            if([_delegate respondsToSelector:@selector(successOfObtainPartyCode:)]) {
                
                [_delegate successOfObtainPartyCode:partyCode];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        LMLog(@"%@时，请求失败，error:%@", kAPIName_ObtainPartyCode, error);
    }];
}

@end
