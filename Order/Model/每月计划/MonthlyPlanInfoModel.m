//
//  MonthlyPlanInfoModel.m
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "MonthlyPlanInfoModel.h"


NSString *const kMonthlyPlanInfoModelACTPRICE = @"ACT_PRICE";
NSString *const kMonthlyPlanInfoModelADDDATE = @"ADD_DATE";
NSString *const kMonthlyPlanInfoModelBUSINESSIDX = @"BUSINESS_IDX";
NSString *const kMonthlyPlanInfoModelCONSIGNEEREMARK = @"CONSIGNEE_REMARK";
NSString *const kMonthlyPlanInfoModelIDX = @"IDX";
NSString *const kMonthlyPlanInfoModelMonthlyPlanItemModel = @"OrderDetails";
NSString *const kMonthlyPlanInfoModelORDNO = @"ORD_NO";
NSString *const kMonthlyPlanInfoModelORDQTY = @"ORD_QTY";
NSString *const kMonthlyPlanInfoModelORDSTATE = @"ORD_STATE";
NSString *const kMonthlyPlanInfoModelORDVOLUME = @"ORD_VOLUME";
NSString *const kMonthlyPlanInfoModelORDWEIGHT = @"ORD_WEIGHT";
NSString *const kMonthlyPlanInfoModelORDWORKFLOW = @"ORD_WORKFLOW";
NSString *const kMonthlyPlanInfoModelORGIDX = @"ORG_IDX";
NSString *const kMonthlyPlanInfoModelORGPRICE = @"ORG_PRICE";
NSString *const kMonthlyPlanInfoModelREQUESTDELIVERY = @"REQUEST_DELIVERY";
NSString *const kMonthlyPlanInfoModelREQUESTISSUE = @"REQUEST_ISSUE";
NSString *const kMonthlyPlanInfoModelTOADDRESS = @"TO_ADDRESS";
NSString *const kMonthlyPlanInfoModelTOCNAME = @"TO_CNAME";
NSString *const kMonthlyPlanInfoModelTOCODE = @"TO_CODE";
NSString *const kMonthlyPlanInfoModelTONAME = @"TO_NAME";
NSString *const kMonthlyPlanInfoModelTOPROPERTY = @"TO_PROPERTY";


