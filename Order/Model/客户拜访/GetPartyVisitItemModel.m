//
//  GetPartyVisitItemModel.m
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitItemModel.h"


NSString *const kGetPartyVisitItemModelACTUALVISITINGADDRESS = @"ACTUAL_VISITING_ADDRESS";
NSString *const kGetPartyVisitItemModelADDRESSCODE = @"ADDRESS_CODE";
NSString *const kGetPartyVisitItemModelADDRESSIDX = @"ADDRESS_IDX";
NSString *const kGetPartyVisitItemModelADDDATE = @"ADD_DATE";
NSString *const kGetPartyVisitItemModelBUSINESSIDX = @"BUSINESS_IDX";
NSString *const kGetPartyVisitItemModelCHANNEL = @"CHANNEL";
NSString *const kGetPartyVisitItemModelCHECKINVENTORY = @"CHECK_INVENTORY";
NSString *const kGetPartyVisitItemModelCONTACTS = @"CONTACTS";
NSString *const kGetPartyVisitItemModelCONTACTSTEL = @"CONTACTS_TEL";
NSString *const kGetPartyVisitItemModelEDITDATE = @"EDIT_DATE";
NSString *const kGetPartyVisitItemModelFARTHERADDRESSID = @"FARTHER_ADDRESS_ID";
NSString *const kGetPartyVisitItemModelFARTHERPARTYID = @"FARTHER_PARTY_ID";
NSString *const kGetPartyVisitItemModelGRADE = @"GRADE";
NSString *const kGetPartyVisitItemModelIDX = @"IDX";
NSString *const kGetPartyVisitItemModelLINE = @"LINE";
NSString *const kGetPartyVisitItemModelNECESSARYSKU = @"NECESSARY_SKU";
NSString *const kGetPartyVisitItemModelPARTYADDRESS = @"PARTY_ADDRESS";
NSString *const kGetPartyVisitItemModelPARTYLEVEL = @"PARTY_LEVEL";
NSString *const kGetPartyVisitItemModelPARTYNAME = @"PARTY_NAME";
NSString *const kGetPartyVisitItemModelPARTYNO = @"PARTY_NO";
NSString *const kGetPartyVisitItemModelPARTYSTATES = @"PARTY_STATES";
NSString *const kGetPartyVisitItemModelPARTYTYPE = @"PARTY_TYPE";
NSString *const kGetPartyVisitItemModelREACHTHESITUATION = @"REACH_THE_SITUATION";
NSString *const kGetPartyVisitItemModelRECOMMENDEDORDER = @"RECOMMENDED_ORDER";
NSString *const kGetPartyVisitItemModelSINGLESTORESALES = @"SINGLE_STORE_SALES";
NSString *const kGetPartyVisitItemModelUSERNAME = @"USER_NAME";
NSString *const kGetPartyVisitItemModelUSERNO = @"USER_NO";
NSString *const kGetPartyVisitItemModelVISITDATE = @"VISIT_DATE";
NSString *const kGetPartyVisitItemModelVISITIDX = @"VISIT_IDX";
NSString *const kGetPartyVisitItemModelVISITSTATES = @"VISIT_STATES";
NSString *const kGetPartyVisitItemModelVIVIDDISPLAYCBX = @"VIVID_DISPLAY_CBX";
NSString *const kGetPartyVisitItemModelVIVIDDISPLAYTEXT = @"VIVID_DISPLAY_TEXT";
NSString *const kGetPartyVisitItemModelWEEKLYVISITFREQUENCY = @"WEEKLY_VISIT_FREQUENCY";


