//
//  InputToAddressModel.h
//  Order
//
//  Created by 凯东源 on 2017/9/20.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputToAddressModel : NSObject

@property (nonatomic, strong) NSString * aDDRESSINFO;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * iTEMCODE;
@property (nonatomic, strong) NSString * pARTYNAME;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
