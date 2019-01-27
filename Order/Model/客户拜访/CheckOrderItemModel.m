//
//  CheckOrderItemModel.m
//  Order
//
//  Created by wenwang wang on 2019/1/25.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CheckOrderItemModel.h"


NSString *const kCheckOrderItemModelACTPRICE = @"ACT_PRICE";
NSString *const kCheckOrderItemModelADDCODE = @"ADD_CODE";
NSString *const kCheckOrderItemModelIDX = @"IDX";
NSString *const kCheckOrderItemModelOMSPARENTNO = @"OMS_PARENT_NO";
NSString *const kCheckOrderItemModelOMSSPLITTYPE = @"OMS_SPLIT_TYPE";
NSString *const kCheckOrderItemModelORDDATEADD = @"ORD_DATE_ADD";
NSString *const kCheckOrderItemModelORDNO = @"ORD_NO";
NSString *const kCheckOrderItemModelORDQTY = @"ORD_QTY";
NSString *const kCheckOrderItemModelORDSTATE = @"ORD_STATE";
NSString *const kCheckOrderItemModelORDTOADDRESS = @"ORD_TO_ADDRESS";
NSString *const kCheckOrderItemModelORDTOCNAME = @"ORD_TO_CNAME";
NSString *const kCheckOrderItemModelORDTONAME = @"ORD_TO_NAME";
NSString *const kCheckOrderItemModelORDVOLUME = @"ORD_VOLUME";
NSString *const kCheckOrderItemModelORDWEIGHT = @"ORD_WEIGHT";
NSString *const kCheckOrderItemModelORDWORKFLOW = @"ORD_WORKFLOW";
NSString *const kCheckOrderItemModelPARTYTYPE = @"PARTY_TYPE";
NSString *const kCheckOrderItemModelTMSDRIVERNAME = @"TMS_DRIVER_NAME";
NSString *const kCheckOrderItemModelTMSDRIVERTEL = @"TMS_DRIVER_TEL";
NSString *const kCheckOrderItemModelTMSPLATENUMBER = @"TMS_PLATE_NUMBER";


@implementation CheckOrderItemModel


