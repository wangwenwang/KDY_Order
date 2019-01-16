//
//  CARTotalOrderItemModel.m
//  Order
//
//  Created by wenwang wang on 2019/1/9.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CARTotalOrderItemModel.h"

NSString *const kCARTotalOrderItemModelAMOUNTMONEY = @"AMOUNT_MONEY";
NSString *const kCARTotalOrderItemModelBUSINESSIDX = @"BUSINESS_IDX";
NSString *const kCARTotalOrderItemModelNUMBER = @"NUMBER";
NSString *const kCARTotalOrderItemModelORDERNUMBER = @"ORDER_NUMBER";
NSString *const kCARTotalOrderItemModelPARTYCODE = @"PARTY_CODE";
NSString *const kCARTotalOrderItemModelPARTYNAME = @"PARTY_NAME";

@implementation CARTotalOrderItemModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kCARTotalOrderItemModelAMOUNTMONEY] isKindOfClass:[NSNull class]]){
        self.aMOUNTMONEY = dictionary[kCARTotalOrderItemModelAMOUNTMONEY];
    }
    if(![dictionary[kCARTotalOrderItemModelBUSINESSIDX] isKindOfClass:[NSNull class]]){
        self.bUSINESSIDX = dictionary[kCARTotalOrderItemModelBUSINESSIDX];
    }
    if(![dictionary[kCARTotalOrderItemModelNUMBER] isKindOfClass:[NSNull class]]){
        self.nUMBER = dictionary[kCARTotalOrderItemModelNUMBER];
    }
    if(![dictionary[kCARTotalOrderItemModelORDERNUMBER] isKindOfClass:[NSNull class]]){
        self.oRDERNUMBER = dictionary[kCARTotalOrderItemModelORDERNUMBER];
    }
    if(![dictionary[kCARTotalOrderItemModelPARTYCODE] isKindOfClass:[NSNull class]]){
        self.pARTYCODE = dictionary[kCARTotalOrderItemModelPARTYCODE];
    }
    if(![dictionary[kCARTotalOrderItemModelPARTYNAME] isKindOfClass:[NSNull class]]){
        self.pARTYNAME = dictionary[kCARTotalOrderItemModelPARTYNAME];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aMOUNTMONEY != nil){
        dictionary[kCARTotalOrderItemModelAMOUNTMONEY] = self.aMOUNTMONEY;
    }
    if(self.bUSINESSIDX != nil){
        dictionary[kCARTotalOrderItemModelBUSINESSIDX] = self.bUSINESSIDX;
    }
    if(self.nUMBER != nil){
        dictionary[kCARTotalOrderItemModelNUMBER] = self.nUMBER;
    }
    if(self.oRDERNUMBER != nil){
        dictionary[kCARTotalOrderItemModelORDERNUMBER] = self.oRDERNUMBER;
    }
    if(self.pARTYCODE != nil){
        dictionary[kCARTotalOrderItemModelPARTYCODE] = self.pARTYCODE;
    }
    if(self.pARTYNAME != nil){
        dictionary[kCARTotalOrderItemModelPARTYNAME] = self.pARTYNAME;
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
    if(self.aMOUNTMONEY != nil){
        [aCoder encodeObject:self.aMOUNTMONEY forKey:kCARTotalOrderItemModelAMOUNTMONEY];
    }
    if(self.bUSINESSIDX != nil){
        [aCoder encodeObject:self.bUSINESSIDX forKey:kCARTotalOrderItemModelBUSINESSIDX];
    }
    if(self.nUMBER != nil){
        [aCoder encodeObject:self.nUMBER forKey:kCARTotalOrderItemModelNUMBER];
    }
    if(self.oRDERNUMBER != nil){
        [aCoder encodeObject:self.oRDERNUMBER forKey:kCARTotalOrderItemModelORDERNUMBER];
    }
    if(self.pARTYCODE != nil){
        [aCoder encodeObject:self.pARTYCODE forKey:kCARTotalOrderItemModelPARTYCODE];
    }
    if(self.pARTYNAME != nil){
        [aCoder encodeObject:self.pARTYNAME forKey:kCARTotalOrderItemModelPARTYNAME];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aMOUNTMONEY = [aDecoder decodeObjectForKey:kCARTotalOrderItemModelAMOUNTMONEY];
    self.bUSINESSIDX = [aDecoder decodeObjectForKey:kCARTotalOrderItemModelBUSINESSIDX];
    self.nUMBER = [aDecoder decodeObjectForKey:kCARTotalOrderItemModelNUMBER];
    self.oRDERNUMBER = [aDecoder decodeObjectForKey:kCARTotalOrderItemModelORDERNUMBER];
    self.pARTYCODE = [aDecoder decodeObjectForKey:kCARTotalOrderItemModelPARTYCODE];
    self.pARTYNAME = [aDecoder decodeObjectForKey:kCARTotalOrderItemModelPARTYNAME];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CARTotalOrderItemModel *copy = [CARTotalOrderItemModel new];
    
    copy.aMOUNTMONEY = [self.aMOUNTMONEY copy];
    copy.bUSINESSIDX = [self.bUSINESSIDX copy];
    copy.nUMBER = [self.nUMBER copy];
    copy.oRDERNUMBER = [self.oRDERNUMBER copy];
    copy.pARTYCODE = [self.pARTYCODE copy];
    copy.pARTYNAME = [self.pARTYNAME copy];
    
    return copy;
}

@end
