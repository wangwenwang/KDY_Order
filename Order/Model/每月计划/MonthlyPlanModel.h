//
//  MonthlyPlanModel.h
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonthlyPlanModel : NSObject

@property (nonatomic, strong) NSString * aCTPRICE;
@property (nonatomic, strong) NSString * aDDDATE;
@property (nonatomic, strong) NSString * cONSIGNEEREMARK;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * oRDNO;
@property (nonatomic, strong) NSString * oRDQTY;
@property (nonatomic, strong) NSString * oRDSTATE;
@property (nonatomic, strong) NSString * oRDVOLUME;
@property (nonatomic, strong) NSString * oRDWEIGHT;
@property (nonatomic, strong) NSString * oRDWORKFLOW;
@property (nonatomic, strong) NSString * oRGPRICE;
@property (nonatomic, strong) NSString * rEQUESTDELIVERY;
@property (nonatomic, strong) NSString * rEQUESTISSUE;
@property (nonatomic, strong) NSString * tOADDRESS;
@property (nonatomic, strong) NSString * tOCNAME;
@property (nonatomic, strong) NSString * tOCODE;
@property (nonatomic, strong) NSString * tONAME;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@property (assign, nonatomic) CGFloat cellHeight;

@end