@implementation MonthlyPlanInfoModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kMonthlyPlanInfoModelACTPRICE] isKindOfClass:[NSNull class]]){
        self.aCTPRICE = dictionary[kMonthlyPlanInfoModelACTPRICE];
    }
    if(![dictionary[kMonthlyPlanInfoModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kMonthlyPlanInfoModelADDDATE];
    }
    if(![dictionary[kMonthlyPlanInfoModelBUSINESSIDX] isKindOfClass:[NSNull class]]){
        self.bUSINESSIDX = dictionary[kMonthlyPlanInfoModelBUSINESSIDX];
    }
    if(![dictionary[kMonthlyPlanInfoModelCONSIGNEEREMARK] isKindOfClass:[NSNull class]]){
        self.cONSIGNEEREMARK = dictionary[kMonthlyPlanInfoModelCONSIGNEEREMARK];
    }
    if(![dictionary[kMonthlyPlanInfoModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kMonthlyPlanInfoModelIDX];
    }
    if(dictionary[kMonthlyPlanInfoModelMonthlyPlanItemModel] != nil && [dictionary[kMonthlyPlanInfoModelMonthlyPlanItemModel] isKindOfClass:[NSArray class]]){
        NSArray * monthlyPlanItemModelDictionaries = dictionary[kMonthlyPlanInfoModelMonthlyPlanItemModel];
        NSMutableArray * monthlyPlanItemModelItems = [NSMutableArray array];
        for(NSDictionary * monthlyPlanItemModelDictionary in monthlyPlanItemModelDictionaries){
            MonthlyPlanItemModel * monthlyPlanItemModelItem = [[MonthlyPlanItemModel alloc] initWithDictionary:monthlyPlanItemModelDictionary];
            [monthlyPlanItemModelItems addObject:monthlyPlanItemModelItem];
        }
        self.monthlyPlanItemModel = monthlyPlanItemModelItems;
    }
    if(![dictionary[kMonthlyPlanInfoModelORDNO] isKindOfClass:[NSNull class]]){
        self.oRDNO = dictionary[kMonthlyPlanInfoModelORDNO];
    }
    if(![dictionary[kMonthlyPlanInfoModelORDQTY] isKindOfClass:[NSNull class]]){
        self.oRDQTY = dictionary[kMonthlyPlanInfoModelORDQTY];
    }
    if(![dictionary[kMonthlyPlanInfoModelORDSTATE] isKindOfClass:[NSNull class]]){
        self.oRDSTATE = dictionary[kMonthlyPlanInfoModelORDSTATE];
    }
    if(![dictionary[kMonthlyPlanInfoModelORDVOLUME] isKindOfClass:[NSNull class]]){
        self.oRDVOLUME = dictionary[kMonthlyPlanInfoModelORDVOLUME];
    }
    if(![dictionary[kMonthlyPlanInfoModelORDWEIGHT] isKindOfClass:[NSNull class]]){
        self.oRDWEIGHT = dictionary[kMonthlyPlanInfoModelORDWEIGHT];
    }
    if(![dictionary[kMonthlyPlanInfoModelORDWORKFLOW] isKindOfClass:[NSNull class]]){
        self.oRDWORKFLOW = dictionary[kMonthlyPlanInfoModelORDWORKFLOW];
    }
    if(![dictionary[kMonthlyPlanInfoModelORGIDX] isKindOfClass:[NSNull class]]){
        self.oRGIDX = dictionary[kMonthlyPlanInfoModelORGIDX];
    }
    if(![dictionary[kMonthlyPlanInfoModelORGPRICE] isKindOfClass:[NSNull class]]){
        self.oRGPRICE = dictionary[kMonthlyPlanInfoModelORGPRICE];
    }
    if(![dictionary[kMonthlyPlanInfoModelREQUESTDELIVERY] isKindOfClass:[NSNull class]]){
        self.rEQUESTDELIVERY = dictionary[kMonthlyPlanInfoModelREQUESTDELIVERY];
    }
    if(![dictionary[kMonthlyPlanInfoModelREQUESTISSUE] isKindOfClass:[NSNull class]]){
        self.rEQUESTISSUE = dictionary[kMonthlyPlanInfoModelREQUESTISSUE];
    }
    if(![dictionary[kMonthlyPlanInfoModelTOADDRESS] isKindOfClass:[NSNull class]]){
        self.tOADDRESS = dictionary[kMonthlyPlanInfoModelTOADDRESS];
    }
    if(![dictionary[kMonthlyPlanInfoModelTOCNAME] isKindOfClass:[NSNull class]]){
        self.tOCNAME = dictionary[kMonthlyPlanInfoModelTOCNAME];
    }
    if(![dictionary[kMonthlyPlanInfoModelTOCODE] isKindOfClass:[NSNull class]]){
        self.tOCODE = dictionary[kMonthlyPlanInfoModelTOCODE];
    }
    if(![dictionary[kMonthlyPlanInfoModelTONAME] isKindOfClass:[NSNull class]]){
        self.tONAME = dictionary[kMonthlyPlanInfoModelTONAME];
    }
    if(![dictionary[kMonthlyPlanInfoModelTOPROPERTY] isKindOfClass:[NSNull class]]){
        self.tOPROPERTY = dictionary[kMonthlyPlanInfoModelTOPROPERTY];
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
        dictionary[kMonthlyPlanInfoModelACTPRICE] = self.aCTPRICE;
    }
    if(self.aDDDATE != nil){
        dictionary[kMonthlyPlanInfoModelADDDATE] = self.aDDDATE;
    }
    if(self.bUSINESSIDX != nil){
        dictionary[kMonthlyPlanInfoModelBUSINESSIDX] = self.bUSINESSIDX;
    }
    if(self.cONSIGNEEREMARK != nil){
        dictionary[kMonthlyPlanInfoModelCONSIGNEEREMARK] = self.cONSIGNEEREMARK;
    }
    if(self.iDX != nil){
        dictionary[kMonthlyPlanInfoModelIDX] = self.iDX;
    }
    if(self.monthlyPlanItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(MonthlyPlanItemModel * monthlyPlanItemModelElement in self.monthlyPlanItemModel){
            [dictionaryElements addObject:[monthlyPlanItemModelElement toDictionary]];
        }
        dictionary[kMonthlyPlanInfoModelMonthlyPlanItemModel] = dictionaryElements;
    }
    if(self.oRDNO != nil){
        dictionary[kMonthlyPlanInfoModelORDNO] = self.oRDNO;
    }
    if(self.oRDQTY != nil){
        dictionary[kMonthlyPlanInfoModelORDQTY] = self.oRDQTY;
    }
    if(self.oRDSTATE != nil){
        dictionary[kMonthlyPlanInfoModelORDSTATE] = self.oRDSTATE;
    }
    if(self.oRDVOLUME != nil){
        dictionary[kMonthlyPlanInfoModelORDVOLUME] = self.oRDVOLUME;
    }
    if(self.oRDWEIGHT != nil){
        dictionary[kMonthlyPlanInfoModelORDWEIGHT] = self.oRDWEIGHT;
    }
    if(self.oRDWORKFLOW != nil){
        dictionary[kMonthlyPlanInfoModelORDWORKFLOW] = self.oRDWORKFLOW;
    }
    if(self.oRGIDX != nil){
        dictionary[kMonthlyPlanInfoModelORGIDX] = self.oRGIDX;
    }
    if(self.oRGPRICE != nil){
        dictionary[kMonthlyPlanInfoModelORGPRICE] = self.oRGPRICE;
    }
    if(self.rEQUESTDELIVERY != nil){
        dictionary[kMonthlyPlanInfoModelREQUESTDELIVERY] = self.rEQUESTDELIVERY;
    }
    if(self.rEQUESTISSUE != nil){
        dictionary[kMonthlyPlanInfoModelREQUESTISSUE] = self.rEQUESTISSUE;
    }
    if(self.tOADDRESS != nil){
        dictionary[kMonthlyPlanInfoModelTOADDRESS] = self.tOADDRESS;
    }
    if(self.tOCNAME != nil){
        dictionary[kMonthlyPlanInfoModelTOCNAME] = self.tOCNAME;
    }
    if(self.tOCODE != nil){
        dictionary[kMonthlyPlanInfoModelTOCODE] = self.tOCODE;
    }
    if(self.tONAME != nil){
        dictionary[kMonthlyPlanInfoModelTONAME] = self.tONAME;
    }
    if(self.tOPROPERTY != nil){
        dictionary[kMonthlyPlanInfoModelTOPROPERTY] = self.tOPROPERTY;
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
        [aCoder encodeObject:self.aCTPRICE forKey:kMonthlyPlanInfoModelACTPRICE];
    }
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kMonthlyPlanInfoModelADDDATE];
    }
    if(self.bUSINESSIDX != nil){
        [aCoder encodeObject:self.bUSINESSIDX forKey:kMonthlyPlanInfoModelBUSINESSIDX];
    }
    if(self.cONSIGNEEREMARK != nil){
        [aCoder encodeObject:self.cONSIGNEEREMARK forKey:kMonthlyPlanInfoModelCONSIGNEEREMARK];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kMonthlyPlanInfoModelIDX];
    }
    if(self.monthlyPlanItemModel != nil){
        [aCoder encodeObject:self.monthlyPlanItemModel forKey:kMonthlyPlanInfoModelMonthlyPlanItemModel];
    }
    if(self.oRDNO != nil){
        [aCoder encodeObject:self.oRDNO forKey:kMonthlyPlanInfoModelORDNO];
    }
    if(self.oRDQTY != nil){
        [aCoder encodeObject:self.oRDQTY forKey:kMonthlyPlanInfoModelORDQTY];
    }
    if(self.oRDSTATE != nil){
        [aCoder encodeObject:self.oRDSTATE forKey:kMonthlyPlanInfoModelORDSTATE];
    }
    if(self.oRDVOLUME != nil){
        [aCoder encodeObject:self.oRDVOLUME forKey:kMonthlyPlanInfoModelORDVOLUME];
    }
    if(self.oRDWEIGHT != nil){
        [aCoder encodeObject:self.oRDWEIGHT forKey:kMonthlyPlanInfoModelORDWEIGHT];
    }
    if(self.oRDWORKFLOW != nil){
        [aCoder encodeObject:self.oRDWORKFLOW forKey:kMonthlyPlanInfoModelORDWORKFLOW];
    }
    if(self.oRGIDX != nil){
        [aCoder encodeObject:self.oRGIDX forKey:kMonthlyPlanInfoModelORGIDX];
    }
    if(self.oRGPRICE != nil){
        [aCoder encodeObject:self.oRGPRICE forKey:kMonthlyPlanInfoModelORGPRICE];
    }
    if(self.rEQUESTDELIVERY != nil){
        [aCoder encodeObject:self.rEQUESTDELIVERY forKey:kMonthlyPlanInfoModelREQUESTDELIVERY];
    }
    if(self.rEQUESTISSUE != nil){
        [aCoder encodeObject:self.rEQUESTISSUE forKey:kMonthlyPlanInfoModelREQUESTISSUE];
    }
    if(self.tOADDRESS != nil){
        [aCoder encodeObject:self.tOADDRESS forKey:kMonthlyPlanInfoModelTOADDRESS];
    }
    if(self.tOCNAME != nil){
        [aCoder encodeObject:self.tOCNAME forKey:kMonthlyPlanInfoModelTOCNAME];
    }
    if(self.tOCODE != nil){
        [aCoder encodeObject:self.tOCODE forKey:kMonthlyPlanInfoModelTOCODE];
    }
    if(self.tONAME != nil){
        [aCoder encodeObject:self.tONAME forKey:kMonthlyPlanInfoModelTONAME];
    }
    if(self.tOPROPERTY != nil){
        [aCoder encodeObject:self.tOPROPERTY forKey:kMonthlyPlanInfoModelTOPROPERTY];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aCTPRICE = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelACTPRICE];
    self.aDDDATE = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelADDDATE];
    self.bUSINESSIDX = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelBUSINESSIDX];
    self.cONSIGNEEREMARK = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelCONSIGNEEREMARK];
    self.iDX = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelIDX];
    self.monthlyPlanItemModel = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelMonthlyPlanItemModel];
    self.oRDNO = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelORDNO];
    self.oRDQTY = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelORDQTY];
    self.oRDSTATE = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelORDSTATE];
    self.oRDVOLUME = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelORDVOLUME];
    self.oRDWEIGHT = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelORDWEIGHT];
    self.oRDWORKFLOW = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelORDWORKFLOW];
    self.oRGIDX = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelORGIDX];
    self.oRGPRICE = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelORGPRICE];
    self.rEQUESTDELIVERY = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelREQUESTDELIVERY];
    self.rEQUESTISSUE = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelREQUESTISSUE];
    self.tOADDRESS = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelTOADDRESS];
    self.tOCNAME = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelTOCNAME];
    self.tOCODE = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelTOCODE];
    self.tONAME = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelTONAME];
    self.tOPROPERTY = [aDecoder decodeObjectForKey:kMonthlyPlanInfoModelTOPROPERTY];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    MonthlyPlanInfoModel *copy = [MonthlyPlanInfoModel new];
    
    copy.aCTPRICE = [self.aCTPRICE copy];
    copy.aDDDATE = [self.aDDDATE copy];
    copy.bUSINESSIDX = [self.bUSINESSIDX copy];
    copy.cONSIGNEEREMARK = [self.cONSIGNEEREMARK copy];
    copy.iDX = [self.iDX copy];
    copy.monthlyPlanItemModel = [self.monthlyPlanItemModel copy];
    copy.oRDNO = [self.oRDNO copy];
    copy.oRDQTY = [self.oRDQTY copy];
    copy.oRDSTATE = [self.oRDSTATE copy];
    copy.oRDVOLUME = [self.oRDVOLUME copy];
    copy.oRDWEIGHT = [self.oRDWEIGHT copy];
    copy.oRDWORKFLOW = [self.oRDWORKFLOW copy];
    copy.oRGIDX = [self.oRGIDX copy];
    copy.oRGPRICE = [self.oRGPRICE copy];
    copy.rEQUESTDELIVERY = [self.rEQUESTDELIVERY copy];
    copy.rEQUESTISSUE = [self.rEQUESTISSUE copy];
    copy.tOADDRESS = [self.tOADDRESS copy];
    copy.tOCNAME = [self.tOCNAME copy];
    copy.tOCODE = [self.tOCODE copy];
    copy.tONAME = [self.tONAME copy];
    copy.tOPROPERTY = [self.tOPROPERTY copy];
    
    return copy;
}

@end
