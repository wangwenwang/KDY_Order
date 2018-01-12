//
//  TmsOrderInfoItemModel.h
//  Order
//
//  Created by 凯东源 on 2018/1/4.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TmsOrderInfoItemModel : NSObject

@property (nonatomic, strong) NSString * dRIVERPAY;
@property (nonatomic, strong) NSString * oRDISSUEQTY;
@property (nonatomic, strong) NSString * oRDISSUEVOLUME;
@property (nonatomic, strong) NSString * oRDISSUEWEIGHT;
@property (nonatomic, strong) NSString * oRDNO;
@property (nonatomic, strong) NSString * oRDWORKFLOW;
@property (nonatomic, strong) NSString * tMSDATEISSUE;
@property (nonatomic, strong) NSString * tMSDATELOAD;
@property (nonatomic, strong) NSString * tMSSHIPMENTNO;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
