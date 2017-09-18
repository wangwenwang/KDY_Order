//
//  InputModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "InputModel.h"


NSString *const kInputModelADDRESSCODE = @"ADDRESS_CODE";
NSString *const kInputModelADDRESSIDX = @"ADDRESS_IDX";
NSString *const kInputModelADDRESSINFO = @"ADDRESS_INFO";
NSString *const kInputModelADDRESSNAME = @"ADDRESS_NAME";
NSString *const kInputModelADDDATE = @"ADD_DATE";
NSString *const kInputModelADDUSER = @"ADD_USER";
NSString *const kInputModelADUTDATE = @"ADUT_DATE";
NSString *const kInputModelADUTMARK = @"ADUT_MARK";
NSString *const kInputModelADUTUSER = @"ADUT_USER";
NSString *const kInputModelBUSINESSIDX = @"BUSINESS_IDX";
NSString *const kInputModelEDITDATE = @"EDIT_DATE";
NSString *const kInputModelENTIDX = @"ENT_IDX";
NSString *const kInputModelIDX = @"IDX";
NSString *const kInputModelINPUTDATE = @"INPUT_DATE";
NSString *const kInputModelINPUTNO = @"INPUT_NO";
NSString *const kInputModelINPUTQTY = @"INPUT_QTY";
NSString *const kInputModelINPUTSTATE = @"INPUT_STATE";
NSString *const kInputModelINPUTSUM = @"INPUT_SUM";
NSString *const kInputModelINPUTTYPE = @"INPUT_TYPE";
NSString *const kInputModelINPUTVOLUME = @"INPUT_VOLUME";
NSString *const kInputModelINPUTWEIGHT = @"INPUT_WEIGHT";
NSString *const kInputModelINPUTWORKFLOW = @"INPUT_WORKFLOW";
NSString *const kInputModelOPERUSER = @"OPER_USER";
NSString *const kInputModelOUTPUTNO = @"OUTPUT_NO";
NSString *const kInputModelPARTYMARK = @"PARTY_MARK";
NSString *const kInputModelSUPPLIERADDRESS = @"SUPPLIER_ADDRESS";
NSString *const kInputModelSUPPLIERCODE = @"SUPPLIER_CODE";
NSString *const kInputModelSUPPLIERNAME = @"SUPPLIER_NAME";


