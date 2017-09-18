//
//  StockNoInfoModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockNoInfoModel.h"


NSString *const kStockNoInfoModelADDRESSCODE = @"ADDRESS_CODE";
NSString *const kStockNoInfoModelADDRESSIDX = @"ADDRESS_IDX";
NSString *const kStockNoInfoModelADDRESSNAME = @"ADDRESS_NAME";
NSString *const kStockNoInfoModelADDDATE = @"ADD_DATE";
NSString *const kStockNoInfoModelBUSINESSIDX = @"BUSINESS_IDX";
NSString *const kStockNoInfoModelEDITDATE = @"EDIT_DATE";
NSString *const kStockNoInfoModelIDX = @"IDX";
NSString *const kStockNoInfoModelOPERATORNAME = @"OPERATOR_NAME";
NSString *const kStockNoInfoModelPRICE = @"PRICE";
NSString *const kStockNoInfoModelPRODUCTIDX = @"PRODUCT_IDX";
NSString *const kStockNoInfoModelPRODUCTNAME = @"PRODUCT_NAME";
NSString *const kStockNoInfoModelPRODUCTNO = @"PRODUCT_NO";
NSString *const kStockNoInfoModelSTOCKQTY = @"STOCK_QTY";
NSString *const kStockNoInfoModelSTOCKUOM = @"STOCK_UOM";
NSString *const kStockNoInfoModelSUM = @"SUM";


