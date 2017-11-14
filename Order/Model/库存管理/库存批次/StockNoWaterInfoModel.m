//
//  StockNoWaterInfoModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockNoWaterInfoModel.h"


NSString *const kStockNoWaterInfoModelADDRESSCODE = @"ADDRESS_CODE";
NSString *const kStockNoWaterInfoModelADDRESSIDX = @"ADDRESS_IDX";
NSString *const kStockNoWaterInfoModelADDRESSNAME = @"ADDRESS_NAME";
NSString *const kStockNoWaterInfoModelADDDATE = @"ADD_DATE";
NSString *const kStockNoWaterInfoModelBUSINESSIDX = @"BUSINESS_IDX";
NSString *const kStockNoWaterInfoModelEDITDATE = @"EDIT_DATE";
NSString *const kStockNoWaterInfoModelIDX = @"IDX";
NSString *const kStockNoWaterInfoModelOPERATORNAME = @"OPERATOR_NAME";
NSString *const kStockNoWaterInfoModelPRICE = @"PRICE";
NSString *const kStockNoWaterInfoModelPRODUCTIDX = @"PRODUCT_IDX";
NSString *const kStockNoWaterInfoModelPRODUCTNAME = @"PRODUCT_NAME";
NSString *const kStockNoWaterInfoModelPRODUCTNO = @"PRODUCT_NO";
NSString *const kStockNoWaterInfoModelSTOCKQTY = @"STOCK_QTY";
NSString *const kStockNoWaterInfoModelSTOCKUOM = @"STOCK_UOM";
NSString *const kStockNoWaterInfoModelSUM = @"SUM";


