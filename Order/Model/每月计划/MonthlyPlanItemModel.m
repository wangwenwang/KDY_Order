//
//  MonthlyPlanItemModel.m
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "MonthlyPlanItemModel.h"


NSString *const kMonthlyPlanItemModelACTPRICE = @"ACT_PRICE";
NSString *const kMonthlyPlanItemModelLINENO = @"LINE_NO";
NSString *const kMonthlyPlanItemModelORGPRICE = @"ORG_PRICE";
NSString *const kMonthlyPlanItemModelPOQTY = @"PO_QTY";
NSString *const kMonthlyPlanItemModelPOUOM = @"PO_UOM";
NSString *const kMonthlyPlanItemModelPOVOLUME = @"PO_VOLUME";
NSString *const kMonthlyPlanItemModelPOWEIGHT = @"PO_WEIGHT";
NSString *const kMonthlyPlanItemModelPRODUCTNAME = @"PRODUCT_NAME";
NSString *const kMonthlyPlanItemModelPRODUCTNO = @"PRODUCT_NO";
NSString *const kMonthlyPlanItemModelPRODUCTTYPE = @"PRODUCT_TYPE";
NSString *const kMonthlyPlanItemModelSALEREMARK = @"SALE_REMARK";


@implementation MonthlyPlanItemModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kMonthlyPlanItemModelACTPRICE] isKindOfClass:[NSNull class]]){
        self.aCTPRICE = dictionary[kMonthlyPlanItemModelACTPRICE];
    }
    if(![dictionary[kMonthlyPlanItemModelLINENO] isKindOfClass:[NSNull class]]){
        self.lINENO = dictionary[kMonthlyPlanItemModelLINENO];
    }
    if(![dictionary[kMonthlyPlanItemModelORGPRICE] isKindOfClass:[NSNull class]]){
        self.oRGPRICE = dictionary[kMonthlyPlanItemModelORGPRICE];
    }
    if(![dictionary[kMonthlyPlanItemModelPOQTY] isKindOfClass:[NSNull class]]){
        self.pOQTY = dictionary[kMonthlyPlanItemModelPOQTY];
    }
    if(![dictionary[kMonthlyPlanItemModelPOUOM] isKindOfClass:[NSNull class]]){
        self.pOUOM = dictionary[kMonthlyPlanItemModelPOUOM];
    }
    if(![dictionary[kMonthlyPlanItemModelPOVOLUME] isKindOfClass:[NSNull class]]){
        self.pOVOLUME = dictionary[kMonthlyPlanItemModelPOVOLUME];
    }
    if(![dictionary[kMonthlyPlanItemModelPOWEIGHT] isKindOfClass:[NSNull class]]){
        self.pOWEIGHT = dictionary[kMonthlyPlanItemModelPOWEIGHT];
    }
    if(![dictionary[kMonthlyPlanItemModelPRODUCTNAME] isKindOfClass:[NSNull class]]){
        self.pRODUCTNAME = dictionary[kMonthlyPlanItemModelPRODUCTNAME];
    }
    if(![dictionary[kMonthlyPlanItemModelPRODUCTNO] isKindOfClass:[NSNull class]]){
        self.pRODUCTNO = dictionary[kMonthlyPlanItemModelPRODUCTNO];
    }
    if(![dictionary[kMonthlyPlanItemModelPRODUCTTYPE] isKindOfClass:[NSNull class]]){
        self.pRODUCTTYPE = dictionary[kMonthlyPlanItemModelPRODUCTTYPE];
    }
    if(![dictionary[kMonthlyPlanItemModelSALEREMARK] isKindOfClass:[NSNull class]]){
        self.sALEREMARK = dictionary[kMonthlyPlanItemModelSALEREMARK];
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
        dictionary[kMonthlyPlanItemModelACTPRICE] = self.aCTPRICE;
    }
    if(self.lINENO != nil){
        dictionary[kMonthlyPlanItemModelLINENO] = self.lINENO;
    }
    if(self.oRGPRICE != nil){
        dictionary[kMonthlyPlanItemModelORGPRICE] = self.oRGPRICE;
    }
    if(self.pOQTY != nil){
        dictionary[kMonthlyPlanItemModelPOQTY] = self.pOQTY;
    }
    if(self.pOUOM != nil){
        dictionary[kMonthlyPlanItemModelPOUOM] = self.pOUOM;
    }
    if(self.pOVOLUME != nil){
        dictionary[kMonthlyPlanItemModelPOVOLUME] = self.pOVOLUME;
    }
    if(self.pOWEIGHT != nil){
        dictionary[kMonthlyPlanItemModelPOWEIGHT] = self.pOWEIGHT;
    }
    if(self.pRODUCTNAME != nil){
        dictionary[kMonthlyPlanItemModelPRODUCTNAME] = self.pRODUCTNAME;
    }
    if(self.pRODUCTNO != nil){
        dictionary[kMonthlyPlanItemModelPRODUCTNO] = self.pRODUCTNO;
    }
    if(self.pRODUCTTYPE != nil){
        dictionary[kMonthlyPlanItemModelPRODUCTTYPE] = self.pRODUCTTYPE;
    }
    if(self.sALEREMARK != nil){
        dictionary[kMonthlyPlanItemModelSALEREMARK] = self.sALEREMARK;
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
        [aCoder encodeObject:self.aCTPRICE forKey:kMonthlyPlanItemModelACTPRICE];
    }
    if(self.lINENO != nil){
        [aCoder encodeObject:self.lINENO forKey:kMonthlyPlanItemModelLINENO];
    }
    if(self.oRGPRICE != nil){
        [aCoder encodeObject:self.oRGPRICE forKey:kMonthlyPlanItemModelORGPRICE];
    }
    if(self.pOQTY != nil){
        [aCoder encodeObject:self.pOQTY forKey:kMonthlyPlanItemModelPOQTY];
    }
    if(self.pOUOM != nil){
        [aCoder encodeObject:self.pOUOM forKey:kMonthlyPlanItemModelPOUOM];
    }
    if(self.pOVOLUME != nil){
        [aCoder encodeObject:self.pOVOLUME forKey:kMonthlyPlanItemModelPOVOLUME];
    }
    if(self.pOWEIGHT != nil){
        [aCoder encodeObject:self.pOWEIGHT forKey:kMonthlyPlanItemModelPOWEIGHT];
    }
    if(self.pRODUCTNAME != nil){
        [aCoder encodeObject:self.pRODUCTNAME forKey:kMonthlyPlanItemModelPRODUCTNAME];
    }
    if(self.pRODUCTNO != nil){
        [aCoder encodeObject:self.pRODUCTNO forKey:kMonthlyPlanItemModelPRODUCTNO];
    }
    if(self.pRODUCTTYPE != nil){
        [aCoder encodeObject:self.pRODUCTTYPE forKey:kMonthlyPlanItemModelPRODUCTTYPE];
    }
    if(self.sALEREMARK != nil){
        [aCoder encodeObject:self.sALEREMARK forKey:kMonthlyPlanItemModelSALEREMARK];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aCTPRICE = [aDecoder decodeObjectForKey:kMonthlyPlanItemModelACTPRICE];
    self.lINENO = [aDecoder decodeObjectForKey:kMonthlyPlanItemModelLINENO];
    self.oRGPRICE = [aDecoder decodeObjectForKey:kMonthlyPlanItemModelORGPRICE];
    self.pOQTY = [aDecoder decodeObjectForKey:kMonthlyPlanItemModelPOQTY];
    self.pOUOM = [aDecoder decodeObjectForKey:kMonthlyPlanItemModelPOUOM];
    self.pOVOLUME = [aDecoder decodeObjectForKey:kMonthlyPlanItemModelPOVOLUME];
    self.pOWEIGHT = [aDecoder decodeObjectForKey:kMonthlyPlanItemModelPOWEIGHT];
    self.pRODUCTNAME = [aDecoder decodeObjectForKey:kMonthlyPlanItemModelPRODUCTNAME];
    self.pRODUCTNO = [aDecoder decodeObjectForKey:kMonthlyPlanItemModelPRODUCTNO];
    self.pRODUCTTYPE = [aDecoder decodeObjectForKey:kMonthlyPlanItemModelPRODUCTTYPE];
    self.sALEREMARK = [aDecoder decodeObjectForKey:kMonthlyPlanItemModelSALEREMARK];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    MonthlyPlanItemModel *copy = [MonthlyPlanItemModel new];
    
    copy.aCTPRICE = [self.aCTPRICE copy];
    copy.lINENO = [self.lINENO copy];
    copy.oRGPRICE = [self.oRGPRICE copy];
    copy.pOQTY = [self.pOQTY copy];
    copy.pOUOM = [self.pOUOM copy];
    copy.pOVOLUME = [self.pOVOLUME copy];
    copy.pOWEIGHT = [self.pOWEIGHT copy];
    copy.pRODUCTNAME = [self.pRODUCTNAME copy];
    copy.pRODUCTNO = [self.pRODUCTNO copy];
    copy.pRODUCTTYPE = [self.pRODUCTTYPE copy];
    copy.sALEREMARK = [self.sALEREMARK copy];
    
    return copy;
}

@end
