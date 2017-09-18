//
//  StockProductModel.m
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockProductModel.h"


NSString *const kStockProductModelADDRESSCODE = @"ADDRESS_CODE";
NSString *const kStockProductModelADDRESSIDX = @"ADDRESS_IDX";
NSString *const kStockProductModelADDRESSNAME = @"ADDRESS_NAME";
NSString *const kStockProductModelADDDATE = @"ADD_DATE";
NSString *const kStockProductModelBUSINESSIDX = @"BUSINESS_IDX";
NSString *const kStockProductModelEDITDATE = @"EDIT_DATE";
NSString *const kStockProductModelENTIDX = @"ENT_IDX";
NSString *const kStockProductModelIDX = @"IDX";
NSString *const kStockProductModelOPERATORIDX = @"OPERATOR_IDX";
NSString *const kStockProductModelPRICE = @"PRICE";
NSString *const kStockProductModelPRODUCTIDX = @"PRODUCT_IDX";
NSString *const kStockProductModelPRODUCTNAME = @"PRODUCT_NAME";
NSString *const kStockProductModelPRODUCTNO = @"PRODUCT_NO";
NSString *const kStockProductModelSTOCKQTY = @"STOCK_QTY";
NSString *const kStockProductModelSTOCKUOM = @"STOCK_UOM";
NSString *const kStockProductModelSUM = @"SUM";


