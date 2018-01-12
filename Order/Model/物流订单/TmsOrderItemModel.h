//
//  TmsOrderItemModel.h
//  Order
//
//  Created by 凯东源 on 2018/1/3.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TmsOrderItemModel : NSObject

@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * oRDDATEADD;
@property (nonatomic, strong) NSString * oRDNo;
@property (nonatomic, strong) NSString * oRDQTY;
@property (nonatomic, strong) NSString * oRDTOADDRESS;
@property (nonatomic, strong) NSString * oRDTONAME;
@property (nonatomic, strong) NSString * oRDVOLUME;
@property (nonatomic, strong) NSString * oRDWEIGHT;
@property (nonatomic, strong) NSString * tMSQTY;
@property (nonatomic, strong) NSString * tMSVOLUME;
@property (nonatomic, strong) NSString * tMSWEIGHT;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
