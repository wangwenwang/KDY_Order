//
//  StockNoItemModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockNoItemModel.h"


NSString *const kStockNoItemModelABWORKFLOW = @"AB_WORKFLOW";
NSString *const kStockNoItemModelADDRESSCODE = @"ADDRESS_CODE";
NSString *const kStockNoItemModelADDRESSIDX = @"ADDRESS_IDX";
NSString *const kStockNoItemModelADDRESSNAME = @"ADDRESS_NAME";
NSString *const kStockNoItemModelADDDATE = @"ADD_DATE";
NSString *const kStockNoItemModelBATCHNUMBER = @"BATCH_NUMBER";
NSString *const kStockNoItemModelBUSINESSIDX = @"BUSINESS_IDX";
NSString *const kStockNoItemModelEDITDATE = @"EDIT_DATE";
NSString *const kStockNoItemModelIDX = @"IDX";
NSString *const kStockNoItemModelLINENO = @"LINE_NO";
NSString *const kStockNoItemModelOPERATORNAME = @"OPERATOR_NAME";
NSString *const kStockNoItemModelPRICE = @"PRICE";
NSString *const kStockNoItemModelPRODUCTIDX = @"PRODUCT_IDX";
NSString *const kStockNoItemModelPRODUCTNAME = @"PRODUCT_NAME";
NSString *const kStockNoItemModelPRODUCTNO = @"PRODUCT_NO";
NSString *const kStockNoItemModelPRODUCTSTATE = @"PRODUCT_STATE";
NSString *const kStockNoItemModelSTOCKNO = @"STOCK_NO";
NSString *const kStockNoItemModelSTOCKQTY = @"STOCK_QTY";
NSString *const kStockNoItemModelSTOCKUOM = @"STOCK_UOM";
NSString *const kStockNoItemModelSUM = @"SUM";


