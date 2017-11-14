//
//  StockNoItemModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockNoItemModel.h"


NSString *const kStockNoItemModelCHANGEDATE = @"CHANGE_DATE";
NSString *const kStockNoItemModelCHANGENO = @"CHANGE_NO";
NSString *const kStockNoItemModelCHANGETYPE = @"CHANGE_TYPE";
NSString *const kStockNoItemModelPRICE = @"PRICE";
NSString *const kStockNoItemModelPRODUCTIONDATE = @"PRODUCTION_DATE";
NSString *const kStockNoItemModelSOURCENO = @"SOURCE_NO";
NSString *const kStockNoItemModelSOURCETYPE = @"SOURCE_TYPE";
NSString *const kStockNoItemModelSTOCKNO = @"STOCK_NO";
NSString *const kStockNoItemModelSTOCKQTY = @"STOCK_QTY";
NSString *const kStockNoItemModelSTOCKUOM = @"STOCK_UOM";
NSString *const kStockNoItemModelSUM = @"SUM";


@implementation StockNoItemModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kStockNoItemModelCHANGEDATE] isKindOfClass:[NSNull class]]){
        self.cHANGEDATE = dictionary[kStockNoItemModelCHANGEDATE];
    }
    if(![dictionary[kStockNoItemModelCHANGENO] isKindOfClass:[NSNull class]]){
        self.cHANGENO = dictionary[kStockNoItemModelCHANGENO];
    }
    if(![dictionary[kStockNoItemModelCHANGETYPE] isKindOfClass:[NSNull class]]){
        self.cHANGETYPE = dictionary[kStockNoItemModelCHANGETYPE];
    }
    if(![dictionary[kStockNoItemModelPRICE] isKindOfClass:[NSNull class]]){
        self.pRICE = dictionary[kStockNoItemModelPRICE];
    }
    if(![dictionary[kStockNoItemModelPRODUCTIONDATE] isKindOfClass:[NSNull class]]){
        self.pRODUCTIONDATE = dictionary[kStockNoItemModelPRODUCTIONDATE];
    }
    if(![dictionary[kStockNoItemModelSOURCENO] isKindOfClass:[NSNull class]]){
        self.sOURCENO = dictionary[kStockNoItemModelSOURCENO];
    }
    if(![dictionary[kStockNoItemModelSOURCETYPE] isKindOfClass:[NSNull class]]){
        self.sOURCETYPE = dictionary[kStockNoItemModelSOURCETYPE];
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
    if(self.cHANGEDATE != nil){
        dictionary[kStockNoItemModelCHANGEDATE] = self.cHANGEDATE;
    }
    if(self.cHANGENO != nil){
        dictionary[kStockNoItemModelCHANGENO] = self.cHANGENO;
    }
    if(self.cHANGETYPE != nil){
        dictionary[kStockNoItemModelCHANGETYPE] = self.cHANGETYPE;
    }
    if(self.pRICE != nil){
        dictionary[kStockNoItemModelPRICE] = self.pRICE;
    }
    if(self.pRODUCTIONDATE != nil){
        dictionary[kStockNoItemModelPRODUCTIONDATE] = self.pRODUCTIONDATE;
    }
    if(self.sOURCENO != nil){
        dictionary[kStockNoItemModelSOURCENO] = self.sOURCENO;
    }
    if(self.sOURCETYPE != nil){
        dictionary[kStockNoItemModelSOURCETYPE] = self.sOURCETYPE;
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
    if(self.cHANGEDATE != nil){
        [aCoder encodeObject:self.cHANGEDATE forKey:kStockNoItemModelCHANGEDATE];
    }
    if(self.cHANGENO != nil){
        [aCoder encodeObject:self.cHANGENO forKey:kStockNoItemModelCHANGENO];
    }
    if(self.cHANGETYPE != nil){
        [aCoder encodeObject:self.cHANGETYPE forKey:kStockNoItemModelCHANGETYPE];
    }
    if(self.pRICE != nil){
        [aCoder encodeObject:self.pRICE forKey:kStockNoItemModelPRICE];
    }
    if(self.pRODUCTIONDATE != nil){
        [aCoder encodeObject:self.pRODUCTIONDATE forKey:kStockNoItemModelPRODUCTIONDATE];
    }
    if(self.sOURCENO != nil){
        [aCoder encodeObject:self.sOURCENO forKey:kStockNoItemModelSOURCENO];
    }
    if(self.sOURCETYPE != nil){
        [aCoder encodeObject:self.sOURCETYPE forKey:kStockNoItemModelSOURCETYPE];
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
    self.cHANGEDATE = [aDecoder decodeObjectForKey:kStockNoItemModelCHANGEDATE];
    self.cHANGENO = [aDecoder decodeObjectForKey:kStockNoItemModelCHANGENO];
    self.cHANGETYPE = [aDecoder decodeObjectForKey:kStockNoItemModelCHANGETYPE];
    self.pRICE = [aDecoder decodeObjectForKey:kStockNoItemModelPRICE];
    self.pRODUCTIONDATE = [aDecoder decodeObjectForKey:kStockNoItemModelPRODUCTIONDATE];
    self.sOURCENO = [aDecoder decodeObjectForKey:kStockNoItemModelSOURCENO];
    self.sOURCETYPE = [aDecoder decodeObjectForKey:kStockNoItemModelSOURCETYPE];
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
