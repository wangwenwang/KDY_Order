

//
//  CARTotalOrderDetailItemModel.m
//  Order
//
//  Created by wenwang wang on 2019/1/22.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CARTotalOrderDetailItemModel.h"


NSString *const kCARTotalOrderDetailItemModelAMOUNTMONEY = @"AMOUNT_MONEY";
NSString *const kCARTotalOrderDetailItemModelBUSINESSIDX = @"BUSINESS_IDX";
NSString *const kCARTotalOrderDetailItemModelNUMBER = @"NUMBER";
NSString *const kCARTotalOrderDetailItemModelPARTYCODE = @"PARTY_CODE";
NSString *const kCARTotalOrderDetailItemModelPARTYNAME = @"PARTY_NAME";
NSString *const kCARTotalOrderDetailItemModelPRODUCTNAME = @"PRODUCT_NAME";
NSString *const kCARTotalOrderDetailItemModelPRODUCTNO = @"PRODUCT_NO";

@implementation CARTotalOrderDetailItemModel
/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kCARTotalOrderDetailItemModelAMOUNTMONEY] isKindOfClass:[NSNull class]]){
        self.aMOUNTMONEY = dictionary[kCARTotalOrderDetailItemModelAMOUNTMONEY];
    }
    if(![dictionary[kCARTotalOrderDetailItemModelBUSINESSIDX] isKindOfClass:[NSNull class]]){
        self.bUSINESSIDX = dictionary[kCARTotalOrderDetailItemModelBUSINESSIDX];
    }
    if(![dictionary[kCARTotalOrderDetailItemModelNUMBER] isKindOfClass:[NSNull class]]){
        self.nUMBER = dictionary[kCARTotalOrderDetailItemModelNUMBER];
    }
    if(![dictionary[kCARTotalOrderDetailItemModelPARTYCODE] isKindOfClass:[NSNull class]]){
        self.pARTYCODE = dictionary[kCARTotalOrderDetailItemModelPARTYCODE];
    }
    if(![dictionary[kCARTotalOrderDetailItemModelPARTYNAME] isKindOfClass:[NSNull class]]){
        self.pARTYNAME = dictionary[kCARTotalOrderDetailItemModelPARTYNAME];
    }
    if(![dictionary[kCARTotalOrderDetailItemModelPRODUCTNAME] isKindOfClass:[NSNull class]]){
        self.pRODUCTNAME = dictionary[kCARTotalOrderDetailItemModelPRODUCTNAME];
    }
    if(![dictionary[kCARTotalOrderDetailItemModelPRODUCTNO] isKindOfClass:[NSNull class]]){
        self.pRODUCTNO = dictionary[kCARTotalOrderDetailItemModelPRODUCTNO];
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
        dictionary[kCARTotalOrderDetailItemModelAMOUNTMONEY] = self.aMOUNTMONEY;
    }
    if(self.bUSINESSIDX != nil){
        dictionary[kCARTotalOrderDetailItemModelBUSINESSIDX] = self.bUSINESSIDX;
    }
    if(self.nUMBER != nil){
        dictionary[kCARTotalOrderDetailItemModelNUMBER] = self.nUMBER;
    }
    if(self.pARTYCODE != nil){
        dictionary[kCARTotalOrderDetailItemModelPARTYCODE] = self.pARTYCODE;
    }
    if(self.pARTYNAME != nil){
        dictionary[kCARTotalOrderDetailItemModelPARTYNAME] = self.pARTYNAME;
    }
    if(self.pRODUCTNAME != nil){
        dictionary[kCARTotalOrderDetailItemModelPRODUCTNAME] = self.pRODUCTNAME;
    }
    if(self.pRODUCTNO != nil){
        dictionary[kCARTotalOrderDetailItemModelPRODUCTNO] = self.pRODUCTNO;
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
        [aCoder encodeObject:self.aMOUNTMONEY forKey:kCARTotalOrderDetailItemModelAMOUNTMONEY];
    }
    if(self.bUSINESSIDX != nil){
        [aCoder encodeObject:self.bUSINESSIDX forKey:kCARTotalOrderDetailItemModelBUSINESSIDX];
    }
    if(self.nUMBER != nil){
        [aCoder encodeObject:self.nUMBER forKey:kCARTotalOrderDetailItemModelNUMBER];
    }
    if(self.pARTYCODE != nil){
        [aCoder encodeObject:self.pARTYCODE forKey:kCARTotalOrderDetailItemModelPARTYCODE];
    }
    if(self.pARTYNAME != nil){
        [aCoder encodeObject:self.pARTYNAME forKey:kCARTotalOrderDetailItemModelPARTYNAME];
    }
    if(self.pRODUCTNAME != nil){
        [aCoder encodeObject:self.pRODUCTNAME forKey:kCARTotalOrderDetailItemModelPRODUCTNAME];
    }
    if(self.pRODUCTNO != nil){
        [aCoder encodeObject:self.pRODUCTNO forKey:kCARTotalOrderDetailItemModelPRODUCTNO];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aMOUNTMONEY = [aDecoder decodeObjectForKey:kCARTotalOrderDetailItemModelAMOUNTMONEY];
    self.bUSINESSIDX = [aDecoder decodeObjectForKey:kCARTotalOrderDetailItemModelBUSINESSIDX];
    self.nUMBER = [aDecoder decodeObjectForKey:kCARTotalOrderDetailItemModelNUMBER];
    self.pARTYCODE = [aDecoder decodeObjectForKey:kCARTotalOrderDetailItemModelPARTYCODE];
    self.pARTYNAME = [aDecoder decodeObjectForKey:kCARTotalOrderDetailItemModelPARTYNAME];
    self.pRODUCTNAME = [aDecoder decodeObjectForKey:kCARTotalOrderDetailItemModelPRODUCTNAME];
    self.pRODUCTNO = [aDecoder decodeObjectForKey:kCARTotalOrderDetailItemModelPRODUCTNO];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CARTotalOrderDetailItemModel *copy = [CARTotalOrderDetailItemModel new];
    
    copy.aMOUNTMONEY = [self.aMOUNTMONEY copy];
    copy.bUSINESSIDX = [self.bUSINESSIDX copy];
    copy.nUMBER = [self.nUMBER copy];
    copy.pARTYCODE = [self.pARTYCODE copy];
    copy.pARTYNAME = [self.pARTYNAME copy];
    copy.pRODUCTNAME = [self.pRODUCTNAME copy];
    copy.pRODUCTNO = [self.pRODUCTNO copy];
    
    return copy;
}

@end
