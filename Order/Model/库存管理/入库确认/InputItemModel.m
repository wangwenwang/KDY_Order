//
//  InputItemModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "InputItemModel.h"


NSString *const kInputItemModelADDDATE = @"ADD_DATE";
NSString *const kInputItemModelBATCHNUMBER = @"BATCH_NUMBER";
NSString *const kInputItemModelEDITDATE = @"EDIT_DATE";
NSString *const kInputItemModelENTIDX = @"ENT_IDX";
NSString *const kInputItemModelIDX = @"IDX";
NSString *const kInputItemModelINPUTIDX = @"INPUT_IDX";
NSString *const kInputItemModelINPUTQTY = @"INPUT_QTY";
NSString *const kInputItemModelINPUTUOM = @"INPUT_UOM";
NSString *const kInputItemModelLINENO = @"LINE_NO";
NSString *const kInputItemModelOPERUSER = @"OPER_USER";
NSString *const kInputItemModelPRICE = @"PRICE";
NSString *const kInputItemModelPRODUCTIONDATE = @"PRODUCTION_DATE";
NSString *const kInputItemModelPRODUCTDESC = @"PRODUCT_DESC";
NSString *const kInputItemModelPRODUCTIDX = @"PRODUCT_IDX";
NSString *const kInputItemModelPRODUCTNAME = @"PRODUCT_NAME";
NSString *const kInputItemModelPRODUCTNO = @"PRODUCT_NO";
NSString *const kInputItemModelPRODUCTSTATE = @"PRODUCT_STATE";
NSString *const kInputItemModelPRODUCTTYPE = @"PRODUCT_TYPE";
NSString *const kInputItemModelPRODUCTVOLUME = @"PRODUCT_VOLUME";
NSString *const kInputItemModelPRODUCTWEIGHT = @"PRODUCT_WEIGHT";
NSString *const kInputItemModelSUM = @"SUM";


