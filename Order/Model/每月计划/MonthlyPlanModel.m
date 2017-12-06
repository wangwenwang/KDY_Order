//
//  MonthlyPlanModel.m
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "MonthlyPlanModel.h"


NSString *const kMonthlyPlanModelACTPRICE = @"ACT_PRICE";
NSString *const kMonthlyPlanModelADDDATE = @"ADD_DATE";
NSString *const kMonthlyPlanModelCONSIGNEEREMARK = @"CONSIGNEE_REMARK";
NSString *const kMonthlyPlanModelIDX = @"IDX";
NSString *const kMonthlyPlanModelORDNO = @"ORD_NO";
NSString *const kMonthlyPlanModelORDQTY = @"ORD_QTY";
NSString *const kMonthlyPlanModelORDSTATE = @"ORD_STATE";
NSString *const kMonthlyPlanModelORDVOLUME = @"ORD_VOLUME";
NSString *const kMonthlyPlanModelORDWEIGHT = @"ORD_WEIGHT";
NSString *const kMonthlyPlanModelORDWORKFLOW = @"ORD_WORKFLOW";
NSString *const kMonthlyPlanModelORGPRICE = @"ORG_PRICE";
NSString *const kMonthlyPlanModelREQUESTDELIVERY = @"REQUEST_DELIVERY";
NSString *const kMonthlyPlanModelREQUESTISSUE = @"REQUEST_ISSUE";
NSString *const kMonthlyPlanModelTOADDRESS = @"TO_ADDRESS";
NSString *const kMonthlyPlanModelTOCNAME = @"TO_CNAME";
NSString *const kMonthlyPlanModelTOCODE = @"TO_CODE";
NSString *const kMonthlyPlanModelTONAME = @"TO_NAME";


