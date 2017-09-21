//
//  InputToAddressModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/20.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "InputToAddressModel.h"


NSString *const kInputToAddressModelADDRESSINFO = @"ADDRESS_INFO";
NSString *const kInputToAddressModelCONTACTPERSON = @"CONTACT_PERSON";
NSString *const kInputToAddressModelCONTACTTEL = @"CONTACT_TEL";
NSString *const kInputToAddressModelIDX = @"IDX";
NSString *const kInputToAddressModelITEMCODE = @"ITEM_CODE";
NSString *const kInputToAddressModelPARTYNAME = @"PARTY_NAME";


@implementation InputToAddressModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kInputToAddressModelADDRESSINFO] isKindOfClass:[NSNull class]]){
        self.aDDRESSINFO = dictionary[kInputToAddressModelADDRESSINFO];
    }
    if(![dictionary[kInputToAddressModelCONTACTPERSON] isKindOfClass:[NSNull class]]){
        self.cONTACTPERSON = dictionary[kInputToAddressModelCONTACTPERSON];
    }
    if(![dictionary[kInputToAddressModelCONTACTTEL] isKindOfClass:[NSNull class]]){
        self.cONTACTTEL = dictionary[kInputToAddressModelCONTACTTEL];
    }
    if(![dictionary[kInputToAddressModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kInputToAddressModelIDX];
    }
    if(![dictionary[kInputToAddressModelITEMCODE] isKindOfClass:[NSNull class]]){
        self.iTEMCODE = dictionary[kInputToAddressModelITEMCODE];
    }
    if(![dictionary[kInputToAddressModelPARTYNAME] isKindOfClass:[NSNull class]]){
        self.pARTYNAME = dictionary[kInputToAddressModelPARTYNAME];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aDDRESSINFO != nil){
        dictionary[kInputToAddressModelADDRESSINFO] = self.aDDRESSINFO;
    }
    if(self.cONTACTPERSON != nil){
        dictionary[kInputToAddressModelCONTACTPERSON] = self.cONTACTPERSON;
    }
    if(self.cONTACTTEL != nil){
        dictionary[kInputToAddressModelCONTACTTEL] = self.cONTACTTEL;
    }
    if(self.iDX != nil){
        dictionary[kInputToAddressModelIDX] = self.iDX;
    }
    if(self.iTEMCODE != nil){
        dictionary[kInputToAddressModelITEMCODE] = self.iTEMCODE;
    }
    if(self.pARTYNAME != nil){
        dictionary[kInputToAddressModelPARTYNAME] = self.pARTYNAME;
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
    if(self.aDDRESSINFO != nil){
        [aCoder encodeObject:self.aDDRESSINFO forKey:kInputToAddressModelADDRESSINFO];
    }
    if(self.cONTACTPERSON != nil){
        [aCoder encodeObject:self.cONTACTPERSON forKey:kInputToAddressModelCONTACTPERSON];
    }
    if(self.cONTACTTEL != nil){
        [aCoder encodeObject:self.cONTACTTEL forKey:kInputToAddressModelCONTACTTEL];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kInputToAddressModelIDX];
    }
    if(self.iTEMCODE != nil){
        [aCoder encodeObject:self.iTEMCODE forKey:kInputToAddressModelITEMCODE];
    }
    if(self.pARTYNAME != nil){
        [aCoder encodeObject:self.pARTYNAME forKey:kInputToAddressModelPARTYNAME];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDRESSINFO = [aDecoder decodeObjectForKey:kInputToAddressModelADDRESSINFO];
    self.cONTACTPERSON = [aDecoder decodeObjectForKey:kInputToAddressModelCONTACTPERSON];
    self.cONTACTTEL = [aDecoder decodeObjectForKey:kInputToAddressModelCONTACTTEL];
    self.iDX = [aDecoder decodeObjectForKey:kInputToAddressModelIDX];
    self.iTEMCODE = [aDecoder decodeObjectForKey:kInputToAddressModelITEMCODE];
    self.pARTYNAME = [aDecoder decodeObjectForKey:kInputToAddressModelPARTYNAME];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    InputToAddressModel *copy = [InputToAddressModel new];
    
    copy.aDDRESSINFO = [self.aDDRESSINFO copy];
    copy.cONTACTPERSON = [self.cONTACTPERSON copy];
    copy.cONTACTTEL = [self.cONTACTTEL copy];
    copy.iDX = [self.iDX copy];
    copy.iTEMCODE = [self.iTEMCODE copy];
    copy.pARTYNAME = [self.pARTYNAME copy];
    
    return copy;
}

@end