@implementation StockNoInfoModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kStockNoInfoModelADDRESSCODE] isKindOfClass:[NSNull class]]){
        self.aDDRESSCODE = dictionary[kStockNoInfoModelADDRESSCODE];
    }
    if(![dictionary[kStockNoInfoModelADDRESSIDX] isKindOfClass:[NSNull class]]){
        self.aDDRESSIDX = dictionary[kStockNoInfoModelADDRESSIDX];
    }
    if(![dictionary[kStockNoInfoModelADDRESSNAME] isKindOfClass:[NSNull class]]){
        self.aDDRESSNAME = dictionary[kStockNoInfoModelADDRESSNAME];
    }
    if(![dictionary[kStockNoInfoModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kStockNoInfoModelADDDATE];
    }
    if(![dictionary[kStockNoInfoModelBUSINESSIDX] isKindOfClass:[NSNull class]]){
        self.bUSINESSIDX = dictionary[kStockNoInfoModelBUSINESSIDX];
    }
    if(![dictionary[kStockNoInfoModelEDITDATE] isKindOfClass:[NSNull class]]){
        self.eDITDATE = dictionary[kStockNoInfoModelEDITDATE];
    }
    if(![dictionary[kStockNoInfoModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kStockNoInfoModelIDX];
    }
    if(![dictionary[kStockNoInfoModelOPERATORNAME] isKindOfClass:[NSNull class]]){
        self.oPERATORNAME = dictionary[kStockNoInfoModelOPERATORNAME];
    }
    if(![dictionary[kStockNoInfoModelPRICE] isKindOfClass:[NSNull class]]){
        self.pRICE = dictionary[kStockNoInfoModelPRICE];
    }
    if(![dictionary[kStockNoInfoModelPRODUCTIDX] isKindOfClass:[NSNull class]]){
        self.pRODUCTIDX = dictionary[kStockNoInfoModelPRODUCTIDX];
    }
    if(![dictionary[kStockNoInfoModelPRODUCTNAME] isKindOfClass:[NSNull class]]){
        self.pRODUCTNAME = dictionary[kStockNoInfoModelPRODUCTNAME];
    }
    if(![dictionary[kStockNoInfoModelPRODUCTNO] isKindOfClass:[NSNull class]]){
        self.pRODUCTNO = dictionary[kStockNoInfoModelPRODUCTNO];
    }
    if(![dictionary[kStockNoInfoModelSTOCKQTY] isKindOfClass:[NSNull class]]){
        self.sTOCKQTY = dictionary[kStockNoInfoModelSTOCKQTY];
    }
    if(![dictionary[kStockNoInfoModelSTOCKUOM] isKindOfClass:[NSNull class]]){
        self.sTOCKUOM = dictionary[kStockNoInfoModelSTOCKUOM];
    }
    if(![dictionary[kStockNoInfoModelSUM] isKindOfClass:[NSNull class]]){
        self.sUM = dictionary[kStockNoInfoModelSUM];
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
        dictionary[kStockNoInfoModelADDRESSCODE] = self.aDDRESSCODE;
    }
    if(self.aDDRESSIDX != nil){
        dictionary[kStockNoInfoModelADDRESSIDX] = self.aDDRESSIDX;
    }
    if(self.aDDRESSNAME != nil){
        dictionary[kStockNoInfoModelADDRESSNAME] = self.aDDRESSNAME;
    }
    if(self.aDDDATE != nil){
        dictionary[kStockNoInfoModelADDDATE] = self.aDDDATE;
    }
    if(self.bUSINESSIDX != nil){
        dictionary[kStockNoInfoModelBUSINESSIDX] = self.bUSINESSIDX;
    }
    if(self.eDITDATE != nil){
        dictionary[kStockNoInfoModelEDITDATE] = self.eDITDATE;
    }
    if(self.iDX != nil){
        dictionary[kStockNoInfoModelIDX] = self.iDX;
    }
    if(self.oPERATORNAME != nil){
        dictionary[kStockNoInfoModelOPERATORNAME] = self.oPERATORNAME;
    }
    if(self.pRICE != nil){
        dictionary[kStockNoInfoModelPRICE] = self.pRICE;
    }
    if(self.pRODUCTIDX != nil){
        dictionary[kStockNoInfoModelPRODUCTIDX] = self.pRODUCTIDX;
    }
    if(self.pRODUCTNAME != nil){
        dictionary[kStockNoInfoModelPRODUCTNAME] = self.pRODUCTNAME;
    }
    if(self.pRODUCTNO != nil){
        dictionary[kStockNoInfoModelPRODUCTNO] = self.pRODUCTNO;
    }
    if(self.sTOCKQTY != nil){
        dictionary[kStockNoInfoModelSTOCKQTY] = self.sTOCKQTY;
    }
    if(self.sTOCKUOM != nil){
        dictionary[kStockNoInfoModelSTOCKUOM] = self.sTOCKUOM;
    }
    if(self.sUM != nil){
        dictionary[kStockNoInfoModelSUM] = self.sUM;
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
        [aCoder encodeObject:self.aDDRESSCODE forKey:kStockNoInfoModelADDRESSCODE];
    }
    if(self.aDDRESSIDX != nil){
        [aCoder encodeObject:self.aDDRESSIDX forKey:kStockNoInfoModelADDRESSIDX];
    }
    if(self.aDDRESSNAME != nil){
        [aCoder encodeObject:self.aDDRESSNAME forKey:kStockNoInfoModelADDRESSNAME];
    }
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kStockNoInfoModelADDDATE];
    }
    if(self.bUSINESSIDX != nil){
        [aCoder encodeObject:self.bUSINESSIDX forKey:kStockNoInfoModelBUSINESSIDX];
    }
    if(self.eDITDATE != nil){
        [aCoder encodeObject:self.eDITDATE forKey:kStockNoInfoModelEDITDATE];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kStockNoInfoModelIDX];
    }
    if(self.oPERATORNAME != nil){
        [aCoder encodeObject:self.oPERATORNAME forKey:kStockNoInfoModelOPERATORNAME];
    }
    if(self.pRICE != nil){
        [aCoder encodeObject:self.pRICE forKey:kStockNoInfoModelPRICE];
    }
    if(self.pRODUCTIDX != nil){
        [aCoder encodeObject:self.pRODUCTIDX forKey:kStockNoInfoModelPRODUCTIDX];
    }
    if(self.pRODUCTNAME != nil){
        [aCoder encodeObject:self.pRODUCTNAME forKey:kStockNoInfoModelPRODUCTNAME];
    }
    if(self.pRODUCTNO != nil){
        [aCoder encodeObject:self.pRODUCTNO forKey:kStockNoInfoModelPRODUCTNO];
    }
    if(self.sTOCKQTY != nil){
        [aCoder encodeObject:self.sTOCKQTY forKey:kStockNoInfoModelSTOCKQTY];
    }
    if(self.sTOCKUOM != nil){
        [aCoder encodeObject:self.sTOCKUOM forKey:kStockNoInfoModelSTOCKUOM];
    }
    if(self.sUM != nil){
        [aCoder encodeObject:self.sUM forKey:kStockNoInfoModelSUM];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDRESSCODE = [aDecoder decodeObjectForKey:kStockNoInfoModelADDRESSCODE];
    self.aDDRESSIDX = [aDecoder decodeObjectForKey:kStockNoInfoModelADDRESSIDX];
    self.aDDRESSNAME = [aDecoder decodeObjectForKey:kStockNoInfoModelADDRESSNAME];
    self.aDDDATE = [aDecoder decodeObjectForKey:kStockNoInfoModelADDDATE];
    self.bUSINESSIDX = [aDecoder decodeObjectForKey:kStockNoInfoModelBUSINESSIDX];
    self.eDITDATE = [aDecoder decodeObjectForKey:kStockNoInfoModelEDITDATE];
    self.iDX = [aDecoder decodeObjectForKey:kStockNoInfoModelIDX];
    self.oPERATORNAME = [aDecoder decodeObjectForKey:kStockNoInfoModelOPERATORNAME];
    self.pRICE = [aDecoder decodeObjectForKey:kStockNoInfoModelPRICE];
    self.pRODUCTIDX = [aDecoder decodeObjectForKey:kStockNoInfoModelPRODUCTIDX];
    self.pRODUCTNAME = [aDecoder decodeObjectForKey:kStockNoInfoModelPRODUCTNAME];
    self.pRODUCTNO = [aDecoder decodeObjectForKey:kStockNoInfoModelPRODUCTNO];
    self.sTOCKQTY = [aDecoder decodeObjectForKey:kStockNoInfoModelSTOCKQTY];
    self.sTOCKUOM = [aDecoder decodeObjectForKey:kStockNoInfoModelSTOCKUOM];
    self.sUM = [aDecoder decodeObjectForKey:kStockNoInfoModelSUM];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    StockNoInfoModel *copy = [StockNoInfoModel new];
    
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
