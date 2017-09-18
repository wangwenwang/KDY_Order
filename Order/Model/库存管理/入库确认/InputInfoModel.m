//
//  InputInfoModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "InputInfoModel.h"


NSString *const kInputInfoModelADDRESSCODE = @"ADDRESS_CODE";
NSString *const kInputInfoModelADDRESSIDX = @"ADDRESS_IDX";
NSString *const kInputInfoModelADDRESSINFO = @"ADDRESS_INFO";
NSString *const kInputInfoModelADDRESSNAME = @"ADDRESS_NAME";
NSString *const kInputInfoModelADDDATE = @"ADD_DATE";
NSString *const kInputInfoModelADDUSER = @"ADD_USER";
NSString *const kInputInfoModelADUTDATE = @"ADUT_DATE";
NSString *const kInputInfoModelADUTMARK = @"ADUT_MARK";
NSString *const kInputInfoModelADUTUSER = @"ADUT_USER";
NSString *const kInputInfoModelBUSINESSIDX = @"BUSINESS_IDX";
NSString *const kInputInfoModelEDITDATE = @"EDIT_DATE";
NSString *const kInputInfoModelIDX = @"IDX";
NSString *const kInputInfoModelINPUTDATE = @"INPUT_DATE";
NSString *const kInputInfoModelINPUTNO = @"INPUT_NO";
NSString *const kInputInfoModelINPUTQTY = @"INPUT_QTY";
NSString *const kInputInfoModelINPUTSTATE = @"INPUT_STATE";
NSString *const kInputInfoModelINPUTSUM = @"INPUT_SUM";
NSString *const kInputInfoModelINPUTTYPE = @"INPUT_TYPE";
NSString *const kInputInfoModelINPUTVOLUME = @"INPUT_VOLUME";
NSString *const kInputInfoModelINPUTWEIGHT = @"INPUT_WEIGHT";
NSString *const kInputInfoModelINPUTWORKFLOW = @"INPUT_WORKFLOW";
NSString *const kInputInfoModelOPERUSER = @"OPER_USER";
NSString *const kInputInfoModelOUTPUTNO = @"OUTPUT_NO";
NSString *const kInputInfoModelPARTYMARK = @"PARTY_MARK";
NSString *const kInputInfoModelSUPPLIERADDRESS = @"SUPPLIER_ADDRESS";
NSString *const kInputInfoModelSUPPLIERCODE = @"SUPPLIER_CODE";
NSString *const kInputInfoModelSUPPLIERNAME = @"SUPPLIER_NAME";