@implementation InputItemModel
-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kInputItemModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kInputItemModelADDDATE];
    }
    if(![dictionary[kInputItemModelBATCHNUMBER] isKindOfClass:[NSNull class]]){
        self.bATCHNUMBER = dictionary[kInputItemModelBATCHNUMBER];
    }
    if(![dictionary[kInputItemModelEDITDATE] isKindOfClass:[NSNull class]]){
        self.eDITDATE = dictionary[kInputItemModelEDITDATE];
    }
    if(![dictionary[kInputItemModelENTIDX] isKindOfClass:[NSNull class]]){
        self.eNTIDX = dictionary[kInputItemModelENTIDX];
    }
    if(![dictionary[kInputItemModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kInputItemModelIDX];
    }
    if(![dictionary[kInputItemModelINPUTIDX] isKindOfClass:[NSNull class]]){
        self.iNPUTIDX = dictionary[kInputItemModelINPUTIDX];
    }
    if(![dictionary[kInputItemModelINPUTQTY] isKindOfClass:[NSNull class]]){
        self.iNPUTQTY = dictionary[kInputItemModelINPUTQTY];
    }
    if(![dictionary[kInputItemModelINPUTUOM] isKindOfClass:[NSNull class]]){
        self.iNPUTUOM = dictionary[kInputItemModelINPUTUOM];
    }
    if(![dictionary[kInputItemModelLINENO] isKindOfClass:[NSNull class]]){
        self.lINENO = dictionary[kInputItemModelLINENO];
    }
    if(![dictionary[kInputItemModelOPERUSER] isKindOfClass:[NSNull class]]){
        self.oPERUSER = dictionary[kInputItemModelOPERUSER];
    }
    if(![dictionary[kInputItemModelPRICE] isKindOfClass:[NSNull class]]){
        self.pRICE = dictionary[kInputItemModelPRICE];
    }
    if(![dictionary[kInputItemModelPRODUCTIONDATE] isKindOfClass:[NSNull class]]){
        self.pRODUCTIONDATE = dictionary[kInputItemModelPRODUCTIONDATE];
    }
    if(![dictionary[kInputItemModelPRODUCTDESC] isKindOfClass:[NSNull class]]){
        self.pRODUCTDESC = dictionary[kInputItemModelPRODUCTDESC];
    }
    if(![dictionary[kInputItemModelPRODUCTIDX] isKindOfClass:[NSNull class]]){
        self.pRODUCTIDX = dictionary[kInputItemModelPRODUCTIDX];
    }
    if(![dictionary[kInputItemModelPRODUCTNAME] isKindOfClass:[NSNull class]]){
        self.pRODUCTNAME = dictionary[kInputItemModelPRODUCTNAME];
    }
    if(![dictionary[kInputItemModelPRODUCTNO] isKindOfClass:[NSNull class]]){
        self.pRODUCTNO = dictionary[kInputItemModelPRODUCTNO];
    }
    if(![dictionary[kInputItemModelPRODUCTSTATE] isKindOfClass:[NSNull class]]){
        self.pRODUCTSTATE = dictionary[kInputItemModelPRODUCTSTATE];
    }
    if(![dictionary[kInputItemModelPRODUCTTYPE] isKindOfClass:[NSNull class]]){
        self.pRODUCTTYPE = dictionary[kInputItemModelPRODUCTTYPE];
    }
    if(![dictionary[kInputItemModelPRODUCTVOLUME] isKindOfClass:[NSNull class]]){
        self.pRODUCTVOLUME = dictionary[kInputItemModelPRODUCTVOLUME];
    }
    if(![dictionary[kInputItemModelPRODUCTWEIGHT] isKindOfClass:[NSNull class]]){
        self.pRODUCTWEIGHT = dictionary[kInputItemModelPRODUCTWEIGHT];
    }
    if(![dictionary[kInputItemModelSUM] isKindOfClass:[NSNull class]]){
        self.sUM = dictionary[kInputItemModelSUM];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aDDDATE != nil){
        dictionary[kInputItemModelADDDATE] = self.aDDDATE;
    }
    if(self.bATCHNUMBER != nil){
        dictionary[kInputItemModelBATCHNUMBER] = self.bATCHNUMBER;
    }
    if(self.eDITDATE != nil){
        dictionary[kInputItemModelEDITDATE] = self.eDITDATE;
    }
    if(self.eNTIDX != nil){
        dictionary[kInputItemModelENTIDX] = self.eNTIDX;
    }
    if(self.iDX != nil){
        dictionary[kInputItemModelIDX] = self.iDX;
    }
    if(self.iNPUTIDX != nil){
        dictionary[kInputItemModelINPUTIDX] = self.iNPUTIDX;
    }
    if(self.iNPUTQTY != nil){
        dictionary[kInputItemModelINPUTQTY] = self.iNPUTQTY;
    }
    if(self.iNPUTUOM != nil){
        dictionary[kInputItemModelINPUTUOM] = self.iNPUTUOM;
    }
    if(self.lINENO != nil){
        dictionary[kInputItemModelLINENO] = self.lINENO;
    }
    if(self.oPERUSER != nil){
        dictionary[kInputItemModelOPERUSER] = self.oPERUSER;
    }
    if(self.pRICE != nil){
        dictionary[kInputItemModelPRICE] = self.pRICE;
    }
    if(self.pRODUCTIONDATE != nil){
        dictionary[kInputItemModelPRODUCTIONDATE] = self.pRODUCTIONDATE;
    }
    if(self.pRODUCTDESC != nil){
        dictionary[kInputItemModelPRODUCTDESC] = self.pRODUCTDESC;
    }
    if(self.pRODUCTIDX != nil){
        dictionary[kInputItemModelPRODUCTIDX] = self.pRODUCTIDX;
    }
    if(self.pRODUCTNAME != nil){
        dictionary[kInputItemModelPRODUCTNAME] = self.pRODUCTNAME;
    }
    if(self.pRODUCTNO != nil){
        dictionary[kInputItemModelPRODUCTNO] = self.pRODUCTNO;
    }
    if(self.pRODUCTSTATE != nil){
        dictionary[kInputItemModelPRODUCTSTATE] = self.pRODUCTSTATE;
    }
    if(self.pRODUCTTYPE != nil){
        dictionary[kInputItemModelPRODUCTTYPE] = self.pRODUCTTYPE;
    }
    if(self.pRODUCTVOLUME != nil){
        dictionary[kInputItemModelPRODUCTVOLUME] = self.pRODUCTVOLUME;
    }
    if(self.pRODUCTWEIGHT != nil){
        dictionary[kInputItemModelPRODUCTWEIGHT] = self.pRODUCTWEIGHT;
    }
    if(self.sUM != nil){
        dictionary[kInputItemModelSUM] = self.sUM;
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
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kInputItemModelADDDATE];
    }
    if(self.bATCHNUMBER != nil){
        [aCoder encodeObject:self.bATCHNUMBER forKey:kInputItemModelBATCHNUMBER];
    }
    if(self.eDITDATE != nil){
        [aCoder encodeObject:self.eDITDATE forKey:kInputItemModelEDITDATE];
    }
    if(self.eNTIDX != nil){
        [aCoder encodeObject:self.eNTIDX forKey:kInputItemModelENTIDX];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kInputItemModelIDX];
    }
    if(self.iNPUTIDX != nil){
        [aCoder encodeObject:self.iNPUTIDX forKey:kInputItemModelINPUTIDX];
    }
    if(self.iNPUTQTY != nil){
        [aCoder encodeObject:self.iNPUTQTY forKey:kInputItemModelINPUTQTY];
    }
    if(self.iNPUTUOM != nil){
        [aCoder encodeObject:self.iNPUTUOM forKey:kInputItemModelINPUTUOM];
    }
    if(self.lINENO != nil){
        [aCoder encodeObject:self.lINENO forKey:kInputItemModelLINENO];
    }
    if(self.oPERUSER != nil){
        [aCoder encodeObject:self.oPERUSER forKey:kInputItemModelOPERUSER];
    }
    if(self.pRICE != nil){
        [aCoder encodeObject:self.pRICE forKey:kInputItemModelPRICE];
    }
    if(self.pRODUCTIONDATE != nil){
        [aCoder encodeObject:self.pRODUCTIONDATE forKey:kInputItemModelPRODUCTIONDATE];
    }
    if(self.pRODUCTDESC != nil){
        [aCoder encodeObject:self.pRODUCTDESC forKey:kInputItemModelPRODUCTDESC];
    }
    if(self.pRODUCTIDX != nil){
        [aCoder encodeObject:self.pRODUCTIDX forKey:kInputItemModelPRODUCTIDX];
    }
    if(self.pRODUCTNAME != nil){
        [aCoder encodeObject:self.pRODUCTNAME forKey:kInputItemModelPRODUCTNAME];
    }
    if(self.pRODUCTNO != nil){
        [aCoder encodeObject:self.pRODUCTNO forKey:kInputItemModelPRODUCTNO];
    }
    if(self.pRODUCTSTATE != nil){
        [aCoder encodeObject:self.pRODUCTSTATE forKey:kInputItemModelPRODUCTSTATE];
    }
    if(self.pRODUCTTYPE != nil){
        [aCoder encodeObject:self.pRODUCTTYPE forKey:kInputItemModelPRODUCTTYPE];
    }
    if(self.pRODUCTVOLUME != nil){
        [aCoder encodeObject:self.pRODUCTVOLUME forKey:kInputItemModelPRODUCTVOLUME];
    }
    if(self.pRODUCTWEIGHT != nil){
        [aCoder encodeObject:self.pRODUCTWEIGHT forKey:kInputItemModelPRODUCTWEIGHT];
    }
    if(self.sUM != nil){
        [aCoder encodeObject:self.sUM forKey:kInputItemModelSUM];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDDATE = [aDecoder decodeObjectForKey:kInputItemModelADDDATE];
    self.bATCHNUMBER = [aDecoder decodeObjectForKey:kInputItemModelBATCHNUMBER];
    self.eDITDATE = [aDecoder decodeObjectForKey:kInputItemModelEDITDATE];
    self.eNTIDX = [aDecoder decodeObjectForKey:kInputItemModelENTIDX];
    self.iDX = [aDecoder decodeObjectForKey:kInputItemModelIDX];
    self.iNPUTIDX = [aDecoder decodeObjectForKey:kInputItemModelINPUTIDX];
    self.iNPUTQTY = [aDecoder decodeObjectForKey:kInputItemModelINPUTQTY];
    self.iNPUTUOM = [aDecoder decodeObjectForKey:kInputItemModelINPUTUOM];
    self.lINENO = [aDecoder decodeObjectForKey:kInputItemModelLINENO];
    self.oPERUSER = [aDecoder decodeObjectForKey:kInputItemModelOPERUSER];
    self.pRICE = [aDecoder decodeObjectForKey:kInputItemModelPRICE];
    self.pRODUCTIONDATE = [aDecoder decodeObjectForKey:kInputItemModelPRODUCTIONDATE];
    self.pRODUCTDESC = [aDecoder decodeObjectForKey:kInputItemModelPRODUCTDESC];
    self.pRODUCTIDX = [aDecoder decodeObjectForKey:kInputItemModelPRODUCTIDX];
    self.pRODUCTNAME = [aDecoder decodeObjectForKey:kInputItemModelPRODUCTNAME];
    self.pRODUCTNO = [aDecoder decodeObjectForKey:kInputItemModelPRODUCTNO];
    self.pRODUCTSTATE = [aDecoder decodeObjectForKey:kInputItemModelPRODUCTSTATE];
    self.pRODUCTTYPE = [aDecoder decodeObjectForKey:kInputItemModelPRODUCTTYPE];
    self.pRODUCTVOLUME = [aDecoder decodeObjectForKey:kInputItemModelPRODUCTVOLUME];
    self.pRODUCTWEIGHT = [aDecoder decodeObjectForKey:kInputItemModelPRODUCTWEIGHT];
    self.sUM = [aDecoder decodeObjectForKey:kInputItemModelSUM];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    InputItemModel *copy = [InputItemModel new];
    
    copy.aDDDATE = [self.aDDDATE copy];
    copy.bATCHNUMBER = [self.bATCHNUMBER copy];
    copy.eDITDATE = [self.eDITDATE copy];
    copy.eNTIDX = [self.eNTIDX copy];
    copy.iDX = [self.iDX copy];
    copy.iNPUTIDX = [self.iNPUTIDX copy];
    copy.iNPUTQTY = [self.iNPUTQTY copy];
    copy.iNPUTUOM = [self.iNPUTUOM copy];
    copy.lINENO = [self.lINENO copy];
    copy.oPERUSER = [self.oPERUSER copy];
    copy.pRICE = [self.pRICE copy];
    copy.pRODUCTIONDATE = [self.pRODUCTIONDATE copy];
    copy.pRODUCTDESC = [self.pRODUCTDESC copy];
    copy.pRODUCTIDX = [self.pRODUCTIDX copy];
    copy.pRODUCTNAME = [self.pRODUCTNAME copy];
    copy.pRODUCTNO = [self.pRODUCTNO copy];
    copy.pRODUCTSTATE = [self.pRODUCTSTATE copy];
    copy.pRODUCTTYPE = [self.pRODUCTTYPE copy];
    copy.pRODUCTVOLUME = [self.pRODUCTVOLUME copy];
    copy.pRODUCTWEIGHT = [self.pRODUCTWEIGHT copy];
    copy.sUM = [self.sUM copy];
    
    return copy;
}

@end