@implementation StockNoWaterInfoModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kStockNoWaterInfoModelADDRESSCODE] isKindOfClass:[NSNull class]]){
        self.aDDRESSCODE = dictionary[kStockNoWaterInfoModelADDRESSCODE];
    }
    if(![dictionary[kStockNoWaterInfoModelADDRESSIDX] isKindOfClass:[NSNull class]]){
        self.aDDRESSIDX = dictionary[kStockNoWaterInfoModelADDRESSIDX];
    }
    if(![dictionary[kStockNoWaterInfoModelADDRESSNAME] isKindOfClass:[NSNull class]]){
        self.aDDRESSNAME = dictionary[kStockNoWaterInfoModelADDRESSNAME];
    }
    if(![dictionary[kStockNoWaterInfoModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kStockNoWaterInfoModelADDDATE];
    }
    if(![dictionary[kStockNoWaterInfoModelBUSINESSIDX] isKindOfClass:[NSNull class]]){
        self.bUSINESSIDX = dictionary[kStockNoWaterInfoModelBUSINESSIDX];
    }
    if(![dictionary[kStockNoWaterInfoModelEDITDATE] isKindOfClass:[NSNull class]]){
        self.eDITDATE = dictionary[kStockNoWaterInfoModelEDITDATE];
    }
    if(![dictionary[kStockNoWaterInfoModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kStockNoWaterInfoModelIDX];
    }
    if(![dictionary[kStockNoWaterInfoModelOPERATORNAME] isKindOfClass:[NSNull class]]){
        self.oPERATORNAME = dictionary[kStockNoWaterInfoModelOPERATORNAME];
    }
    if(![dictionary[kStockNoWaterInfoModelPRICE] isKindOfClass:[NSNull class]]){
        self.pRICE = dictionary[kStockNoWaterInfoModelPRICE];
    }
    if(![dictionary[kStockNoWaterInfoModelPRODUCTIDX] isKindOfClass:[NSNull class]]){
        self.pRODUCTIDX = dictionary[kStockNoWaterInfoModelPRODUCTIDX];
    }
    if(![dictionary[kStockNoWaterInfoModelPRODUCTNAME] isKindOfClass:[NSNull class]]){
        self.pRODUCTNAME = dictionary[kStockNoWaterInfoModelPRODUCTNAME];
    }
    if(![dictionary[kStockNoWaterInfoModelPRODUCTNO] isKindOfClass:[NSNull class]]){
        self.pRODUCTNO = dictionary[kStockNoWaterInfoModelPRODUCTNO];
    }
    if(![dictionary[kStockNoWaterInfoModelSTOCKQTY] isKindOfClass:[NSNull class]]){
        self.sTOCKQTY = dictionary[kStockNoWaterInfoModelSTOCKQTY];
    }
    if(![dictionary[kStockNoWaterInfoModelSTOCKUOM] isKindOfClass:[NSNull class]]){
        self.sTOCKUOM = dictionary[kStockNoWaterInfoModelSTOCKUOM];
    }
    if(![dictionary[kStockNoWaterInfoModelSUM] isKindOfClass:[NSNull class]]){
        self.sUM = dictionary[kStockNoWaterInfoModelSUM];
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
        dictionary[kStockNoWaterInfoModelADDRESSCODE] = self.aDDRESSCODE;
    }
    if(self.aDDRESSIDX != nil){
        dictionary[kStockNoWaterInfoModelADDRESSIDX] = self.aDDRESSIDX;
    }
    if(self.aDDRESSNAME != nil){
        dictionary[kStockNoWaterInfoModelADDRESSNAME] = self.aDDRESSNAME;
    }
    if(self.aDDDATE != nil){
        dictionary[kStockNoWaterInfoModelADDDATE] = self.aDDDATE;
    }
    if(self.bUSINESSIDX != nil){
        dictionary[kStockNoWaterInfoModelBUSINESSIDX] = self.bUSINESSIDX;
    }
    if(self.eDITDATE != nil){
        dictionary[kStockNoWaterInfoModelEDITDATE] = self.eDITDATE;
    }
    if(self.iDX != nil){
        dictionary[kStockNoWaterInfoModelIDX] = self.iDX;
    }
    if(self.oPERATORNAME != nil){
        dictionary[kStockNoWaterInfoModelOPERATORNAME] = self.oPERATORNAME;
    }
    if(self.pRICE != nil){
        dictionary[kStockNoWaterInfoModelPRICE] = self.pRICE;
    }
    if(self.pRODUCTIDX != nil){
        dictionary[kStockNoWaterInfoModelPRODUCTIDX] = self.pRODUCTIDX;
    }
    if(self.pRODUCTNAME != nil){
        dictionary[kStockNoWaterInfoModelPRODUCTNAME] = self.pRODUCTNAME;
    }
    if(self.pRODUCTNO != nil){
        dictionary[kStockNoWaterInfoModelPRODUCTNO] = self.pRODUCTNO;
    }
    if(self.sTOCKQTY != nil){
        dictionary[kStockNoWaterInfoModelSTOCKQTY] = self.sTOCKQTY;
    }
    if(self.sTOCKUOM != nil){
        dictionary[kStockNoWaterInfoModelSTOCKUOM] = self.sTOCKUOM;
    }
    if(self.sUM != nil){
        dictionary[kStockNoWaterInfoModelSUM] = self.sUM;
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
        [aCoder encodeObject:self.aDDRESSCODE forKey:kStockNoWaterInfoModelADDRESSCODE];
    }
    if(self.aDDRESSIDX != nil){
        [aCoder encodeObject:self.aDDRESSIDX forKey:kStockNoWaterInfoModelADDRESSIDX];
    }
    if(self.aDDRESSNAME != nil){
        [aCoder encodeObject:self.aDDRESSNAME forKey:kStockNoWaterInfoModelADDRESSNAME];
    }
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kStockNoWaterInfoModelADDDATE];
    }
    if(self.bUSINESSIDX != nil){
        [aCoder encodeObject:self.bUSINESSIDX forKey:kStockNoWaterInfoModelBUSINESSIDX];
    }
    if(self.eDITDATE != nil){
        [aCoder encodeObject:self.eDITDATE forKey:kStockNoWaterInfoModelEDITDATE];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kStockNoWaterInfoModelIDX];
    }
    if(self.oPERATORNAME != nil){
        [aCoder encodeObject:self.oPERATORNAME forKey:kStockNoWaterInfoModelOPERATORNAME];
    }
    if(self.pRICE != nil){
        [aCoder encodeObject:self.pRICE forKey:kStockNoWaterInfoModelPRICE];
    }
    if(self.pRODUCTIDX != nil){
        [aCoder encodeObject:self.pRODUCTIDX forKey:kStockNoWaterInfoModelPRODUCTIDX];
    }
    if(self.pRODUCTNAME != nil){
        [aCoder encodeObject:self.pRODUCTNAME forKey:kStockNoWaterInfoModelPRODUCTNAME];
    }
    if(self.pRODUCTNO != nil){
        [aCoder encodeObject:self.pRODUCTNO forKey:kStockNoWaterInfoModelPRODUCTNO];
    }
    if(self.sTOCKQTY != nil){
        [aCoder encodeObject:self.sTOCKQTY forKey:kStockNoWaterInfoModelSTOCKQTY];
    }
    if(self.sTOCKUOM != nil){
        [aCoder encodeObject:self.sTOCKUOM forKey:kStockNoWaterInfoModelSTOCKUOM];
    }
    if(self.sUM != nil){
        [aCoder encodeObject:self.sUM forKey:kStockNoWaterInfoModelSUM];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDRESSCODE = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelADDRESSCODE];
    self.aDDRESSIDX = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelADDRESSIDX];
    self.aDDRESSNAME = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelADDRESSNAME];
    self.aDDDATE = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelADDDATE];
    self.bUSINESSIDX = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelBUSINESSIDX];
    self.eDITDATE = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelEDITDATE];
    self.iDX = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelIDX];
    self.oPERATORNAME = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelOPERATORNAME];
    self.pRICE = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelPRICE];
    self.pRODUCTIDX = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelPRODUCTIDX];
    self.pRODUCTNAME = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelPRODUCTNAME];
    self.pRODUCTNO = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelPRODUCTNO];
    self.sTOCKQTY = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelSTOCKQTY];
    self.sTOCKUOM = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelSTOCKUOM];
    self.sUM = [aDecoder decodeObjectForKey:kStockNoWaterInfoModelSUM];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    StockNoWaterInfoModel *copy = [StockNoWaterInfoModel new];
    
    copy.aDDRESSCODE = [self.aDDRESSCODE copy];
    copy.aDDRESSIDX = [self.aDDRESSIDX copy];
    copy.aDDRESSNAME = [self.aDDRESSNAME copy];
    copy.aDDDATE = [self.aDDDATE copy];
    copy.bUSINESSIDX = [self.bUSINESSIDX copy];
    copy.eDITDATE = [self.eDITDATE copy];
    copy.iDX = [self.iDX copy];
    copy.oPERATORNAME = [self.oPERATORNAME copy];
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