@implementation InputModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kInputModelADDRESSCODE] isKindOfClass:[NSNull class]]){
        self.aDDRESSCODE = dictionary[kInputModelADDRESSCODE];
    }
    if(![dictionary[kInputModelADDRESSIDX] isKindOfClass:[NSNull class]]){
        self.aDDRESSIDX = dictionary[kInputModelADDRESSIDX];
    }
    if(![dictionary[kInputModelADDRESSINFO] isKindOfClass:[NSNull class]]){
        self.aDDRESSINFO = dictionary[kInputModelADDRESSINFO];
    }
    if(![dictionary[kInputModelADDRESSNAME] isKindOfClass:[NSNull class]]){
        self.aDDRESSNAME = dictionary[kInputModelADDRESSNAME];
    }
    if(![dictionary[kInputModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kInputModelADDDATE];
    }
    if(![dictionary[kInputModelADDUSER] isKindOfClass:[NSNull class]]){
        self.aDDUSER = dictionary[kInputModelADDUSER];
    }
    if(![dictionary[kInputModelADUTDATE] isKindOfClass:[NSNull class]]){
        self.aDUTDATE = dictionary[kInputModelADUTDATE];
    }
    if(![dictionary[kInputModelADUTMARK] isKindOfClass:[NSNull class]]){
        self.aDUTMARK = dictionary[kInputModelADUTMARK];
    }
    if(![dictionary[kInputModelADUTUSER] isKindOfClass:[NSNull class]]){
        self.aDUTUSER = dictionary[kInputModelADUTUSER];
    }
    if(![dictionary[kInputModelBUSINESSIDX] isKindOfClass:[NSNull class]]){
        self.bUSINESSIDX = dictionary[kInputModelBUSINESSIDX];
    }
    if(![dictionary[kInputModelEDITDATE] isKindOfClass:[NSNull class]]){
        self.eDITDATE = dictionary[kInputModelEDITDATE];
    }
    if(![dictionary[kInputModelENTIDX] isKindOfClass:[NSNull class]]){
        self.eNTIDX = dictionary[kInputModelENTIDX];
    }
    if(![dictionary[kInputModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kInputModelIDX];
    }
    if(![dictionary[kInputModelINPUTDATE] isKindOfClass:[NSNull class]]){
        self.iNPUTDATE = dictionary[kInputModelINPUTDATE];
    }
    if(![dictionary[kInputModelINPUTNO] isKindOfClass:[NSNull class]]){
        self.iNPUTNO = dictionary[kInputModelINPUTNO];
    }
    if(![dictionary[kInputModelINPUTQTY] isKindOfClass:[NSNull class]]){
        self.iNPUTQTY = dictionary[kInputModelINPUTQTY];
    }
    if(![dictionary[kInputModelINPUTSTATE] isKindOfClass:[NSNull class]]){
        self.iNPUTSTATE = dictionary[kInputModelINPUTSTATE];
    }
    if(![dictionary[kInputModelINPUTSUM] isKindOfClass:[NSNull class]]){
        self.iNPUTSUM = dictionary[kInputModelINPUTSUM];
    }
    if(![dictionary[kInputModelINPUTTYPE] isKindOfClass:[NSNull class]]){
        self.iNPUTTYPE = dictionary[kInputModelINPUTTYPE];
    }
    if(![dictionary[kInputModelINPUTVOLUME] isKindOfClass:[NSNull class]]){
        self.iNPUTVOLUME = dictionary[kInputModelINPUTVOLUME];
    }
    if(![dictionary[kInputModelINPUTWEIGHT] isKindOfClass:[NSNull class]]){
        self.iNPUTWEIGHT = dictionary[kInputModelINPUTWEIGHT];
    }
    if(![dictionary[kInputModelINPUTWORKFLOW] isKindOfClass:[NSNull class]]){
        self.iNPUTWORKFLOW = dictionary[kInputModelINPUTWORKFLOW];
    }
    if(![dictionary[kInputModelOPERUSER] isKindOfClass:[NSNull class]]){
        self.oPERUSER = dictionary[kInputModelOPERUSER];
    }
    if(![dictionary[kInputModelOUTPUTNO] isKindOfClass:[NSNull class]]){
        self.oUTPUTNO = dictionary[kInputModelOUTPUTNO];
    }
    if(![dictionary[kInputModelPARTYMARK] isKindOfClass:[NSNull class]]){
        self.pARTYMARK = dictionary[kInputModelPARTYMARK];
    }
    if(![dictionary[kInputModelSUPPLIERADDRESS] isKindOfClass:[NSNull class]]){
        self.sUPPLIERADDRESS = dictionary[kInputModelSUPPLIERADDRESS];
    }
    if(![dictionary[kInputModelSUPPLIERCODE] isKindOfClass:[NSNull class]]){
        self.sUPPLIERCODE = dictionary[kInputModelSUPPLIERCODE];
    }
    if(![dictionary[kInputModelSUPPLIERNAME] isKindOfClass:[NSNull class]]){
        self.sUPPLIERNAME = dictionary[kInputModelSUPPLIERNAME];
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
        dictionary[kInputModelADDRESSCODE] = self.aDDRESSCODE;
    }
    if(self.aDDRESSIDX != nil){
        dictionary[kInputModelADDRESSIDX] = self.aDDRESSIDX;
    }
    if(self.aDDRESSINFO != nil){
        dictionary[kInputModelADDRESSINFO] = self.aDDRESSINFO;
    }
    if(self.aDDRESSNAME != nil){
        dictionary[kInputModelADDRESSNAME] = self.aDDRESSNAME;
    }
    if(self.aDDDATE != nil){
        dictionary[kInputModelADDDATE] = self.aDDDATE;
    }
    if(self.aDDUSER != nil){
        dictionary[kInputModelADDUSER] = self.aDDUSER;
    }
    if(self.aDUTDATE != nil){
        dictionary[kInputModelADUTDATE] = self.aDUTDATE;
    }
    if(self.aDUTMARK != nil){
        dictionary[kInputModelADUTMARK] = self.aDUTMARK;
    }
    if(self.aDUTUSER != nil){
        dictionary[kInputModelADUTUSER] = self.aDUTUSER;
    }
    if(self.bUSINESSIDX != nil){
        dictionary[kInputModelBUSINESSIDX] = self.bUSINESSIDX;
    }
    if(self.eDITDATE != nil){
        dictionary[kInputModelEDITDATE] = self.eDITDATE;
    }
    if(self.eNTIDX != nil){
        dictionary[kInputModelENTIDX] = self.eNTIDX;
    }
    if(self.iDX != nil){
        dictionary[kInputModelIDX] = self.iDX;
    }
    if(self.iNPUTDATE != nil){
        dictionary[kInputModelINPUTDATE] = self.iNPUTDATE;
    }
    if(self.iNPUTNO != nil){
        dictionary[kInputModelINPUTNO] = self.iNPUTNO;
    }
    if(self.iNPUTQTY != nil){
        dictionary[kInputModelINPUTQTY] = self.iNPUTQTY;
    }
    if(self.iNPUTSTATE != nil){
        dictionary[kInputModelINPUTSTATE] = self.iNPUTSTATE;
    }
    if(self.iNPUTSUM != nil){
        dictionary[kInputModelINPUTSUM] = self.iNPUTSUM;
    }
    if(self.iNPUTTYPE != nil){
        dictionary[kInputModelINPUTTYPE] = self.iNPUTTYPE;
    }
    if(self.iNPUTVOLUME != nil){
        dictionary[kInputModelINPUTVOLUME] = self.iNPUTVOLUME;
    }
    if(self.iNPUTWEIGHT != nil){
        dictionary[kInputModelINPUTWEIGHT] = self.iNPUTWEIGHT;
    }
    if(self.iNPUTWORKFLOW != nil){
        dictionary[kInputModelINPUTWORKFLOW] = self.iNPUTWORKFLOW;
    }
    if(self.oPERUSER != nil){
        dictionary[kInputModelOPERUSER] = self.oPERUSER;
    }
    if(self.oUTPUTNO != nil){
        dictionary[kInputModelOUTPUTNO] = self.oUTPUTNO;
    }
    if(self.pARTYMARK != nil){
        dictionary[kInputModelPARTYMARK] = self.pARTYMARK;
    }
    if(self.sUPPLIERADDRESS != nil){
        dictionary[kInputModelSUPPLIERADDRESS] = self.sUPPLIERADDRESS;
    }
    if(self.sUPPLIERCODE != nil){
        dictionary[kInputModelSUPPLIERCODE] = self.sUPPLIERCODE;
    }
    if(self.sUPPLIERNAME != nil){
        dictionary[kInputModelSUPPLIERNAME] = self.sUPPLIERNAME;
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
        [aCoder encodeObject:self.aDDRESSCODE forKey:kInputModelADDRESSCODE];
    }
    if(self.aDDRESSIDX != nil){
        [aCoder encodeObject:self.aDDRESSIDX forKey:kInputModelADDRESSIDX];
    }
    if(self.aDDRESSINFO != nil){
        [aCoder encodeObject:self.aDDRESSINFO forKey:kInputModelADDRESSINFO];
    }
    if(self.aDDRESSNAME != nil){
        [aCoder encodeObject:self.aDDRESSNAME forKey:kInputModelADDRESSNAME];
    }
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kInputModelADDDATE];
    }
    if(self.aDDUSER != nil){
        [aCoder encodeObject:self.aDDUSER forKey:kInputModelADDUSER];
    }
    if(self.aDUTDATE != nil){
        [aCoder encodeObject:self.aDUTDATE forKey:kInputModelADUTDATE];
    }
    if(self.aDUTMARK != nil){
        [aCoder encodeObject:self.aDUTMARK forKey:kInputModelADUTMARK];
    }
    if(self.aDUTUSER != nil){
        [aCoder encodeObject:self.aDUTUSER forKey:kInputModelADUTUSER];
    }
    if(self.bUSINESSIDX != nil){
        [aCoder encodeObject:self.bUSINESSIDX forKey:kInputModelBUSINESSIDX];
    }
    if(self.eDITDATE != nil){
        [aCoder encodeObject:self.eDITDATE forKey:kInputModelEDITDATE];
    }
    if(self.eNTIDX != nil){
        [aCoder encodeObject:self.eNTIDX forKey:kInputModelENTIDX];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kInputModelIDX];
    }
    if(self.iNPUTDATE != nil){
        [aCoder encodeObject:self.iNPUTDATE forKey:kInputModelINPUTDATE];
    }
    if(self.iNPUTNO != nil){
        [aCoder encodeObject:self.iNPUTNO forKey:kInputModelINPUTNO];
    }
    if(self.iNPUTQTY != nil){
        [aCoder encodeObject:self.iNPUTQTY forKey:kInputModelINPUTQTY];
    }
    if(self.iNPUTSTATE != nil){
        [aCoder encodeObject:self.iNPUTSTATE forKey:kInputModelINPUTSTATE];
    }
    if(self.iNPUTSUM != nil){
        [aCoder encodeObject:self.iNPUTSUM forKey:kInputModelINPUTSUM];
    }
    if(self.iNPUTTYPE != nil){
        [aCoder encodeObject:self.iNPUTTYPE forKey:kInputModelINPUTTYPE];
    }
    if(self.iNPUTVOLUME != nil){
        [aCoder encodeObject:self.iNPUTVOLUME forKey:kInputModelINPUTVOLUME];
    }
    if(self.iNPUTWEIGHT != nil){
        [aCoder encodeObject:self.iNPUTWEIGHT forKey:kInputModelINPUTWEIGHT];
    }
    if(self.iNPUTWORKFLOW != nil){
        [aCoder encodeObject:self.iNPUTWORKFLOW forKey:kInputModelINPUTWORKFLOW];
    }
    if(self.oPERUSER != nil){
        [aCoder encodeObject:self.oPERUSER forKey:kInputModelOPERUSER];
    }
    if(self.oUTPUTNO != nil){
        [aCoder encodeObject:self.oUTPUTNO forKey:kInputModelOUTPUTNO];
    }
    if(self.pARTYMARK != nil){
        [aCoder encodeObject:self.pARTYMARK forKey:kInputModelPARTYMARK];
    }
    if(self.sUPPLIERADDRESS != nil){
        [aCoder encodeObject:self.sUPPLIERADDRESS forKey:kInputModelSUPPLIERADDRESS];
    }
    if(self.sUPPLIERCODE != nil){
        [aCoder encodeObject:self.sUPPLIERCODE forKey:kInputModelSUPPLIERCODE];
    }
    if(self.sUPPLIERNAME != nil){
        [aCoder encodeObject:self.sUPPLIERNAME forKey:kInputModelSUPPLIERNAME];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDRESSCODE = [aDecoder decodeObjectForKey:kInputModelADDRESSCODE];
    self.aDDRESSIDX = [aDecoder decodeObjectForKey:kInputModelADDRESSIDX];
    self.aDDRESSINFO = [aDecoder decodeObjectForKey:kInputModelADDRESSINFO];
    self.aDDRESSNAME = [aDecoder decodeObjectForKey:kInputModelADDRESSNAME];
    self.aDDDATE = [aDecoder decodeObjectForKey:kInputModelADDDATE];
    self.aDDUSER = [aDecoder decodeObjectForKey:kInputModelADDUSER];
    self.aDUTDATE = [aDecoder decodeObjectForKey:kInputModelADUTDATE];
    self.aDUTMARK = [aDecoder decodeObjectForKey:kInputModelADUTMARK];
    self.aDUTUSER = [aDecoder decodeObjectForKey:kInputModelADUTUSER];
    self.bUSINESSIDX = [aDecoder decodeObjectForKey:kInputModelBUSINESSIDX];
    self.eDITDATE = [aDecoder decodeObjectForKey:kInputModelEDITDATE];
    self.eNTIDX = [aDecoder decodeObjectForKey:kInputModelENTIDX];
    self.iDX = [aDecoder decodeObjectForKey:kInputModelIDX];
    self.iNPUTDATE = [aDecoder decodeObjectForKey:kInputModelINPUTDATE];
    self.iNPUTNO = [aDecoder decodeObjectForKey:kInputModelINPUTNO];
    self.iNPUTQTY = [aDecoder decodeObjectForKey:kInputModelINPUTQTY];
    self.iNPUTSTATE = [aDecoder decodeObjectForKey:kInputModelINPUTSTATE];
    self.iNPUTSUM = [aDecoder decodeObjectForKey:kInputModelINPUTSUM];
    self.iNPUTTYPE = [aDecoder decodeObjectForKey:kInputModelINPUTTYPE];
    self.iNPUTVOLUME = [aDecoder decodeObjectForKey:kInputModelINPUTVOLUME];
    self.iNPUTWEIGHT = [aDecoder decodeObjectForKey:kInputModelINPUTWEIGHT];
    self.iNPUTWORKFLOW = [aDecoder decodeObjectForKey:kInputModelINPUTWORKFLOW];
    self.oPERUSER = [aDecoder decodeObjectForKey:kInputModelOPERUSER];
    self.oUTPUTNO = [aDecoder decodeObjectForKey:kInputModelOUTPUTNO];
    self.pARTYMARK = [aDecoder decodeObjectForKey:kInputModelPARTYMARK];
    self.sUPPLIERADDRESS = [aDecoder decodeObjectForKey:kInputModelSUPPLIERADDRESS];
    self.sUPPLIERCODE = [aDecoder decodeObjectForKey:kInputModelSUPPLIERCODE];
    self.sUPPLIERNAME = [aDecoder decodeObjectForKey:kInputModelSUPPLIERNAME];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    InputModel *copy = [InputModel new];
    
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
    copy.eNTIDX = [self.eNTIDX copy];
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