/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kCheckOrderItemModelACTPRICE] isKindOfClass:[NSNull class]]){
        self.aCTPRICE = dictionary[kCheckOrderItemModelACTPRICE];
    }
    if(![dictionary[kCheckOrderItemModelADDCODE] isKindOfClass:[NSNull class]]){
        self.aDDCODE = dictionary[kCheckOrderItemModelADDCODE];
    }
    if(![dictionary[kCheckOrderItemModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kCheckOrderItemModelIDX];
    }
    if(![dictionary[kCheckOrderItemModelOMSPARENTNO] isKindOfClass:[NSNull class]]){
        self.oMSPARENTNO = dictionary[kCheckOrderItemModelOMSPARENTNO];
    }
    if(![dictionary[kCheckOrderItemModelOMSSPLITTYPE] isKindOfClass:[NSNull class]]){
        self.oMSSPLITTYPE = dictionary[kCheckOrderItemModelOMSSPLITTYPE];
    }
    if(![dictionary[kCheckOrderItemModelORDDATEADD] isKindOfClass:[NSNull class]]){
        self.oRDDATEADD = dictionary[kCheckOrderItemModelORDDATEADD];
    }
    if(![dictionary[kCheckOrderItemModelORDNO] isKindOfClass:[NSNull class]]){
        self.oRDNO = dictionary[kCheckOrderItemModelORDNO];
    }
    if(![dictionary[kCheckOrderItemModelORDQTY] isKindOfClass:[NSNull class]]){
        self.oRDQTY = dictionary[kCheckOrderItemModelORDQTY];
    }
    if(![dictionary[kCheckOrderItemModelORDSTATE] isKindOfClass:[NSNull class]]){
        self.oRDSTATE = dictionary[kCheckOrderItemModelORDSTATE];
    }
    if(![dictionary[kCheckOrderItemModelORDTOADDRESS] isKindOfClass:[NSNull class]]){
        self.oRDTOADDRESS = dictionary[kCheckOrderItemModelORDTOADDRESS];
    }
    if(![dictionary[kCheckOrderItemModelORDTOCNAME] isKindOfClass:[NSNull class]]){
        self.oRDTOCNAME = dictionary[kCheckOrderItemModelORDTOCNAME];
    }
    if(![dictionary[kCheckOrderItemModelORDTONAME] isKindOfClass:[NSNull class]]){
        self.oRDTONAME = dictionary[kCheckOrderItemModelORDTONAME];
    }
    if(![dictionary[kCheckOrderItemModelORDVOLUME] isKindOfClass:[NSNull class]]){
        self.oRDVOLUME = dictionary[kCheckOrderItemModelORDVOLUME];
    }
    if(![dictionary[kCheckOrderItemModelORDWEIGHT] isKindOfClass:[NSNull class]]){
        self.oRDWEIGHT = dictionary[kCheckOrderItemModelORDWEIGHT];
    }
    if(![dictionary[kCheckOrderItemModelORDWORKFLOW] isKindOfClass:[NSNull class]]){
        self.oRDWORKFLOW = dictionary[kCheckOrderItemModelORDWORKFLOW];
    }
    if(![dictionary[kCheckOrderItemModelPARTYTYPE] isKindOfClass:[NSNull class]]){
        self.pARTYTYPE = dictionary[kCheckOrderItemModelPARTYTYPE];
    }
    if(![dictionary[kCheckOrderItemModelTMSDRIVERNAME] isKindOfClass:[NSNull class]]){
        self.tMSDRIVERNAME = dictionary[kCheckOrderItemModelTMSDRIVERNAME];
    }
    if(![dictionary[kCheckOrderItemModelTMSDRIVERTEL] isKindOfClass:[NSNull class]]){
        self.tMSDRIVERTEL = dictionary[kCheckOrderItemModelTMSDRIVERTEL];
    }
    if(![dictionary[kCheckOrderItemModelTMSPLATENUMBER] isKindOfClass:[NSNull class]]){
        self.tMSPLATENUMBER = dictionary[kCheckOrderItemModelTMSPLATENUMBER];
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
        dictionary[kCheckOrderItemModelACTPRICE] = self.aCTPRICE;
    }
    if(self.aDDCODE != nil){
        dictionary[kCheckOrderItemModelADDCODE] = self.aDDCODE;
    }
    if(self.iDX != nil){
        dictionary[kCheckOrderItemModelIDX] = self.iDX;
    }
    if(self.oMSPARENTNO != nil){
        dictionary[kCheckOrderItemModelOMSPARENTNO] = self.oMSPARENTNO;
    }
    if(self.oMSSPLITTYPE != nil){
        dictionary[kCheckOrderItemModelOMSSPLITTYPE] = self.oMSSPLITTYPE;
    }
    if(self.oRDDATEADD != nil){
        dictionary[kCheckOrderItemModelORDDATEADD] = self.oRDDATEADD;
    }
    if(self.oRDNO != nil){
        dictionary[kCheckOrderItemModelORDNO] = self.oRDNO;
    }
    if(self.oRDQTY != nil){
        dictionary[kCheckOrderItemModelORDQTY] = self.oRDQTY;
    }
    if(self.oRDSTATE != nil){
        dictionary[kCheckOrderItemModelORDSTATE] = self.oRDSTATE;
    }
    if(self.oRDTOADDRESS != nil){
        dictionary[kCheckOrderItemModelORDTOADDRESS] = self.oRDTOADDRESS;
    }
    if(self.oRDTOCNAME != nil){
        dictionary[kCheckOrderItemModelORDTOCNAME] = self.oRDTOCNAME;
    }
    if(self.oRDTONAME != nil){
        dictionary[kCheckOrderItemModelORDTONAME] = self.oRDTONAME;
    }
    if(self.oRDVOLUME != nil){
        dictionary[kCheckOrderItemModelORDVOLUME] = self.oRDVOLUME;
    }
    if(self.oRDWEIGHT != nil){
        dictionary[kCheckOrderItemModelORDWEIGHT] = self.oRDWEIGHT;
    }
    if(self.oRDWORKFLOW != nil){
        dictionary[kCheckOrderItemModelORDWORKFLOW] = self.oRDWORKFLOW;
    }
    if(self.pARTYTYPE != nil){
        dictionary[kCheckOrderItemModelPARTYTYPE] = self.pARTYTYPE;
    }
    if(self.tMSDRIVERNAME != nil){
        dictionary[kCheckOrderItemModelTMSDRIVERNAME] = self.tMSDRIVERNAME;
    }
    if(self.tMSDRIVERTEL != nil){
        dictionary[kCheckOrderItemModelTMSDRIVERTEL] = self.tMSDRIVERTEL;
    }
    if(self.tMSPLATENUMBER != nil){
        dictionary[kCheckOrderItemModelTMSPLATENUMBER] = self.tMSPLATENUMBER;
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
        [aCoder encodeObject:self.aCTPRICE forKey:kCheckOrderItemModelACTPRICE];
    }
    if(self.aDDCODE != nil){
        [aCoder encodeObject:self.aDDCODE forKey:kCheckOrderItemModelADDCODE];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kCheckOrderItemModelIDX];
    }
    if(self.oMSPARENTNO != nil){
        [aCoder encodeObject:self.oMSPARENTNO forKey:kCheckOrderItemModelOMSPARENTNO];
    }
    if(self.oMSSPLITTYPE != nil){
        [aCoder encodeObject:self.oMSSPLITTYPE forKey:kCheckOrderItemModelOMSSPLITTYPE];
    }
    if(self.oRDDATEADD != nil){
        [aCoder encodeObject:self.oRDDATEADD forKey:kCheckOrderItemModelORDDATEADD];
    }
    if(self.oRDNO != nil){
        [aCoder encodeObject:self.oRDNO forKey:kCheckOrderItemModelORDNO];
    }
    if(self.oRDQTY != nil){
        [aCoder encodeObject:self.oRDQTY forKey:kCheckOrderItemModelORDQTY];
    }
    if(self.oRDSTATE != nil){
        [aCoder encodeObject:self.oRDSTATE forKey:kCheckOrderItemModelORDSTATE];
    }
    if(self.oRDTOADDRESS != nil){
        [aCoder encodeObject:self.oRDTOADDRESS forKey:kCheckOrderItemModelORDTOADDRESS];
    }
    if(self.oRDTOCNAME != nil){
        [aCoder encodeObject:self.oRDTOCNAME forKey:kCheckOrderItemModelORDTOCNAME];
    }
    if(self.oRDTONAME != nil){
        [aCoder encodeObject:self.oRDTONAME forKey:kCheckOrderItemModelORDTONAME];
    }
    if(self.oRDVOLUME != nil){
        [aCoder encodeObject:self.oRDVOLUME forKey:kCheckOrderItemModelORDVOLUME];
    }
    if(self.oRDWEIGHT != nil){
        [aCoder encodeObject:self.oRDWEIGHT forKey:kCheckOrderItemModelORDWEIGHT];
    }
    if(self.oRDWORKFLOW != nil){
        [aCoder encodeObject:self.oRDWORKFLOW forKey:kCheckOrderItemModelORDWORKFLOW];
    }
    if(self.pARTYTYPE != nil){
        [aCoder encodeObject:self.pARTYTYPE forKey:kCheckOrderItemModelPARTYTYPE];
    }
    if(self.tMSDRIVERNAME != nil){
        [aCoder encodeObject:self.tMSDRIVERNAME forKey:kCheckOrderItemModelTMSDRIVERNAME];
    }
    if(self.tMSDRIVERTEL != nil){
        [aCoder encodeObject:self.tMSDRIVERTEL forKey:kCheckOrderItemModelTMSDRIVERTEL];
    }
    if(self.tMSPLATENUMBER != nil){
        [aCoder encodeObject:self.tMSPLATENUMBER forKey:kCheckOrderItemModelTMSPLATENUMBER];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aCTPRICE = [aDecoder decodeObjectForKey:kCheckOrderItemModelACTPRICE];
    self.aDDCODE = [aDecoder decodeObjectForKey:kCheckOrderItemModelADDCODE];
    self.iDX = [aDecoder decodeObjectForKey:kCheckOrderItemModelIDX];
    self.oMSPARENTNO = [aDecoder decodeObjectForKey:kCheckOrderItemModelOMSPARENTNO];
    self.oMSSPLITTYPE = [aDecoder decodeObjectForKey:kCheckOrderItemModelOMSSPLITTYPE];
    self.oRDDATEADD = [aDecoder decodeObjectForKey:kCheckOrderItemModelORDDATEADD];
    self.oRDNO = [aDecoder decodeObjectForKey:kCheckOrderItemModelORDNO];
    self.oRDQTY = [aDecoder decodeObjectForKey:kCheckOrderItemModelORDQTY];
    self.oRDSTATE = [aDecoder decodeObjectForKey:kCheckOrderItemModelORDSTATE];
    self.oRDTOADDRESS = [aDecoder decodeObjectForKey:kCheckOrderItemModelORDTOADDRESS];
    self.oRDTOCNAME = [aDecoder decodeObjectForKey:kCheckOrderItemModelORDTOCNAME];
    self.oRDTONAME = [aDecoder decodeObjectForKey:kCheckOrderItemModelORDTONAME];
    self.oRDVOLUME = [aDecoder decodeObjectForKey:kCheckOrderItemModelORDVOLUME];
    self.oRDWEIGHT = [aDecoder decodeObjectForKey:kCheckOrderItemModelORDWEIGHT];
    self.oRDWORKFLOW = [aDecoder decodeObjectForKey:kCheckOrderItemModelORDWORKFLOW];
    self.pARTYTYPE = [aDecoder decodeObjectForKey:kCheckOrderItemModelPARTYTYPE];
    self.tMSDRIVERNAME = [aDecoder decodeObjectForKey:kCheckOrderItemModelTMSDRIVERNAME];
    self.tMSDRIVERTEL = [aDecoder decodeObjectForKey:kCheckOrderItemModelTMSDRIVERTEL];
    self.tMSPLATENUMBER = [aDecoder decodeObjectForKey:kCheckOrderItemModelTMSPLATENUMBER];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CheckOrderItemModel *copy = [CheckOrderItemModel new];
    
    copy.aCTPRICE = [self.aCTPRICE copy];
    copy.aDDCODE = [self.aDDCODE copy];
    copy.iDX = [self.iDX copy];
    copy.oMSPARENTNO = [self.oMSPARENTNO copy];
    copy.oMSSPLITTYPE = [self.oMSSPLITTYPE copy];
    copy.oRDDATEADD = [self.oRDDATEADD copy];
    copy.oRDNO = [self.oRDNO copy];
    copy.oRDQTY = [self.oRDQTY copy];
    copy.oRDSTATE = [self.oRDSTATE copy];
    copy.oRDTOADDRESS = [self.oRDTOADDRESS copy];
    copy.oRDTOCNAME = [self.oRDTOCNAME copy];
    copy.oRDTONAME = [self.oRDTONAME copy];
    copy.oRDVOLUME = [self.oRDVOLUME copy];
    copy.oRDWEIGHT = [self.oRDWEIGHT copy];
    copy.oRDWORKFLOW = [self.oRDWORKFLOW copy];
    copy.pARTYTYPE = [self.pARTYTYPE copy];
    copy.tMSDRIVERNAME = [self.tMSDRIVERNAME copy];
    copy.tMSDRIVERTEL = [self.tMSDRIVERTEL copy];
    copy.tMSPLATENUMBER = [self.tMSPLATENUMBER copy];
    
    return copy;
}


@end