@implementation MonthlyPlanModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kMonthlyPlanModelACTPRICE] isKindOfClass:[NSNull class]]){
        self.aCTPRICE = dictionary[kMonthlyPlanModelACTPRICE];
    }
    if(![dictionary[kMonthlyPlanModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kMonthlyPlanModelADDDATE];
    }
    if(![dictionary[kMonthlyPlanModelCONSIGNEEREMARK] isKindOfClass:[NSNull class]]){
        self.cONSIGNEEREMARK = dictionary[kMonthlyPlanModelCONSIGNEEREMARK];
    }
    if(![dictionary[kMonthlyPlanModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kMonthlyPlanModelIDX];
    }
    if(![dictionary[kMonthlyPlanModelORDNO] isKindOfClass:[NSNull class]]){
        self.oRDNO = dictionary[kMonthlyPlanModelORDNO];
    }
    if(![dictionary[kMonthlyPlanModelORDQTY] isKindOfClass:[NSNull class]]){
        self.oRDQTY = dictionary[kMonthlyPlanModelORDQTY];
    }
    if(![dictionary[kMonthlyPlanModelORDSTATE] isKindOfClass:[NSNull class]]){
        self.oRDSTATE = dictionary[kMonthlyPlanModelORDSTATE];
    }
    if(![dictionary[kMonthlyPlanModelORDVOLUME] isKindOfClass:[NSNull class]]){
        self.oRDVOLUME = dictionary[kMonthlyPlanModelORDVOLUME];
    }
    if(![dictionary[kMonthlyPlanModelORDWEIGHT] isKindOfClass:[NSNull class]]){
        self.oRDWEIGHT = dictionary[kMonthlyPlanModelORDWEIGHT];
    }
    if(![dictionary[kMonthlyPlanModelORDWORKFLOW] isKindOfClass:[NSNull class]]){
        self.oRDWORKFLOW = dictionary[kMonthlyPlanModelORDWORKFLOW];
    }
    if(![dictionary[kMonthlyPlanModelORGPRICE] isKindOfClass:[NSNull class]]){
        self.oRGPRICE = dictionary[kMonthlyPlanModelORGPRICE];
    }
    if(![dictionary[kMonthlyPlanModelREQUESTDELIVERY] isKindOfClass:[NSNull class]]){
        self.rEQUESTDELIVERY = dictionary[kMonthlyPlanModelREQUESTDELIVERY];
    }
    if(![dictionary[kMonthlyPlanModelREQUESTISSUE] isKindOfClass:[NSNull class]]){
        self.rEQUESTISSUE = dictionary[kMonthlyPlanModelREQUESTISSUE];
    }
    if(![dictionary[kMonthlyPlanModelTOADDRESS] isKindOfClass:[NSNull class]]){
        self.tOADDRESS = dictionary[kMonthlyPlanModelTOADDRESS];
    }
    if(![dictionary[kMonthlyPlanModelTOCNAME] isKindOfClass:[NSNull class]]){
        self.tOCNAME = dictionary[kMonthlyPlanModelTOCNAME];
    }
    if(![dictionary[kMonthlyPlanModelTOCODE] isKindOfClass:[NSNull class]]){
        self.tOCODE = dictionary[kMonthlyPlanModelTOCODE];
    }
    if(![dictionary[kMonthlyPlanModelTONAME] isKindOfClass:[NSNull class]]){
        self.tONAME = dictionary[kMonthlyPlanModelTONAME];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aCTPRICE != nil){
        dictionary[kMonthlyPlanModelACTPRICE] = self.aCTPRICE;
    }
    if(self.aDDDATE != nil){
        dictionary[kMonthlyPlanModelADDDATE] = self.aDDDATE;
    }
    if(self.cONSIGNEEREMARK != nil){
        dictionary[kMonthlyPlanModelCONSIGNEEREMARK] = self.cONSIGNEEREMARK;
    }
    if(self.iDX != nil){
        dictionary[kMonthlyPlanModelIDX] = self.iDX;
    }
    if(self.oRDNO != nil){
        dictionary[kMonthlyPlanModelORDNO] = self.oRDNO;
    }
    if(self.oRDQTY != nil){
        dictionary[kMonthlyPlanModelORDQTY] = self.oRDQTY;
    }
    if(self.oRDSTATE != nil){
        dictionary[kMonthlyPlanModelORDSTATE] = self.oRDSTATE;
    }
    if(self.oRDVOLUME != nil){
        dictionary[kMonthlyPlanModelORDVOLUME] = self.oRDVOLUME;
    }
    if(self.oRDWEIGHT != nil){
        dictionary[kMonthlyPlanModelORDWEIGHT] = self.oRDWEIGHT;
    }
    if(self.oRDWORKFLOW != nil){
        dictionary[kMonthlyPlanModelORDWORKFLOW] = self.oRDWORKFLOW;
    }
    if(self.oRGPRICE != nil){
        dictionary[kMonthlyPlanModelORGPRICE] = self.oRGPRICE;
    }
    if(self.rEQUESTDELIVERY != nil){
        dictionary[kMonthlyPlanModelREQUESTDELIVERY] = self.rEQUESTDELIVERY;
    }
    if(self.rEQUESTISSUE != nil){
        dictionary[kMonthlyPlanModelREQUESTISSUE] = self.rEQUESTISSUE;
    }
    if(self.tOADDRESS != nil){
        dictionary[kMonthlyPlanModelTOADDRESS] = self.tOADDRESS;
    }
    if(self.tOCNAME != nil){
        dictionary[kMonthlyPlanModelTOCNAME] = self.tOCNAME;
    }
    if(self.tOCODE != nil){
        dictionary[kMonthlyPlanModelTOCODE] = self.tOCODE;
    }
    if(self.tONAME != nil){
        dictionary[kMonthlyPlanModelTONAME] = self.tONAME;
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if(self.aCTPRICE != nil){
        [aCoder encodeObject:self.aCTPRICE forKey:kMonthlyPlanModelACTPRICE];
    }
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kMonthlyPlanModelADDDATE];
    }
    if(self.cONSIGNEEREMARK != nil){
        [aCoder encodeObject:self.cONSIGNEEREMARK forKey:kMonthlyPlanModelCONSIGNEEREMARK];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kMonthlyPlanModelIDX];
    }
    if(self.oRDNO != nil){
        [aCoder encodeObject:self.oRDNO forKey:kMonthlyPlanModelORDNO];
    }
    if(self.oRDQTY != nil){
        [aCoder encodeObject:self.oRDQTY forKey:kMonthlyPlanModelORDQTY];
    }
    if(self.oRDSTATE != nil){
        [aCoder encodeObject:self.oRDSTATE forKey:kMonthlyPlanModelORDSTATE];
    }
    if(self.oRDVOLUME != nil){
        [aCoder encodeObject:self.oRDVOLUME forKey:kMonthlyPlanModelORDVOLUME];
    }
    if(self.oRDWEIGHT != nil){
        [aCoder encodeObject:self.oRDWEIGHT forKey:kMonthlyPlanModelORDWEIGHT];
    }
    if(self.oRDWORKFLOW != nil){
        [aCoder encodeObject:self.oRDWORKFLOW forKey:kMonthlyPlanModelORDWORKFLOW];
    }
    if(self.oRGPRICE != nil){
        [aCoder encodeObject:self.oRGPRICE forKey:kMonthlyPlanModelORGPRICE];
    }
    if(self.rEQUESTDELIVERY != nil){
        [aCoder encodeObject:self.rEQUESTDELIVERY forKey:kMonthlyPlanModelREQUESTDELIVERY];
    }
    if(self.rEQUESTISSUE != nil){
        [aCoder encodeObject:self.rEQUESTISSUE forKey:kMonthlyPlanModelREQUESTISSUE];
    }
    if(self.tOADDRESS != nil){
        [aCoder encodeObject:self.tOADDRESS forKey:kMonthlyPlanModelTOADDRESS];
    }
    if(self.tOCNAME != nil){
        [aCoder encodeObject:self.tOCNAME forKey:kMonthlyPlanModelTOCNAME];
    }
    if(self.tOCODE != nil){
        [aCoder encodeObject:self.tOCODE forKey:kMonthlyPlanModelTOCODE];
    }
    if(self.tONAME != nil){
        [aCoder encodeObject:self.tONAME forKey:kMonthlyPlanModelTONAME];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aCTPRICE = [aDecoder decodeObjectForKey:kMonthlyPlanModelACTPRICE];
    self.aDDDATE = [aDecoder decodeObjectForKey:kMonthlyPlanModelADDDATE];
    self.cONSIGNEEREMARK = [aDecoder decodeObjectForKey:kMonthlyPlanModelCONSIGNEEREMARK];
    self.iDX = [aDecoder decodeObjectForKey:kMonthlyPlanModelIDX];
    self.oRDNO = [aDecoder decodeObjectForKey:kMonthlyPlanModelORDNO];
    self.oRDQTY = [aDecoder decodeObjectForKey:kMonthlyPlanModelORDQTY];
    self.oRDSTATE = [aDecoder decodeObjectForKey:kMonthlyPlanModelORDSTATE];
    self.oRDVOLUME = [aDecoder decodeObjectForKey:kMonthlyPlanModelORDVOLUME];
    self.oRDWEIGHT = [aDecoder decodeObjectForKey:kMonthlyPlanModelORDWEIGHT];
    self.oRDWORKFLOW = [aDecoder decodeObjectForKey:kMonthlyPlanModelORDWORKFLOW];
    self.oRGPRICE = [aDecoder decodeObjectForKey:kMonthlyPlanModelORGPRICE];
    self.rEQUESTDELIVERY = [aDecoder decodeObjectForKey:kMonthlyPlanModelREQUESTDELIVERY];
    self.rEQUESTISSUE = [aDecoder decodeObjectForKey:kMonthlyPlanModelREQUESTISSUE];
    self.tOADDRESS = [aDecoder decodeObjectForKey:kMonthlyPlanModelTOADDRESS];
    self.tOCNAME = [aDecoder decodeObjectForKey:kMonthlyPlanModelTOCNAME];
    self.tOCODE = [aDecoder decodeObjectForKey:kMonthlyPlanModelTOCODE];
    self.tONAME = [aDecoder decodeObjectForKey:kMonthlyPlanModelTONAME];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    MonthlyPlanModel *copy = [MonthlyPlanModel new];
    
    copy.aCTPRICE = [self.aCTPRICE copy];
    copy.aDDDATE = [self.aDDDATE copy];
    copy.cONSIGNEEREMARK = [self.cONSIGNEEREMARK copy];
    copy.iDX = [self.iDX copy];
    copy.oRDNO = [self.oRDNO copy];
    copy.oRDQTY = [self.oRDQTY copy];
    copy.oRDSTATE = [self.oRDSTATE copy];
    copy.oRDVOLUME = [self.oRDVOLUME copy];
    copy.oRDWEIGHT = [self.oRDWEIGHT copy];
    copy.oRDWORKFLOW = [self.oRDWORKFLOW copy];
    copy.oRGPRICE = [self.oRGPRICE copy];
    copy.rEQUESTDELIVERY = [self.rEQUESTDELIVERY copy];
    copy.rEQUESTISSUE = [self.rEQUESTISSUE copy];
    copy.tOADDRESS = [self.tOADDRESS copy];
    copy.tOCNAME = [self.tOCNAME copy];
    copy.tOCODE = [self.tOCODE copy];
    copy.tONAME = [self.tONAME copy];
    
    return copy;
}

@end
