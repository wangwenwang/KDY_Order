//
//  InputToAddressModel.h
//  Order
//
//  Created by 凯东源 on 2017/9/20.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>


//{
//    "ADDRESS_INFO": "广东省深圳市福田区福田街道广东省深圳市福田区福田口岸商业广场2楼64号铺",
//    "PARTY_NAME": "ok仔甜品店",
//    "ITEM_CODE": "YBBX0498",
//    "CONTACT_PERSON": "",
//    "CONTACT_TEL": "",
//    "IDX": "68526"
//}

@interface InputToAddressModel : NSObject

@property (nonatomic, strong) NSString * aDDRESSINFO;
@property (nonatomic, strong) NSString * cONTACTPERSON;
@property (nonatomic, strong) NSString * cONTACTTEL;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * iTEMCODE;
@property (nonatomic, strong) NSString * pARTYNAME;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