@implementation StockProductModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kStockProductModelADDRESSCODE] isKindOfClass:[NSNull class]]){
        self.aDDRESSCODE = dictionary[kStockProductModelADDRESSCODE];
    }
    if(![dictionary[kStockProductModelADDRESSIDX] isKindOfClass:[NSNull class]]){
        self.aDDRESSIDX = dictionary[kStockProductModelADDRESSIDX];
    }
    if(![dictionary[kStockProductModelADDRESSNAME] isKindOfClass:[NSNull class]]){
        self.aDDRESSNAME = dictionary[kStockProductModelADDRESSNAME];
    }
    if(![dictionary[kStockProductModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kStockProductModelADDDATE];
    }
    if(![dictionary[kStockProductModelBUSINESSIDX] isKindOfClass:[NSNull class]]){
        self.bUSINESSIDX = dictionary[kStockProductModelBUSINESSIDX];
    }
    if(![dictionary[kStockProductModelEDITDATE] isKindOfClass:[NSNull class]]){
        self.eDITDATE = dictionary[kStockProductModelEDITDATE];
    }
    if(![dictionary[kStockProductModelENTIDX] isKindOfClass:[NSNull class]]){
        self.eNTIDX = dictionary[kStockProductModelENTIDX];
    }
    if(![dictionary[kStockProductModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kStockProductModelIDX];
    }
    if(![dictionary[kStockProductModelOPERATORIDX] isKindOfClass:[NSNull class]]){
        self.oPERATORIDX = dictionary[kStockProductModelOPERATORIDX];
    }
    if(![dictionary[kStockProductModelPRICE] isKindOfClass:[NSNull class]]){
        self.pRICE = dictionary[kStockProductModelPRICE];
    }
    if(![dictionary[kStockProductModelPRODUCTIDX] isKindOfClass:[NSNull class]]){
        self.pRODUCTIDX = dictionary[kStockProductModelPRODUCTIDX];
    }
    if(![dictionary[kStockProductModelPRODUCTNAME] isKindOfClass:[NSNull class]]){
        self.pRODUCTNAME = dictionary[kStockProductModelPRODUCTNAME];
    }
    if(![dictionary[kStockProductModelPRODUCTNO] isKindOfClass:[NSNull class]]){
        self.pRODUCTNO = dictionary[kStockProductModelPRODUCTNO];
    }
    if(![dictionary[kStockProductModelSTOCKQTY] isKindOfClass:[NSNull class]]){
        self.sTOCKQTY = dictionary[kStockProductModelSTOCKQTY];
    }
    if(![dictionary[kStockProductModelSTOCKUOM] isKindOfClass:[NSNull class]]){
        self.sTOCKUOM = dictionary[kStockProductModelSTOCKUOM];
    }
    if(![dictionary[kStockProductModelSUM] isKindOfClass:[NSNull class]]){
        self.sUM = dictionary[kStockProductModelSUM];
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
        dictionary[kStockProductModelADDRESSCODE] = self.aDDRESSCODE;
    }
    if(self.aDDRESSIDX != nil){
        dictionary[kStockProductModelADDRESSIDX] = self.aDDRESSIDX;
    }
    if(self.aDDRESSNAME != nil){
        dictionary[kStockProductModelADDRESSNAME] = self.aDDRESSNAME;
    }
    if(self.aDDDATE != nil){
        dictionary[kStockProductModelADDDATE] = self.aDDDATE;
    }
    if(self.bUSINESSIDX != nil){
        dictionary[kStockProductModelBUSINESSIDX] = self.bUSINESSIDX;
    }
    if(self.eDITDATE != nil){
        dictionary[kStockProductModelEDITDATE] = self.eDITDATE;
    }
    if(self.eNTIDX != nil){
        dictionary[kStockProductModelENTIDX] = self.eNTIDX;
    }
    if(self.iDX != nil){
        dictionary[kStockProductModelIDX] = self.iDX;
    }
    if(self.oPERATORIDX != nil){
        dictionary[kStockProductModelOPERATORIDX] = self.oPERATORIDX;
    }
    if(self.pRICE != nil){
        dictionary[kStockProductModelPRICE] = self.pRICE;
    }
    if(self.pRODUCTIDX != nil){
        dictionary[kStockProductModelPRODUCTIDX] = self.pRODUCTIDX;
    }
    if(self.pRODUCTNAME != nil){
        dictionary[kStockProductModelPRODUCTNAME] = self.pRODUCTNAME;
    }
    if(self.pRODUCTNO != nil){
        dictionary[kStockProductModelPRODUCTNO] = self.pRODUCTNO;
    }
    if(self.sTOCKQTY != nil){
        dictionary[kStockProductModelSTOCKQTY] = self.sTOCKQTY;
    }
    if(self.sTOCKUOM != nil){
        dictionary[kStockProductModelSTOCKUOM] = self.sTOCKUOM;
    }
    if(self.sUM != nil){
        dictionary[kStockProductModelSUM] = self.sUM;
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
        [aCoder encodeObject:self.aDDRESSCODE forKey:kStockProductModelADDRESSCODE];
    }
    if(self.aDDRESSIDX != nil){
        [aCoder encodeObject:self.aDDRESSIDX forKey:kStockProductModelADDRESSIDX];
    }
    if(self.aDDRESSNAME != nil){
        [aCoder encodeObject:self.aDDRESSNAME forKey:kStockProductModelADDRESSNAME];
    }
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kStockProductModelADDDATE];
    }
    if(self.bUSINESSIDX != nil){
        [aCoder encodeObject:self.bUSINESSIDX forKey:kStockProductModelBUSINESSIDX];
    }
    if(self.eDITDATE != nil){
        [aCoder encodeObject:self.eDITDATE forKey:kStockProductModelEDITDATE];
    }
    if(self.eNTIDX != nil){
        [aCoder encodeObject:self.eNTIDX forKey:kStockProductModelENTIDX];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kStockProductModelIDX];
    }
    if(self.oPERATORIDX != nil){
        [aCoder encodeObject:self.oPERATORIDX forKey:kStockProductModelOPERATORIDX];
    }
    if(self.pRICE != nil){
        [aCoder encodeObject:self.pRICE forKey:kStockProductModelPRICE];
    }
    if(self.pRODUCTIDX != nil){
        [aCoder encodeObject:self.pRODUCTIDX forKey:kStockProductModelPRODUCTIDX];
    }
    if(self.pRODUCTNAME != nil){
        [aCoder encodeObject:self.pRODUCTNAME forKey:kStockProductModelPRODUCTNAME];
    }
    if(self.pRODUCTNO != nil){
        [aCoder encodeObject:self.pRODUCTNO forKey:kStockProductModelPRODUCTNO];
    }
    if(self.sTOCKQTY != nil){
        [aCoder encodeObject:self.sTOCKQTY forKey:kStockProductModelSTOCKQTY];
    }
    if(self.sTOCKUOM != nil){
        [aCoder encodeObject:self.sTOCKUOM forKey:kStockProductModelSTOCKUOM];
    }
    if(self.sUM != nil){
        [aCoder encodeObject:self.sUM forKey:kStockProductModelSUM];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDRESSCODE = [aDecoder decodeObjectForKey:kStockProductModelADDRESSCODE];
    self.aDDRESSIDX = [aDecoder decodeObjectForKey:kStockProductModelADDRESSIDX];
    self.aDDRESSNAME = [aDecoder decodeObjectForKey:kStockProductModelADDRESSNAME];
    self.aDDDATE = [aDecoder decodeObjectForKey:kStockProductModelADDDATE];
    self.bUSINESSIDX = [aDecoder decodeObjectForKey:kStockProductModelBUSINESSIDX];
    self.eDITDATE = [aDecoder decodeObjectForKey:kStockProductModelEDITDATE];
    self.eNTIDX = [aDecoder decodeObjectForKey:kStockProductModelENTIDX];
    self.iDX = [aDecoder decodeObjectForKey:kStockProductModelIDX];
    self.oPERATORIDX = [aDecoder decodeObjectForKey:kStockProductModelOPERATORIDX];
    self.pRICE = [aDecoder decodeObjectForKey:kStockProductModelPRICE];
    self.pRODUCTIDX = [aDecoder decodeObjectForKey:kStockProductModelPRODUCTIDX];
    self.pRODUCTNAME = [aDecoder decodeObjectForKey:kStockProductModelPRODUCTNAME];
    self.pRODUCTNO = [aDecoder decodeObjectForKey:kStockProductModelPRODUCTNO];
    self.sTOCKQTY = [aDecoder decodeObjectForKey:kStockProductModelSTOCKQTY];
    self.sTOCKUOM = [aDecoder decodeObjectForKey:kStockProductModelSTOCKUOM];
    self.sUM = [aDecoder decodeObjectForKey:kStockProductModelSUM];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    StockProductModel *copy = [StockProductModel new];
    
    copy.aDDRESSCODE = [self.aDDRESSCODE copy];
    copy.aDDRESSIDX = [self.aDDRESSIDX copy];
    copy.aDDRESSNAME = [self.aDDRESSNAME copy];
    copy.aDDDATE = [self.aDDDATE copy];
    copy.bUSINESSIDX = [self.bUSINESSIDX copy];
    copy.eDITDATE = [self.eDITDATE copy];
    copy.eNTIDX = [self.eNTIDX copy];
    copy.iDX = [self.iDX copy];
    copy.oPERATORIDX = [self.oPERATORIDX copy];
    copy.pRICE = [self.pRICE copy];
    copy.pRODUCTIDX = [self.pRODUCTIDX copy];
    copy.pRODUCTNAME = [self.pRODUCTNAME copy];
    copy.pRODUCTNO = [self.pRODUCTNO copy];
    copy.sTOCKQTY = [self.sTOCKQTY copy];
    copy.sTOCKUOM = [self.sTOCKUOM copy];
    copy.sUM = [self.sUM copy];
    
    return copy;
}

@end