@interface GetPartyVisitItemModel ()
@end
@implementation GetPartyVisitItemModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kGetPartyVisitItemModelACTUALVISITINGADDRESS] isKindOfClass:[NSNull class]]){
        self.aCTUALVISITINGADDRESS = dictionary[kGetPartyVisitItemModelACTUALVISITINGADDRESS];
    }
    if(![dictionary[kGetPartyVisitItemModelADDRESSCODE] isKindOfClass:[NSNull class]]){
        self.aDDRESSCODE = dictionary[kGetPartyVisitItemModelADDRESSCODE];
    }
    if(![dictionary[kGetPartyVisitItemModelADDRESSIDX] isKindOfClass:[NSNull class]]){
        self.aDDRESSIDX = dictionary[kGetPartyVisitItemModelADDRESSIDX];
    }
    if(![dictionary[kGetPartyVisitItemModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kGetPartyVisitItemModelADDDATE];
    }
    if(![dictionary[kGetPartyVisitItemModelBUSINESSIDX] isKindOfClass:[NSNull class]]){
        self.bUSINESSIDX = dictionary[kGetPartyVisitItemModelBUSINESSIDX];
    }
    if(![dictionary[kGetPartyVisitItemModelCHANNEL] isKindOfClass:[NSNull class]]){
        self.cHANNEL = dictionary[kGetPartyVisitItemModelCHANNEL];
    }
    if(![dictionary[kGetPartyVisitItemModelCHECKINVENTORY] isKindOfClass:[NSNull class]]){
        self.cHECKINVENTORY = dictionary[kGetPartyVisitItemModelCHECKINVENTORY];
    }
    if(![dictionary[kGetPartyVisitItemModelCONTACTS] isKindOfClass:[NSNull class]]){
        self.cONTACTS = dictionary[kGetPartyVisitItemModelCONTACTS];
    }
    if(![dictionary[kGetPartyVisitItemModelCONTACTSTEL] isKindOfClass:[NSNull class]]){
        self.cONTACTSTEL = dictionary[kGetPartyVisitItemModelCONTACTSTEL];
    }
    if(![dictionary[kGetPartyVisitItemModelEDITDATE] isKindOfClass:[NSNull class]]){
        self.eDITDATE = dictionary[kGetPartyVisitItemModelEDITDATE];
    }
    if(![dictionary[kGetPartyVisitItemModelFARTHERADDRESSID] isKindOfClass:[NSNull class]]){
        self.fARTHERADDRESSID = dictionary[kGetPartyVisitItemModelFARTHERADDRESSID];
    }
    if(![dictionary[kGetPartyVisitItemModelFARTHERPARTYID] isKindOfClass:[NSNull class]]){
        self.fARTHERPARTYID = dictionary[kGetPartyVisitItemModelFARTHERPARTYID];
    }
    if(![dictionary[kGetPartyVisitItemModelGRADE] isKindOfClass:[NSNull class]]){
        self.gRADE = dictionary[kGetPartyVisitItemModelGRADE];
    }
    if(![dictionary[kGetPartyVisitItemModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kGetPartyVisitItemModelIDX];
    }
    if(![dictionary[kGetPartyVisitItemModelLINE] isKindOfClass:[NSNull class]]){
        self.lINE = dictionary[kGetPartyVisitItemModelLINE];
    }
    if(![dictionary[kGetPartyVisitItemModelNECESSARYSKU] isKindOfClass:[NSNull class]]){
        self.nECESSARYSKU = dictionary[kGetPartyVisitItemModelNECESSARYSKU];
    }
    if(![dictionary[kGetPartyVisitItemModelPARTYADDRESS] isKindOfClass:[NSNull class]]){
        self.pARTYADDRESS = dictionary[kGetPartyVisitItemModelPARTYADDRESS];
    }
    if(![dictionary[kGetPartyVisitItemModelPARTYLEVEL] isKindOfClass:[NSNull class]]){
        self.pARTYLEVEL = dictionary[kGetPartyVisitItemModelPARTYLEVEL];
    }
    if(![dictionary[kGetPartyVisitItemModelPARTYNAME] isKindOfClass:[NSNull class]]){
        self.pARTYNAME = dictionary[kGetPartyVisitItemModelPARTYNAME];
    }
    if(![dictionary[kGetPartyVisitItemModelPARTYNO] isKindOfClass:[NSNull class]]){
        self.pARTYNO = dictionary[kGetPartyVisitItemModelPARTYNO];
    }
    if(![dictionary[kGetPartyVisitItemModelPARTYSTATES] isKindOfClass:[NSNull class]]){
        self.pARTYSTATES = dictionary[kGetPartyVisitItemModelPARTYSTATES];
    }
    if(![dictionary[kGetPartyVisitItemModelPARTYTYPE] isKindOfClass:[NSNull class]]){
        self.pARTYTYPE = dictionary[kGetPartyVisitItemModelPARTYTYPE];
    }
    if(![dictionary[kGetPartyVisitItemModelREACHTHESITUATION] isKindOfClass:[NSNull class]]){
        self.rEACHTHESITUATION = dictionary[kGetPartyVisitItemModelREACHTHESITUATION];
    }
    if(![dictionary[kGetPartyVisitItemModelRECOMMENDEDORDER] isKindOfClass:[NSNull class]]){
        self.rECOMMENDEDORDER = dictionary[kGetPartyVisitItemModelRECOMMENDEDORDER];
    }
    if(![dictionary[kGetPartyVisitItemModelSINGLESTORESALES] isKindOfClass:[NSNull class]]){
        self.sINGLESTORESALES = dictionary[kGetPartyVisitItemModelSINGLESTORESALES];
    }
    if(![dictionary[kGetPartyVisitItemModelUSERNAME] isKindOfClass:[NSNull class]]){
        self.uSERNAME = dictionary[kGetPartyVisitItemModelUSERNAME];
    }
    if(![dictionary[kGetPartyVisitItemModelUSERNO] isKindOfClass:[NSNull class]]){
        self.uSERNO = dictionary[kGetPartyVisitItemModelUSERNO];
    }
    if(![dictionary[kGetPartyVisitItemModelVISITDATE] isKindOfClass:[NSNull class]]){
        self.vISITDATE = dictionary[kGetPartyVisitItemModelVISITDATE];
    }
    if(![dictionary[kGetPartyVisitItemModelVISITIDX] isKindOfClass:[NSNull class]]){
        self.vISITIDX = dictionary[kGetPartyVisitItemModelVISITIDX];
    }
    if(![dictionary[kGetPartyVisitItemModelVISITSTATES] isKindOfClass:[NSNull class]]){
        self.vISITSTATES = dictionary[kGetPartyVisitItemModelVISITSTATES];
    }
    if(![dictionary[kGetPartyVisitItemModelVIVIDDISPLAYCBX] isKindOfClass:[NSNull class]]){
        self.vIVIDDISPLAYCBX = dictionary[kGetPartyVisitItemModelVIVIDDISPLAYCBX];
    }
    if(![dictionary[kGetPartyVisitItemModelVIVIDDISPLAYTEXT] isKindOfClass:[NSNull class]]){
        self.vIVIDDISPLAYTEXT = dictionary[kGetPartyVisitItemModelVIVIDDISPLAYTEXT];
    }
    if(![dictionary[kGetPartyVisitItemModelWEEKLYVISITFREQUENCY] isKindOfClass:[NSNull class]]){
        self.wEEKLYVISITFREQUENCY = dictionary[kGetPartyVisitItemModelWEEKLYVISITFREQUENCY];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aCTUALVISITINGADDRESS != nil){
        dictionary[kGetPartyVisitItemModelACTUALVISITINGADDRESS] = self.aCTUALVISITINGADDRESS;
    }
    if(self.aDDRESSCODE != nil){
        dictionary[kGetPartyVisitItemModelADDRESSCODE] = self.aDDRESSCODE;
    }
    if(self.aDDRESSIDX != nil){
        dictionary[kGetPartyVisitItemModelADDRESSIDX] = self.aDDRESSIDX;
    }
    if(self.aDDDATE != nil){
        dictionary[kGetPartyVisitItemModelADDDATE] = self.aDDDATE;
    }
    if(self.bUSINESSIDX != nil){
        dictionary[kGetPartyVisitItemModelBUSINESSIDX] = self.bUSINESSIDX;
    }
    if(self.cHANNEL != nil){
        dictionary[kGetPartyVisitItemModelCHANNEL] = self.cHANNEL;
    }
    if(self.cHECKINVENTORY != nil){
        dictionary[kGetPartyVisitItemModelCHECKINVENTORY] = self.cHECKINVENTORY;
    }
    if(self.cONTACTS != nil){
        dictionary[kGetPartyVisitItemModelCONTACTS] = self.cONTACTS;
    }
    if(self.cONTACTSTEL != nil){
        dictionary[kGetPartyVisitItemModelCONTACTSTEL] = self.cONTACTSTEL;
    }
    if(self.eDITDATE != nil){
        dictionary[kGetPartyVisitItemModelEDITDATE] = self.eDITDATE;
    }
    if(self.fARTHERADDRESSID != nil){
        dictionary[kGetPartyVisitItemModelFARTHERADDRESSID] = self.fARTHERADDRESSID;
    }
    if(self.fARTHERPARTYID != nil){
        dictionary[kGetPartyVisitItemModelFARTHERPARTYID] = self.fARTHERPARTYID;
    }
    if(self.gRADE != nil){
        dictionary[kGetPartyVisitItemModelGRADE] = self.gRADE;
    }
    if(self.iDX != nil){
        dictionary[kGetPartyVisitItemModelIDX] = self.iDX;
    }
    if(self.lINE != nil){
        dictionary[kGetPartyVisitItemModelLINE] = self.lINE;
    }
    if(self.nECESSARYSKU != nil){
        dictionary[kGetPartyVisitItemModelNECESSARYSKU] = self.nECESSARYSKU;
    }
    if(self.pARTYADDRESS != nil){
        dictionary[kGetPartyVisitItemModelPARTYADDRESS] = self.pARTYADDRESS;
    }
    if(self.pARTYLEVEL != nil){
        dictionary[kGetPartyVisitItemModelPARTYLEVEL] = self.pARTYLEVEL;
    }
    if(self.pARTYNAME != nil){
        dictionary[kGetPartyVisitItemModelPARTYNAME] = self.pARTYNAME;
    }
    if(self.pARTYNO != nil){
        dictionary[kGetPartyVisitItemModelPARTYNO] = self.pARTYNO;
    }
    if(self.pARTYSTATES != nil){
        dictionary[kGetPartyVisitItemModelPARTYSTATES] = self.pARTYSTATES;
    }
    if(self.pARTYTYPE != nil){
        dictionary[kGetPartyVisitItemModelPARTYTYPE] = self.pARTYTYPE;
    }
    if(self.rEACHTHESITUATION != nil){
        dictionary[kGetPartyVisitItemModelREACHTHESITUATION] = self.rEACHTHESITUATION;
    }
    if(self.rECOMMENDEDORDER != nil){
        dictionary[kGetPartyVisitItemModelRECOMMENDEDORDER] = self.rECOMMENDEDORDER;
    }
    if(self.sINGLESTORESALES != nil){
        dictionary[kGetPartyVisitItemModelSINGLESTORESALES] = self.sINGLESTORESALES;
    }
    if(self.uSERNAME != nil){
        dictionary[kGetPartyVisitItemModelUSERNAME] = self.uSERNAME;
    }
    if(self.uSERNO != nil){
        dictionary[kGetPartyVisitItemModelUSERNO] = self.uSERNO;
    }
    if(self.vISITDATE != nil){
        dictionary[kGetPartyVisitItemModelVISITDATE] = self.vISITDATE;
    }
    if(self.vISITIDX != nil){
        dictionary[kGetPartyVisitItemModelVISITIDX] = self.vISITIDX;
    }
    if(self.vISITSTATES != nil){
        dictionary[kGetPartyVisitItemModelVISITSTATES] = self.vISITSTATES;
    }
    if(self.vIVIDDISPLAYCBX != nil){
        dictionary[kGetPartyVisitItemModelVIVIDDISPLAYCBX] = self.vIVIDDISPLAYCBX;
    }
    if(self.vIVIDDISPLAYTEXT != nil){
        dictionary[kGetPartyVisitItemModelVIVIDDISPLAYTEXT] = self.vIVIDDISPLAYTEXT;
    }
    if(self.wEEKLYVISITFREQUENCY != nil){
        dictionary[kGetPartyVisitItemModelWEEKLYVISITFREQUENCY] = self.wEEKLYVISITFREQUENCY;
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
    if(self.aCTUALVISITINGADDRESS != nil){
        [aCoder encodeObject:self.aCTUALVISITINGADDRESS forKey:kGetPartyVisitItemModelACTUALVISITINGADDRESS];
    }
    if(self.aDDRESSCODE != nil){
        [aCoder encodeObject:self.aDDRESSCODE forKey:kGetPartyVisitItemModelADDRESSCODE];
    }
    if(self.aDDRESSIDX != nil){
        [aCoder encodeObject:self.aDDRESSIDX forKey:kGetPartyVisitItemModelADDRESSIDX];
    }
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kGetPartyVisitItemModelADDDATE];
    }
    if(self.bUSINESSIDX != nil){
        [aCoder encodeObject:self.bUSINESSIDX forKey:kGetPartyVisitItemModelBUSINESSIDX];
    }
    if(self.cHANNEL != nil){
        [aCoder encodeObject:self.cHANNEL forKey:kGetPartyVisitItemModelCHANNEL];
    }
    if(self.cHECKINVENTORY != nil){
        [aCoder encodeObject:self.cHECKINVENTORY forKey:kGetPartyVisitItemModelCHECKINVENTORY];
    }
    if(self.cONTACTS != nil){
        [aCoder encodeObject:self.cONTACTS forKey:kGetPartyVisitItemModelCONTACTS];
    }
    if(self.cONTACTSTEL != nil){
        [aCoder encodeObject:self.cONTACTSTEL forKey:kGetPartyVisitItemModelCONTACTSTEL];
    }
    if(self.eDITDATE != nil){
        [aCoder encodeObject:self.eDITDATE forKey:kGetPartyVisitItemModelEDITDATE];
    }
    if(self.fARTHERADDRESSID != nil){
        [aCoder encodeObject:self.fARTHERADDRESSID forKey:kGetPartyVisitItemModelFARTHERADDRESSID];
    }
    if(self.fARTHERPARTYID != nil){
        [aCoder encodeObject:self.fARTHERPARTYID forKey:kGetPartyVisitItemModelFARTHERPARTYID];
    }
    if(self.gRADE != nil){
        [aCoder encodeObject:self.gRADE forKey:kGetPartyVisitItemModelGRADE];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kGetPartyVisitItemModelIDX];
    }
    if(self.lINE != nil){
        [aCoder encodeObject:self.lINE forKey:kGetPartyVisitItemModelLINE];
    }
    if(self.nECESSARYSKU != nil){
        [aCoder encodeObject:self.nECESSARYSKU forKey:kGetPartyVisitItemModelNECESSARYSKU];
    }
    if(self.pARTYADDRESS != nil){
        [aCoder encodeObject:self.pARTYADDRESS forKey:kGetPartyVisitItemModelPARTYADDRESS];
    }
    if(self.pARTYLEVEL != nil){
        [aCoder encodeObject:self.pARTYLEVEL forKey:kGetPartyVisitItemModelPARTYLEVEL];
    }
    if(self.pARTYNAME != nil){
        [aCoder encodeObject:self.pARTYNAME forKey:kGetPartyVisitItemModelPARTYNAME];
    }
    if(self.pARTYNO != nil){
        [aCoder encodeObject:self.pARTYNO forKey:kGetPartyVisitItemModelPARTYNO];
    }
    if(self.pARTYSTATES != nil){
        [aCoder encodeObject:self.pARTYSTATES forKey:kGetPartyVisitItemModelPARTYSTATES];
    }
    if(self.pARTYTYPE != nil){
        [aCoder encodeObject:self.pARTYTYPE forKey:kGetPartyVisitItemModelPARTYTYPE];
    }
    if(self.rEACHTHESITUATION != nil){
        [aCoder encodeObject:self.rEACHTHESITUATION forKey:kGetPartyVisitItemModelREACHTHESITUATION];
    }
    if(self.rECOMMENDEDORDER != nil){
        [aCoder encodeObject:self.rECOMMENDEDORDER forKey:kGetPartyVisitItemModelRECOMMENDEDORDER];
    }
    if(self.sINGLESTORESALES != nil){
        [aCoder encodeObject:self.sINGLESTORESALES forKey:kGetPartyVisitItemModelSINGLESTORESALES];
    }
    if(self.uSERNAME != nil){
        [aCoder encodeObject:self.uSERNAME forKey:kGetPartyVisitItemModelUSERNAME];
    }
    if(self.uSERNO != nil){
        [aCoder encodeObject:self.uSERNO forKey:kGetPartyVisitItemModelUSERNO];
    }
    if(self.vISITDATE != nil){
        [aCoder encodeObject:self.vISITDATE forKey:kGetPartyVisitItemModelVISITDATE];
    }
    if(self.vISITIDX != nil){
        [aCoder encodeObject:self.vISITIDX forKey:kGetPartyVisitItemModelVISITIDX];
    }
    if(self.vISITSTATES != nil){
        [aCoder encodeObject:self.vISITSTATES forKey:kGetPartyVisitItemModelVISITSTATES];
    }
    if(self.vIVIDDISPLAYCBX != nil){
        [aCoder encodeObject:self.vIVIDDISPLAYCBX forKey:kGetPartyVisitItemModelVIVIDDISPLAYCBX];
    }
    if(self.vIVIDDISPLAYTEXT != nil){
        [aCoder encodeObject:self.vIVIDDISPLAYTEXT forKey:kGetPartyVisitItemModelVIVIDDISPLAYTEXT];
    }
    if(self.wEEKLYVISITFREQUENCY != nil){
        [aCoder encodeObject:self.wEEKLYVISITFREQUENCY forKey:kGetPartyVisitItemModelWEEKLYVISITFREQUENCY];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aCTUALVISITINGADDRESS = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelACTUALVISITINGADDRESS];
    self.aDDRESSCODE = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelADDRESSCODE];
    self.aDDRESSIDX = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelADDRESSIDX];
    self.aDDDATE = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelADDDATE];
    self.bUSINESSIDX = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelBUSINESSIDX];
    self.cHANNEL = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelCHANNEL];
    self.cHECKINVENTORY = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelCHECKINVENTORY];
    self.cONTACTS = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelCONTACTS];
    self.cONTACTSTEL = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelCONTACTSTEL];
    self.eDITDATE = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelEDITDATE];
    self.fARTHERADDRESSID = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelFARTHERADDRESSID];
    self.fARTHERPARTYID = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelFARTHERPARTYID];
    self.gRADE = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelGRADE];
    self.iDX = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelIDX];
    self.lINE = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelLINE];
    self.nECESSARYSKU = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelNECESSARYSKU];
    self.pARTYADDRESS = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelPARTYADDRESS];
    self.pARTYLEVEL = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelPARTYLEVEL];
    self.pARTYNAME = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelPARTYNAME];
    self.pARTYNO = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelPARTYNO];
    self.pARTYSTATES = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelPARTYSTATES];
    self.pARTYTYPE = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelPARTYTYPE];
    self.rEACHTHESITUATION = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelREACHTHESITUATION];
    self.rECOMMENDEDORDER = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelRECOMMENDEDORDER];
    self.sINGLESTORESALES = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelSINGLESTORESALES];
    self.uSERNAME = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelUSERNAME];
    self.uSERNO = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelUSERNO];
    self.vISITDATE = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelVISITDATE];
    self.vISITIDX = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelVISITIDX];
    self.vISITSTATES = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelVISITSTATES];
    self.vIVIDDISPLAYCBX = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelVIVIDDISPLAYCBX];
    self.vIVIDDISPLAYTEXT = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelVIVIDDISPLAYTEXT];
    self.wEEKLYVISITFREQUENCY = [aDecoder decodeObjectForKey:kGetPartyVisitItemModelWEEKLYVISITFREQUENCY];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    GetPartyVisitItemModel *copy = [GetPartyVisitItemModel new];
    
    copy.aCTUALVISITINGADDRESS = [self.aCTUALVISITINGADDRESS copy];
    copy.aDDRESSCODE = [self.aDDRESSCODE copy];
    copy.aDDRESSIDX = [self.aDDRESSIDX copy];
    copy.aDDDATE = [self.aDDDATE copy];
    copy.bUSINESSIDX = [self.bUSINESSIDX copy];
    copy.cHANNEL = [self.cHANNEL copy];
    copy.cHECKINVENTORY = [self.cHECKINVENTORY copy];
    copy.cONTACTS = [self.cONTACTS copy];
    copy.cONTACTSTEL = [self.cONTACTSTEL copy];
    copy.eDITDATE = [self.eDITDATE copy];
    copy.fARTHERADDRESSID = [self.fARTHERADDRESSID copy];
    copy.fARTHERPARTYID = [self.fARTHERPARTYID copy];
    copy.gRADE = [self.gRADE copy];
    copy.iDX = [self.iDX copy];
    copy.lINE = [self.lINE copy];
    copy.nECESSARYSKU = [self.nECESSARYSKU copy];
    copy.pARTYADDRESS = [self.pARTYADDRESS copy];
    copy.pARTYLEVEL = [self.pARTYLEVEL copy];
    copy.pARTYNAME = [self.pARTYNAME copy];
    copy.pARTYNO = [self.pARTYNO copy];
    copy.pARTYSTATES = [self.pARTYSTATES copy];
    copy.pARTYTYPE = [self.pARTYTYPE copy];
    copy.rEACHTHESITUATION = [self.rEACHTHESITUATION copy];
    copy.rECOMMENDEDORDER = [self.rECOMMENDEDORDER copy];
    copy.sINGLESTORESALES = [self.sINGLESTORESALES copy];
    copy.uSERNAME = [self.uSERNAME copy];
    copy.uSERNO = [self.uSERNO copy];
    copy.vISITDATE = [self.vISITDATE copy];
    copy.vISITIDX = [self.vISITIDX copy];
    copy.vISITSTATES = [self.vISITSTATES copy];
    copy.vIVIDDISPLAYCBX = [self.vIVIDDISPLAYCBX copy];
    copy.vIVIDDISPLAYTEXT = [self.vIVIDDISPLAYTEXT copy];
    copy.wEEKLYVISITFREQUENCY = [self.wEEKLYVISITFREQUENCY copy];
    
    return copy;
}


@end
