//
//  StockNoWaterItemModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockNoWaterItemModel.h"


NSString *const kStockNoWaterItemModelCHANGEDATE = @"CHANGE_DATE";
NSString *const kStockNoWaterItemModelCHANGENO = @"CHANGE_NO";
NSString *const kStockNoWaterItemModelCHANGETYPE = @"CHANGE_TYPE";
NSString *const kStockNoWaterItemModelPRICE = @"PRICE";
NSString *const kStockNoWaterItemModelPRODUCTIONDATE = @"PRODUCTION_DATE";
NSString *const kStockNoWaterItemModelSOURCENO = @"SOURCE_NO";
NSString *const kStockNoWaterItemModelSOURCETYPE = @"SOURCE_TYPE";
NSString *const kStockNoWaterItemModelSTOCKNO = @"STOCK_NO";
NSString *const kStockNoWaterItemModelSTOCKQTY = @"STOCK_QTY";
NSString *const kStockNoWaterItemModelSTOCKUOM = @"STOCK_UOM";
NSString *const kStockNoWaterItemModelSUM = @"SUM";


@implementation StockNoWaterItemModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kStockNoWaterItemModelCHANGEDATE] isKindOfClass:[NSNull class]]){
        self.cHANGEDATE = dictionary[kStockNoWaterItemModelCHANGEDATE];
    }
    if(![dictionary[kStockNoWaterItemModelCHANGENO] isKindOfClass:[NSNull class]]){
        self.cHANGENO = dictionary[kStockNoWaterItemModelCHANGENO];
    }
    if(![dictionary[kStockNoWaterItemModelCHANGETYPE] isKindOfClass:[NSNull class]]){
        self.cHANGETYPE = dictionary[kStockNoWaterItemModelCHANGETYPE];
    }
    if(![dictionary[kStockNoWaterItemModelPRICE] isKindOfClass:[NSNull class]]){
        self.pRICE = dictionary[kStockNoWaterItemModelPRICE];
    }
    if(![dictionary[kStockNoWaterItemModelPRODUCTIONDATE] isKindOfClass:[NSNull class]]){
        self.pRODUCTIONDATE = dictionary[kStockNoWaterItemModelPRODUCTIONDATE];
    }
    if(![dictionary[kStockNoWaterItemModelSOURCENO] isKindOfClass:[NSNull class]]){
        self.sOURCENO = dictionary[kStockNoWaterItemModelSOURCENO];
    }
    if(![dictionary[kStockNoWaterItemModelSOURCETYPE] isKindOfClass:[NSNull class]]){
        self.sOURCETYPE = dictionary[kStockNoWaterItemModelSOURCETYPE];
    }
    if(![dictionary[kStockNoWaterItemModelSTOCKNO] isKindOfClass:[NSNull class]]){
        self.sTOCKNO = dictionary[kStockNoWaterItemModelSTOCKNO];
    }
    if(![dictionary[kStockNoWaterItemModelSTOCKQTY] isKindOfClass:[NSNull class]]){
        self.sTOCKQTY = dictionary[kStockNoWaterItemModelSTOCKQTY];
    }
    if(![dictionary[kStockNoWaterItemModelSTOCKUOM] isKindOfClass:[NSNull class]]){
        self.sTOCKUOM = dictionary[kStockNoWaterItemModelSTOCKUOM];
    }
    if(![dictionary[kStockNoWaterItemModelSUM] isKindOfClass:[NSNull class]]){
        self.sUM = dictionary[kStockNoWaterItemModelSUM];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.cHANGEDATE != nil){
        dictionary[kStockNoWaterItemModelCHANGEDATE] = self.cHANGEDATE;
    }
    if(self.cHANGENO != nil){
        dictionary[kStockNoWaterItemModelCHANGENO] = self.cHANGENO;
    }
    if(self.cHANGETYPE != nil){
        dictionary[kStockNoWaterItemModelCHANGETYPE] = self.cHANGETYPE;
    }
    if(self.pRICE != nil){
        dictionary[kStockNoWaterItemModelPRICE] = self.pRICE;
    }
    if(self.pRODUCTIONDATE != nil){
        dictionary[kStockNoWaterItemModelPRODUCTIONDATE] = self.pRODUCTIONDATE;
    }
    if(self.sOURCENO != nil){
        dictionary[kStockNoWaterItemModelSOURCENO] = self.sOURCENO;
    }
    if(self.sOURCETYPE != nil){
        dictionary[kStockNoWaterItemModelSOURCETYPE] = self.sOURCETYPE;
    }
    if(self.sTOCKNO != nil){
        dictionary[kStockNoWaterItemModelSTOCKNO] = self.sTOCKNO;
    }
    if(self.sTOCKQTY != nil){
        dictionary[kStockNoWaterItemModelSTOCKQTY] = self.sTOCKQTY;
    }
    if(self.sTOCKUOM != nil){
        dictionary[kStockNoWaterItemModelSTOCKUOM] = self.sTOCKUOM;
    }
    if(self.sUM != nil){
        dictionary[kStockNoWaterItemModelSUM] = self.sUM;
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
    if(self.cHANGEDATE != nil){
        [aCoder encodeObject:self.cHANGEDATE forKey:kStockNoWaterItemModelCHANGEDATE];
    }
    if(self.cHANGENO != nil){
        [aCoder encodeObject:self.cHANGENO forKey:kStockNoWaterItemModelCHANGENO];
    }
    if(self.cHANGETYPE != nil){
        [aCoder encodeObject:self.cHANGETYPE forKey:kStockNoWaterItemModelCHANGETYPE];
    }
    if(self.pRICE != nil){
        [aCoder encodeObject:self.pRICE forKey:kStockNoWaterItemModelPRICE];
    }
    if(self.pRODUCTIONDATE != nil){
        [aCoder encodeObject:self.pRODUCTIONDATE forKey:kStockNoWaterItemModelPRODUCTIONDATE];
    }
    if(self.sOURCENO != nil){
        [aCoder encodeObject:self.sOURCENO forKey:kStockNoWaterItemModelSOURCENO];
    }
    if(self.sOURCETYPE != nil){
        [aCoder encodeObject:self.sOURCETYPE forKey:kStockNoWaterItemModelSOURCETYPE];
    }
    if(self.sTOCKNO != nil){
        [aCoder encodeObject:self.sTOCKNO forKey:kStockNoWaterItemModelSTOCKNO];
    }
    if(self.sTOCKQTY != nil){
        [aCoder encodeObject:self.sTOCKQTY forKey:kStockNoWaterItemModelSTOCKQTY];
    }
    if(self.sTOCKUOM != nil){
        [aCoder encodeObject:self.sTOCKUOM forKey:kStockNoWaterItemModelSTOCKUOM];
    }
    if(self.sUM != nil){
        [aCoder encodeObject:self.sUM forKey:kStockNoWaterItemModelSUM];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.cHANGEDATE = [aDecoder decodeObjectForKey:kStockNoWaterItemModelCHANGEDATE];
    self.cHANGENO = [aDecoder decodeObjectForKey:kStockNoWaterItemModelCHANGENO];
    self.cHANGETYPE = [aDecoder decodeObjectForKey:kStockNoWaterItemModelCHANGETYPE];
    self.pRICE = [aDecoder decodeObjectForKey:kStockNoWaterItemModelPRICE];
    self.pRODUCTIONDATE = [aDecoder decodeObjectForKey:kStockNoWaterItemModelPRODUCTIONDATE];
    self.sOURCENO = [aDecoder decodeObjectForKey:kStockNoWaterItemModelSOURCENO];
    self.sOURCETYPE = [aDecoder decodeObjectForKey:kStockNoWaterItemModelSOURCETYPE];
    self.sTOCKNO = [aDecoder decodeObjectForKey:kStockNoWaterItemModelSTOCKNO];
    self.sTOCKQTY = [aDecoder decodeObjectForKey:kStockNoWaterItemModelSTOCKQTY];
    self.sTOCKUOM = [aDecoder decodeObjectForKey:kStockNoWaterItemModelSTOCKUOM];
    self.sUM = [aDecoder decodeObjectForKey:kStockNoWaterItemModelSUM];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    StockNoWaterItemModel *copy = [StockNoWaterItemModel new];
    
    copy.cHANGEDATE = [self.cHANGEDATE copy];
    copy.cHANGENO = [self.cHANGENO copy];
    copy.cHANGETYPE = [self.cHANGETYPE copy];
    copy.pRICE = [self.pRICE copy];
    copy.pRODUCTIONDATE = [self.pRODUCTIONDATE copy];
    copy.sOURCENO = [self.sOURCENO copy];
    copy.sOURCETYPE = [self.sOURCETYPE copy];
    copy.sTOCKNO = [self.sTOCKNO copy];
    copy.sTOCKQTY = [self.sTOCKQTY copy];
    copy.sTOCKUOM = [self.sTOCKUOM copy];
    copy.sUM = [self.sUM copy];
    
    return copy;
}

@end
