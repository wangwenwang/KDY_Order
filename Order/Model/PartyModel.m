//
//  PartyModel.m
//  Order
//
//  Created by 凯东源 on 16/10/12.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import "PartyModel.h"

@implementation PartyModel
- (instancetype)init {
    if(self = [super init]) {
        _IDX = @"";
        _PARTY_CODE = @"";
        _PARTY_NAME = @"";
        _PARTY_PROPERTY = 0;
        _PARTY_CLASS = @"";
        
        _PARTY_TYPE = @"";
        _PARTY_COUNTRY = 0;
        _PARTY_PROVINCE = @"";
        _PARTY_CITY = @"";
        _PARTY_REMARK = @"";
        
        _PARTY_LEVEL = @"";
        _PARTY_STATES = @"";
        _CHANNEL = @"";
        _LINE = @"";
        _WEEKLY_VISIT_FREQUENCY = @"";
        
        _SINGLE_STORE_SALES = @"";
    }
    return self;
}

- (void)setDict:(NSDictionary *)dict {
    @try {
        
        _IDX = dict[@"IDX"] ? dict[@"IDX"] : @"";
        _PARTY_CODE = dict[@"PARTY_CODE"] ? dict[@"PARTY_CODE"] : @"";
        _PARTY_NAME = dict[@"PARTY_NAME"] ? dict[@"PARTY_NAME"] : @"";
        _PARTY_PROPERTY = dict[@"PARTY_PROPERTY"] ? dict[@"PARTY_PROPERTY"] : @"";
        _PARTY_CLASS = dict[@"PARTY_CLASS"] ? dict[@"PARTY_CLASS"] : @"";
        _PARTY_TYPE = dict[@"PARTY_TYPE"] ? dict[@"PARTY_TYPE"] : @"";
        _PARTY_COUNTRY = dict[@"PARTY_COUNTRY"] ? dict[@"PARTY_COUNTRY"] : @"";
        _PARTY_PROVINCE = dict[@"PARTY_PROVINCE"] ? dict[@"PARTY_PROVINCE"] : @"";
        _PARTY_CITY = dict[@"PARTY_CITY"] ? dict[@"PARTY_CITY"] : @"";
        _PARTY_REMARK = dict[@"PARTY_REMARK"] ? dict[@"PARTY_REMARK"] : @"";
        _PARTY_LEVEL = dict[@"PARTY_LEVEL"] ? dict[@"PARTY_LEVEL"] : @"";
        _PARTY_STATES = dict[@"PARTY_STATES"] ? dict[@"PARTY_STATES"] : @"";
        _CHANNEL = dict[@"CHANNEL"] ? dict[@"CHANNEL"] : @"";
        _LINE = dict[@"LINE"] ? dict[@"LINE"] : @"";
        _WEEKLY_VISIT_FREQUENCY = dict[@"WEEKLY_VISIT_FREQUENCY"] ? dict[@"WEEKLY_VISIT_FREQUENCY"] : @"";
        _SINGLE_STORE_SALES = dict[@"SINGLE_STORE_SALES"] ? dict[@"SINGLE_STORE_SALES"] : @"";
        
    } @catch (NSException *exception) {
        
    }
}
@end