@implementation InputInfoModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kInputInfoModelADDRESSCODE] isKindOfClass:[NSNull class]]){
        self.aDDRESSCODE = dictionary[kInputInfoModelADDRESSCODE];
    }
    if(![dictionary[kInputInfoModelADDRESSIDX] isKindOfClass:[NSNull class]]){
        self.aDDRESSIDX = dictionary[kInputInfoModelADDRESSIDX];
    }
    if(![dictionary[kInputInfoModelADDRESSINFO] isKindOfClass:[NSNull class]]){
        self.aDDRESSINFO = dictionary[kInputInfoModelADDRESSINFO];
    }
    if(![dictionary[kInputInfoModelADDRESSNAME] isKindOfClass:[NSNull class]]){
        self.aDDRESSNAME = dictionary[kInputInfoModelADDRESSNAME];
    }
    if(![dictionary[kInputInfoModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kInputInfoModelADDDATE];
    }
    if(![dictionary[kInputInfoModelADDUSER] isKindOfClass:[NSNull class]]){
        self.aDDUSER = dictionary[kInputInfoModelADDUSER];
    }
    if(![dictionary[kInputInfoModelADUTDATE] isKindOfClass:[NSNull class]]){
        self.aDUTDATE = dictionary[kInputInfoModelADUTDATE];
    }
    if(![dictionary[kInputInfoModelADUTMARK] isKindOfClass:[NSNull class]]){
        self.aDUTMARK = dictionary[kInputInfoModelADUTMARK];
    }
    if(![dictionary[kInputInfoModelADUTUSER] isKindOfClass:[NSNull class]]){
        self.aDUTUSER = dictionary[kInputInfoModelADUTUSER];
    }
    if(![dictionary[kInputInfoModelBUSINESSIDX] isKindOfClass:[NSNull class]]){
        self.bUSINESSIDX = dictionary[kInputInfoModelBUSINESSIDX];
    }
    if(![dictionary[kInputInfoModelEDITDATE] isKindOfClass:[NSNull class]]){
        self.eDITDATE = dictionary[kInputInfoModelEDITDATE];
    }
    if(![dictionary[kInputInfoModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kInputInfoModelIDX];
    }
    if(![dictionary[kInputInfoModelINPUTDATE] isKindOfClass:[NSNull class]]){
        self.iNPUTDATE = dictionary[kInputInfoModelINPUTDATE];
    }
    if(![dictionary[kInputInfoModelINPUTNO] isKindOfClass:[NSNull class]]){
        self.iNPUTNO = dictionary[kInputInfoModelINPUTNO];
    }
    if(![dictionary[kInputInfoModelINPUTQTY] isKindOfClass:[NSNull class]]){
        self.iNPUTQTY = dictionary[kInputInfoModelINPUTQTY];
    }
    if(![dictionary[kInputInfoModelINPUTSTATE] isKindOfClass:[NSNull class]]){
        self.iNPUTSTATE = dictionary[kInputInfoModelINPUTSTATE];
    }
    if(![dictionary[kInputInfoModelINPUTSUM] isKindOfClass:[NSNull class]]){
        self.iNPUTSUM = dictionary[kInputInfoModelINPUTSUM];
    }
    if(![dictionary[kInputInfoModelINPUTTYPE] isKindOfClass:[NSNull class]]){
        self.iNPUTTYPE = dictionary[kInputInfoModelINPUTTYPE];
    }
    if(![dictionary[kInputInfoModelINPUTVOLUME] isKindOfClass:[NSNull class]]){
        self.iNPUTVOLUME = dictionary[kInputInfoModelINPUTVOLUME];
    }
    if(![dictionary[kInputInfoModelINPUTWEIGHT] isKindOfClass:[NSNull class]]){
        self.iNPUTWEIGHT = dictionary[kInputInfoModelINPUTWEIGHT];
    }
    if(![dictionary[kInputInfoModelINPUTWORKFLOW] isKindOfClass:[NSNull class]]){
        self.iNPUTWORKFLOW = dictionary[kInputInfoModelINPUTWORKFLOW];
    }
    if(![dictionary[kInputInfoModelOPERUSER] isKindOfClass:[NSNull class]]){
        self.oPERUSER = dictionary[kInputInfoModelOPERUSER];
    }
    if(![dictionary[kInputInfoModelOUTPUTNO] isKindOfClass:[NSNull class]]){
        self.oUTPUTNO = dictionary[kInputInfoModelOUTPUTNO];
    }
    if(![dictionary[kInputInfoModelPARTYMARK] isKindOfClass:[NSNull class]]){
        self.pARTYMARK = dictionary[kInputInfoModelPARTYMARK];
    }
    if(![dictionary[kInputInfoModelSUPPLIERADDRESS] isKindOfClass:[NSNull class]]){
        self.sUPPLIERADDRESS = dictionary[kInputInfoModelSUPPLIERADDRESS];
    }
    if(![dictionary[kInputInfoModelSUPPLIERCODE] isKindOfClass:[NSNull class]]){
        self.sUPPLIERCODE = dictionary[kInputInfoModelSUPPLIERCODE];
    }
    if(![dictionary[kInputInfoModelSUPPLIERNAME] isKindOfClass:[NSNull class]]){
        self.sUPPLIERNAME = dictionary[kInputInfoModelSUPPLIERNAME];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aDDRESSCODE != nil){
        dictionary[kInputInfoModelADDRESSCODE] = self.aDDRESSCODE;
    }
    if(self.aDDRESSIDX != nil){
        dictionary[kInputInfoModelADDRESSIDX] = self.aDDRESSIDX;
    }
    if(self.aDDRESSINFO != nil){
        dictionary[kInputInfoModelADDRESSINFO] = self.aDDRESSINFO;
    }
    if(self.aDDRESSNAME != nil){
        dictionary[kInputInfoModelADDRESSNAME] = self.aDDRESSNAME;
    }
    if(self.aDDDATE != nil){
        dictionary[kInputInfoModelADDDATE] = self.aDDDATE;
    }
    if(self.aDDUSER != nil){
        dictionary[kInputInfoModelADDUSER] = self.aDDUSER;
    }
    if(self.aDUTDATE != nil){
        dictionary[kInputInfoModelADUTDATE] = self.aDUTDATE;
    }
    if(self.aDUTMARK != nil){
        dictionary[kInputInfoModelADUTMARK] = self.aDUTMARK;
    }
    if(self.aDUTUSER != nil){
        dictionary[kInputInfoModelADUTUSER] = self.aDUTUSER;
    }
    if(self.bUSINESSIDX != nil){
        dictionary[kInputInfoModelBUSINESSIDX] = self.bUSINESSIDX;
    }
    if(self.eDITDATE != nil){
        dictionary[kInputInfoModelEDITDATE] = self.eDITDATE;
    }
    if(self.iDX != nil){
        dictionary[kInputInfoModelIDX] = self.iDX;
    }
    if(self.iNPUTDATE != nil){
        dictionary[kInputInfoModelINPUTDATE] = self.iNPUTDATE;
    }
    if(self.iNPUTNO != nil){
        dictionary[kInputInfoModelINPUTNO] = self.iNPUTNO;
    }
    if(self.iNPUTQTY != nil){
        dictionary[kInputInfoModelINPUTQTY] = self.iNPUTQTY;
    }
    if(self.iNPUTSTATE != nil){
        dictionary[kInputInfoModelINPUTSTATE] = self.iNPUTSTATE;
    }
    if(self.iNPUTSUM != nil){
        dictionary[kInputInfoModelINPUTSUM] = self.iNPUTSUM;
    }
    if(self.iNPUTTYPE != nil){
        dictionary[kInputInfoModelINPUTTYPE] = self.iNPUTTYPE;
    }
    if(self.iNPUTVOLUME != nil){
        dictionary[kInputInfoModelINPUTVOLUME] = self.iNPUTVOLUME;
    }
    if(self.iNPUTWEIGHT != nil){
        dictionary[kInputInfoModelINPUTWEIGHT] = self.iNPUTWEIGHT;
    }
    if(self.iNPUTWORKFLOW != nil){
        dictionary[kInputInfoModelINPUTWORKFLOW] = self.iNPUTWORKFLOW;
    }
    if(self.oPERUSER != nil){
        dictionary[kInputInfoModelOPERUSER] = self.oPERUSER;
    }
    if(self.oUTPUTNO != nil){
        dictionary[kInputInfoModelOUTPUTNO] = self.oUTPUTNO;
    }
    if(self.pARTYMARK != nil){
        dictionary[kInputInfoModelPARTYMARK] = self.pARTYMARK;
    }
    if(self.sUPPLIERADDRESS != nil){
        dictionary[kInputInfoModelSUPPLIERADDRESS] = self.sUPPLIERADDRESS;
    }
    if(self.sUPPLIERCODE != nil){
        dictionary[kInputInfoModelSUPPLIERCODE] = self.sUPPLIERCODE;
    }
    if(self.sUPPLIERNAME != nil){
        dictionary[kInputInfoModelSUPPLIERNAME] = self.sUPPLIERNAME;
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
    if(self.aDDRESSCODE != nil){
        [aCoder encodeObject:self.aDDRESSCODE forKey:kInputInfoModelADDRESSCODE];
    }
    if(self.aDDRESSIDX != nil){
        [aCoder encodeObject:self.aDDRESSIDX forKey:kInputInfoModelADDRESSIDX];
    }
    if(self.aDDRESSINFO != nil){
        [aCoder encodeObject:self.aDDRESSINFO forKey:kInputInfoModelADDRESSINFO];
    }
    if(self.aDDRESSNAME != nil){
        [aCoder encodeObject:self.aDDRESSNAME forKey:kInputInfoModelADDRESSNAME];
    }
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kInputInfoModelADDDATE];
    }
    if(self.aDDUSER != nil){
        [aCoder encodeObject:self.aDDUSER forKey:kInputInfoModelADDUSER];
    }
    if(self.aDUTDATE != nil){
        [aCoder encodeObject:self.aDUTDATE forKey:kInputInfoModelADUTDATE];
    }
    if(self.aDUTMARK != nil){
        [aCoder encodeObject:self.aDUTMARK forKey:kInputInfoModelADUTMARK];
    }
    if(self.aDUTUSER != nil){
        [aCoder encodeObject:self.aDUTUSER forKey:kInputInfoModelADUTUSER];
    }
    if(self.bUSINESSIDX != nil){
        [aCoder encodeObject:self.bUSINESSIDX forKey:kInputInfoModelBUSINESSIDX];
    }
    if(self.eDITDATE != nil){
        [aCoder encodeObject:self.eDITDATE forKey:kInputInfoModelEDITDATE];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kInputInfoModelIDX];
    }
    if(self.iNPUTDATE != nil){
        [aCoder encodeObject:self.iNPUTDATE forKey:kInputInfoModelINPUTDATE];
    }
    if(self.iNPUTNO != nil){
        [aCoder encodeObject:self.iNPUTNO forKey:kInputInfoModelINPUTNO];
    }
    if(self.iNPUTQTY != nil){
        [aCoder encodeObject:self.iNPUTQTY forKey:kInputInfoModelINPUTQTY];
    }
    if(self.iNPUTSTATE != nil){
        [aCoder encodeObject:self.iNPUTSTATE forKey:kInputInfoModelINPUTSTATE];
    }
    if(self.iNPUTSUM != nil){
        [aCoder encodeObject:self.iNPUTSUM forKey:kInputInfoModelINPUTSUM];
    }
    if(self.iNPUTTYPE != nil){
        [aCoder encodeObject:self.iNPUTTYPE forKey:kInputInfoModelINPUTTYPE];
    }
    if(self.iNPUTVOLUME != nil){
        [aCoder encodeObject:self.iNPUTVOLUME forKey:kInputInfoModelINPUTVOLUME];
    }
    if(self.iNPUTWEIGHT != nil){
        [aCoder encodeObject:self.iNPUTWEIGHT forKey:kInputInfoModelINPUTWEIGHT];
    }
    if(self.iNPUTWORKFLOW != nil){
        [aCoder encodeObject:self.iNPUTWORKFLOW forKey:kInputInfoModelINPUTWORKFLOW];
    }
    if(self.oPERUSER != nil){
        [aCoder encodeObject:self.oPERUSER forKey:kInputInfoModelOPERUSER];
    }
    if(self.oUTPUTNO != nil){
        [aCoder encodeObject:self.oUTPUTNO forKey:kInputInfoModelOUTPUTNO];
    }
    if(self.pARTYMARK != nil){
        [aCoder encodeObject:self.pARTYMARK forKey:kInputInfoModelPARTYMARK];
    }
    if(self.sUPPLIERADDRESS != nil){
        [aCoder encodeObject:self.sUPPLIERADDRESS forKey:kInputInfoModelSUPPLIERADDRESS];
    }
    if(self.sUPPLIERCODE != nil){
        [aCoder encodeObject:self.sUPPLIERCODE forKey:kInputInfoModelSUPPLIERCODE];
    }
    if(self.sUPPLIERNAME != nil){
        [aCoder encodeObject:self.sUPPLIERNAME forKey:kInputInfoModelSUPPLIERNAME];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDRESSCODE = [aDecoder decodeObjectForKey:kInputInfoModelADDRESSCODE];
    self.aDDRESSIDX = [aDecoder decodeObjectForKey:kInputInfoModelADDRESSIDX];
    self.aDDRESSINFO = [aDecoder decodeObjectForKey:kInputInfoModelADDRESSINFO];
    self.aDDRESSNAME = [aDecoder decodeObjectForKey:kInputInfoModelADDRESSNAME];
    self.aDDDATE = [aDecoder decodeObjectForKey:kInputInfoModelADDDATE];
    self.aDDUSER = [aDecoder decodeObjectForKey:kInputInfoModelADDUSER];
    self.aDUTDATE = [aDecoder decodeObjectForKey:kInputInfoModelADUTDATE];
    self.aDUTMARK = [aDecoder decodeObjectForKey:kInputInfoModelADUTMARK];
    self.aDUTUSER = [aDecoder decodeObjectForKey:kInputInfoModelADUTUSER];
    self.bUSINESSIDX = [aDecoder decodeObjectForKey:kInputInfoModelBUSINESSIDX];
    self.eDITDATE = [aDecoder decodeObjectForKey:kInputInfoModelEDITDATE];
    self.iDX = [aDecoder decodeObjectForKey:kInputInfoModelIDX];
    self.iNPUTDATE = [aDecoder decodeObjectForKey:kInputInfoModelINPUTDATE];
    self.iNPUTNO = [aDecoder decodeObjectForKey:kInputInfoModelINPUTNO];
    self.iNPUTQTY = [aDecoder decodeObjectForKey:kInputInfoModelINPUTQTY];
    self.iNPUTSTATE = [aDecoder decodeObjectForKey:kInputInfoModelINPUTSTATE];
    self.iNPUTSUM = [aDecoder decodeObjectForKey:kInputInfoModelINPUTSUM];
    self.iNPUTTYPE = [aDecoder decodeObjectForKey:kInputInfoModelINPUTTYPE];
    self.iNPUTVOLUME = [aDecoder decodeObjectForKey:kInputInfoModelINPUTVOLUME];
    self.iNPUTWEIGHT = [aDecoder decodeObjectForKey:kInputInfoModelINPUTWEIGHT];
    self.iNPUTWORKFLOW = [aDecoder decodeObjectForKey:kInputInfoModelINPUTWORKFLOW];
    self.oPERUSER = [aDecoder decodeObjectForKey:kInputInfoModelOPERUSER];
    self.oUTPUTNO = [aDecoder decodeObjectForKey:kInputInfoModelOUTPUTNO];
    self.pARTYMARK = [aDecoder decodeObjectForKey:kInputInfoModelPARTYMARK];
    self.sUPPLIERADDRESS = [aDecoder decodeObjectForKey:kInputInfoModelSUPPLIERADDRESS];
    self.sUPPLIERCODE = [aDecoder decodeObjectForKey:kInputInfoModelSUPPLIERCODE];
    self.sUPPLIERNAME = [aDecoder decodeObjectForKey:kInputInfoModelSUPPLIERNAME];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    InputInfoModel *copy = [InputInfoModel new];
    
    copy.aDDRESSCODE = [self.aDDRESSCODE copy];
    copy.aDDRESSIDX = [self.aDDRESSIDX copy];
    copy.aDDRESSINFO = [self.aDDRESSINFO copy];
    copy.aDDRESSNAME = [self.aDDRESSNAME copy];
    copy.aDDDATE = [self.aDDDATE copy];
    copy.aDDUSER = [self.aDDUSER copy];
    copy.aDUTDATE = [self.aDUTDATE copy];
    copy.aDUTMARK = [self.aDUTMARK copy];
    copy.aDUTUSER = [self.aDUTUSER copy];
    copy.bUSINESSIDX = [self.bUSINESSIDX copy];
    copy.eDITDATE = [self.eDITDATE copy];
    copy.iDX = [self.iDX copy];
    copy.iNPUTDATE = [self.iNPUTDATE copy];
    copy.iNPUTNO = [self.iNPUTNO copy];
    copy.iNPUTQTY = [self.iNPUTQTY copy];
    copy.iNPUTSTATE = [self.iNPUTSTATE copy];
    copy.iNPUTSUM = [self.iNPUTSUM copy];
    copy.iNPUTTYPE = [self.iNPUTTYPE copy];
    copy.iNPUTVOLUME = [self.iNPUTVOLUME copy];
    copy.iNPUTWEIGHT = [self.iNPUTWEIGHT copy];
    copy.iNPUTWORKFLOW = [self.iNPUTWORKFLOW copy];
    copy.oPERUSER = [self.oPERUSER copy];
    copy.oUTPUTNO = [self.oUTPUTNO copy];
    copy.pARTYMARK = [self.pARTYMARK copy];
    copy.sUPPLIERADDRESS = [self.sUPPLIERADDRESS copy];
    copy.sUPPLIERCODE = [self.sUPPLIERCODE copy];
    copy.sUPPLIERNAME = [self.sUPPLIERNAME copy];
    
    return copy;
}

@end
