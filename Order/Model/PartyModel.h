//
//  PartyModel.h
//  Order
//
//  Created by 凯东源 on 16/10/12.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 客户资料
@interface PartyModel : NSObject

@property(copy, nonatomic)NSString *IDX;

@property(copy, nonatomic)NSString *PARTY_CODE;

@property(copy, nonatomic)NSString *PARTY_NAME;

@property(copy, nonatomic)NSString *PARTY_PROPERTY;

@property(copy, nonatomic)NSString *PARTY_CLASS;

@property(copy, nonatomic)NSString *PARTY_TYPE;

@property(copy, nonatomic)NSString *PARTY_COUNTRY;

@property(copy, nonatomic)NSString *PARTY_PROVINCE;

@property(copy, nonatomic)NSString *PARTY_CITY;

@property(copy, nonatomic)NSString *PARTY_REMARK;

- (void)setDict:(NSDictionary *)dict;

/// Cell高度
@property (assign, nonatomic) CGFloat cellHeight;

/// 客户等级
@property(copy, nonatomic)NSString *PARTY_LEVEL;
/// 客户状态码
@property(copy, nonatomic)NSString *PARTY_STATES;
/// 渠道
@property(copy, nonatomic)NSString *CHANNEL;
/// 拜访线路
@property(copy, nonatomic)NSString *LINE;
/// 每周拜访频率
@property(copy, nonatomic)NSString *WEEKLY_VISIT_FREQUENCY;
/// 单店销量/天
@property(copy, nonatomic)NSString *SINGLE_STORE_SALES;

@end