@implementation StockNoItemModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kStockNoItemModelABWORKFLOW] isKindOfClass:[NSNull class]]){
        self.aBWORKFLOW = dictionary[kStockNoItemModelABWORKFLOW];
    }
    if(![dictionary[kStockNoItemModelADDRESSCODE] isKindOfClass:[NSNull class]]){
        self.aDDRESSCODE = dictionary[kStockNoItemModelADDRESSCODE];
    }
    if(![dictionary[kStockNoItemModelADDRESSIDX] isKindOfClass:[NSNull class]]){
        self.aDDRESSIDX = dictionary[kStockNoItemModelADDRESSIDX];
    }
    if(![dictionary[kStockNoItemModelADDRESSNAME] isKindOfClass:[NSNull class]]){
        self.aDDRESSNAME = dictionary[kStockNoItemModelADDRESSNAME];
    }
    if(![dictionary[kStockNoItemModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kStockNoItemModelADDDATE];
    }
    if(![dictionary[kStockNoItemModelBATCHNUMBER] isKindOfClass:[NSNull class]]){
        self.bATCHNUMBER = dictionary[kStockNoItemModelBATCHNUMBER];
    }
    if(![dictionary[kStockNoItemModelBUSINESSIDX] isKindOfClass:[NSNull class]]){
        self.bUSINESSIDX = dictionary[kStockNoItemModelBUSINESSIDX];
    }
    if(![dictionary[kStockNoItemModelEDITDATE] isKindOfClass:[NSNull class]]){
        self.eDITDATE = dictionary[kStockNoItemModelEDITDATE];
    }
    if(![dictionary[kStockNoItemModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kStockNoItemModelIDX];
    }
    if(![dictionary[kStockNoItemModelLINENO] isKindOfClass:[NSNull class]]){
        self.lINENO = dictionary[kStockNoItemModelLINENO];
    }
    if(![dictionary[kStockNoItemModelOPERATORNAME] isKindOfClass:[NSNull class]]){
        self.oPERATORNAME = dictionary[kStockNoItemModelOPERATORNAME];
    }
    if(![dictionary[kStockNoItemModelPRICE] isKindOfClass:[NSNull class]]){
        self.pRICE = dictionary[kStockNoItemModelPRICE];
    }
    if(![dictionary[kStockNoItemModelPRODUCTIDX] isKindOfClass:[NSNull class]]){
        self.pRODUCTIDX = dictionary[kStockNoItemModelPRODUCTIDX];
    }
    if(![dictionary[kStockNoItemModelPRODUCTNAME] isKindOfClass:[NSNull class]]){
        self.pRODUCTNAME = dictionary[kStockNoItemModelPRODUCTNAME];
    }
    if(![dictionary[kStockNoItemModelPRODUCTNO] isKindOfClass:[NSNull class]]){
        self.pRODUCTNO = dictionary[kStockNoItemModelPRODUCTNO];
    }
    if(![dictionary[kStockNoItemModelPRODUCTSTATE] isKindOfClass:[NSNull class]]){
        self.pRODUCTSTATE = dictionary[kStockNoItemModelPRODUCTSTATE];
    }
    if(![dictionary[kStockNoItemModelSTOCKNO] isKindOfClass:[NSNull class]]){
        self.sTOCKNO = dictionary[kStockNoItemModelSTOCKNO];
    }
    if(![dictionary[kStockNoItemModelSTOCKQTY] isKindOfClass:[NSNull class]]){
        self.sTOCKQTY = dictionary[kStockNoItemModelSTOCKQTY];
    }
    if(![dictionary[kStockNoItemModelSTOCKUOM] isKindOfClass:[NSNull class]]){
        self.sTOCKUOM = dictionary[kStockNoItemModelSTOCKUOM];
    }
    if(![dictionary[kStockNoItemModelSUM] isKindOfClass:[NSNull class]]){
        self.sUM = dictionary[kStockNoItemModelSUM];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aBWORKFLOW != nil){
        dictionary[kStockNoItemModelABWORKFLOW] = self.aBWORKFLOW;
    }
    if(self.aDDRESSCODE != nil){
        dictionary[kStockNoItemModelADDRESSCODE] = self.aDDRESSCODE;
    }
    if(self.aDDRESSIDX != nil){
        dictionary[kStockNoItemModelADDRESSIDX] = self.aDDRESSIDX;
    }
    if(self.aDDRESSNAME != nil){
        dictionary[kStockNoItemModelADDRESSNAME] = self.aDDRESSNAME;
    }
    if(self.aDDDATE != nil){
        dictionary[kStockNoItemModelADDDATE] = self.aDDDATE;
    }
    if(self.bATCHNUMBER != nil){
        dictionary[kStockNoItemModelBATCHNUMBER] = self.bATCHNUMBER;
    }
    if(self.bUSINESSIDX != nil){
        dictionary[kStockNoItemModelBUSINESSIDX] = self.bUSINESSIDX;
    }
    if(self.eDITDATE != nil){
        dictionary[kStockNoItemModelEDITDATE] = self.eDITDATE;
    }
    if(self.iDX != nil){
        dictionary[kStockNoItemModelIDX] = self.iDX;
    }
    if(self.lINENO != nil){
        dictionary[kStockNoItemModelLINENO] = self.lINENO;
    }
    if(self.oPERATORNAME != nil){
        dictionary[kStockNoItemModelOPERATORNAME] = self.oPERATORNAME;
    }
    if(self.pRICE != nil){
        dictionary[kStockNoItemModelPRICE] = self.pRICE;
    }
    if(self.pRODUCTIDX != nil){
        dictionary[kStockNoItemModelPRODUCTIDX] = self.pRODUCTIDX;
    }
    if(self.pRODUCTNAME != nil){
        dictionary[kStockNoItemModelPRODUCTNAME] = self.pRODUCTNAME;
    }
    if(self.pRODUCTNO != nil){
        dictionary[kStockNoItemModelPRODUCTNO] = self.pRODUCTNO;
    }
    if(self.pRODUCTSTATE != nil){
        dictionary[kStockNoItemModelPRODUCTSTATE] = self.pRODUCTSTATE;
    }
    if(self.sTOCKNO != nil){
        dictionary[kStockNoItemModelSTOCKNO] = self.sTOCKNO;
    }
    if(self.sTOCKQTY != nil){
        dictionary[kStockNoItemModelSTOCKQTY] = self.sTOCKQTY;
    }
    if(self.sTOCKUOM != nil){
        dictionary[kStockNoItemModelSTOCKUOM] = self.sTOCKUOM;
    }
    if(self.sUM != nil){
        dictionary[kStockNoItemModelSUM] = self.sUM;
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
    if(self.aBWORKFLOW != nil){
        [aCoder encodeObject:self.aBWORKFLOW forKey:kStockNoItemModelABWORKFLOW];
    }
    if(self.aDDRESSCODE != nil){
        [aCoder encodeObject:self.aDDRESSCODE forKey:kStockNoItemModelADDRESSCODE];
    }
    if(self.aDDRESSIDX != nil){
        [aCoder encodeObject:self.aDDRESSIDX forKey:kStockNoItemModelADDRESSIDX];
    }
    if(self.aDDRESSNAME != nil){
        [aCoder encodeObject:self.aDDRESSNAME forKey:kStockNoItemModelADDRESSNAME];
    }
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kStockNoItemModelADDDATE];
    }
    if(self.bATCHNUMBER != nil){
        [aCoder encodeObject:self.bATCHNUMBER forKey:kStockNoItemModelBATCHNUMBER];
    }
    if(self.bUSINESSIDX != nil){
        [aCoder encodeObject:self.bUSINESSIDX forKey:kStockNoItemModelBUSINESSIDX];
    }
    if(self.eDITDATE != nil){
        [aCoder encodeObject:self.eDITDATE forKey:kStockNoItemModelEDITDATE];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kStockNoItemModelIDX];
    }
    if(self.lINENO != nil){
        [aCoder encodeObject:self.lINENO forKey:kStockNoItemModelLINENO];
    }
    if(self.oPERATORNAME != nil){
        [aCoder encodeObject:self.oPERATORNAME forKey:kStockNoItemModelOPERATORNAME];
    }
    if(self.pRICE != nil){
        [aCoder encodeObject:self.pRICE forKey:kStockNoItemModelPRICE];
    }
    if(self.pRODUCTIDX != nil){
        [aCoder encodeObject:self.pRODUCTIDX forKey:kStockNoItemModelPRODUCTIDX];
    }
    if(self.pRODUCTNAME != nil){
        [aCoder encodeObject:self.pRODUCTNAME forKey:kStockNoItemModelPRODUCTNAME];
    }
    if(self.pRODUCTNO != nil){
        [aCoder encodeObject:self.pRODUCTNO forKey:kStockNoItemModelPRODUCTNO];
    }
    if(self.pRODUCTSTATE != nil){
        [aCoder encodeObject:self.pRODUCTSTATE forKey:kStockNoItemModelPRODUCTSTATE];
    }
    if(self.sTOCKNO != nil){
        [aCoder encodeObject:self.sTOCKNO forKey:kStockNoItemModelSTOCKNO];
    }
    if(self.sTOCKQTY != nil){
        [aCoder encodeObject:self.sTOCKQTY forKey:kStockNoItemModelSTOCKQTY];
    }
    if(self.sTOCKUOM != nil){
        [aCoder encodeObject:self.sTOCKUOM forKey:kStockNoItemModelSTOCKUOM];
    }
    if(self.sUM != nil){
        [aCoder encodeObject:self.sUM forKey:kStockNoItemModelSUM];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aBWORKFLOW = [aDecoder decodeObjectForKey:kStockNoItemModelABWORKFLOW];
    self.aDDRESSCODE = [aDecoder decodeObjectForKey:kStockNoItemModelADDRESSCODE];
    self.aDDRESSIDX = [aDecoder decodeObjectForKey:kStockNoItemModelADDRESSIDX];
    self.aDDRESSNAME = [aDecoder decodeObjectForKey:kStockNoItemModelADDRESSNAME];
    self.aDDDATE = [aDecoder decodeObjectForKey:kStockNoItemModelADDDATE];
    self.bATCHNUMBER = [aDecoder decodeObjectForKey:kStockNoItemModelBATCHNUMBER];
    self.bUSINESSIDX = [aDecoder decodeObjectForKey:kStockNoItemModelBUSINESSIDX];
    self.eDITDATE = [aDecoder decodeObjectForKey:kStockNoItemModelEDITDATE];
    self.iDX = [aDecoder decodeObjectForKey:kStockNoItemModelIDX];
    self.lINENO = [aDecoder decodeObjectForKey:kStockNoItemModelLINENO];
    self.oPERATORNAME = [aDecoder decodeObjectForKey:kStockNoItemModelOPERATORNAME];
    self.pRICE = [aDecoder decodeObjectForKey:kStockNoItemModelPRICE];
    self.pRODUCTIDX = [aDecoder decodeObjectForKey:kStockNoItemModelPRODUCTIDX];
    self.pRODUCTNAME = [aDecoder decodeObjectForKey:kStockNoItemModelPRODUCTNAME];
    self.pRODUCTNO = [aDecoder decodeObjectForKey:kStockNoItemModelPRODUCTNO];
    self.pRODUCTSTATE = [aDecoder decodeObjectForKey:kStockNoItemModelPRODUCTSTATE];
    self.sTOCKNO = [aDecoder decodeObjectForKey:kStockNoItemModelSTOCKNO];
    self.sTOCKQTY = [aDecoder decodeObjectForKey:kStockNoItemModelSTOCKQTY];
    self.sTOCKUOM = [aDecoder decodeObjectForKey:kStockNoItemModelSTOCKUOM];
    self.sUM = [aDecoder decodeObjectForKey:kStockNoItemModelSUM];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    StockNoItemModel *copy = [StockNoItemModel new];
    
    copy.aBWORKFLOW = [self.aBWORKFLOW copy];
    copy.aDDRESSCODE = [self.aDDRESSCODE copy];
    copy.aDDRESSIDX = [self.aDDRESSIDX copy];
    copy.aDDRESSNAME = [self.aDDRESSNAME copy];
    copy.aDDDATE = [self.aDDDATE copy];
    copy.bATCHNUMBER = [self.bATCHNUMBER copy];
    copy.bUSINESSIDX = [self.bUSINESSIDX copy];
    copy.eDITDATE = [self.eDITDATE copy];
    copy.iDX = [self.iDX copy];
    copy.lINENO = [self.lINENO copy];
    copy.oPERATORNAME = [self.oPERATORNAME copy];
    copy.pRICE = [self.pRICE copy];
    copy.pRODUCTIDX = [self.pRODUCTIDX copy];
    copy.pRODUCTNAME = [self.pRODUCTNAME copy];
    copy.pRODUCTNO = [self.pRODUCTNO copy];
    copy.pRODUCTSTATE = [self.pRODUCTSTATE copy];
    copy.sTOCKNO = [self.sTOCKNO copy];
    copy.sTOCKQTY = [self.sTOCKQTY copy];
    copy.sTOCKUOM = [self.sTOCKUOM copy];
    copy.sUM = [self.sUM copy];
    
    return copy;
}

@end
