//
//  TmsOrderItemModel.m
//  Order
//
//  Created by 凯东源 on 2018/1/3.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "TmsOrderItemModel.h"


NSString *const kTmsOrderItemModelIDX = @"IDX";
NSString *const kTmsOrderItemModelORDDATEADD = @"ORD_DATE_ADD";
NSString *const kTmsOrderItemModelORDNo = @"ORD_No";
NSString *const kTmsOrderItemModelORDQTY = @"ORD_QTY";
NSString *const kTmsOrderItemModelORDTOADDRESS = @"ORD_TO_ADDRESS";
NSString *const kTmsOrderItemModelORDTONAME = @"ORD_TO_NAME";
NSString *const kTmsOrderItemModelORDVOLUME = @"ORD_VOLUME";
NSString *const kTmsOrderItemModelORDWEIGHT = @"ORD_WEIGHT";
NSString *const kTmsOrderItemModelTMSQTY = @"TMS_QTY";
NSString *const kTmsOrderItemModelTMSVOLUME = @"TMS_VOLUME";
NSString *const kTmsOrderItemModelTMSWEIGHT = @"TMS_WEIGHT";


@implementation TmsOrderItemModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kTmsOrderItemModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kTmsOrderItemModelIDX];
    }
    if(![dictionary[kTmsOrderItemModelORDDATEADD] isKindOfClass:[NSNull class]]){
        self.oRDDATEADD = dictionary[kTmsOrderItemModelORDDATEADD];
    }
    if(![dictionary[kTmsOrderItemModelORDNo] isKindOfClass:[NSNull class]]){
        self.oRDNo = dictionary[kTmsOrderItemModelORDNo];
    }
    if(![dictionary[kTmsOrderItemModelORDQTY] isKindOfClass:[NSNull class]]){
        self.oRDQTY = dictionary[kTmsOrderItemModelORDQTY];
    }
    if(![dictionary[kTmsOrderItemModelORDTOADDRESS] isKindOfClass:[NSNull class]]){
        self.oRDTOADDRESS = dictionary[kTmsOrderItemModelORDTOADDRESS];
    }
    if(![dictionary[kTmsOrderItemModelORDTONAME] isKindOfClass:[NSNull class]]){
        self.oRDTONAME = dictionary[kTmsOrderItemModelORDTONAME];
    }
    if(![dictionary[kTmsOrderItemModelORDVOLUME] isKindOfClass:[NSNull class]]){
        self.oRDVOLUME = dictionary[kTmsOrderItemModelORDVOLUME];
    }
    if(![dictionary[kTmsOrderItemModelORDWEIGHT] isKindOfClass:[NSNull class]]){
        self.oRDWEIGHT = dictionary[kTmsOrderItemModelORDWEIGHT];
    }
    if(![dictionary[kTmsOrderItemModelTMSQTY] isKindOfClass:[NSNull class]]){
        self.tMSQTY = dictionary[kTmsOrderItemModelTMSQTY];
    }
    if(![dictionary[kTmsOrderItemModelTMSVOLUME] isKindOfClass:[NSNull class]]){
        self.tMSVOLUME = dictionary[kTmsOrderItemModelTMSVOLUME];
    }
    if(![dictionary[kTmsOrderItemModelTMSWEIGHT] isKindOfClass:[NSNull class]]){
        self.tMSWEIGHT = dictionary[kTmsOrderItemModelTMSWEIGHT];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.iDX != nil){
        dictionary[kTmsOrderItemModelIDX] = self.iDX;
    }
    if(self.oRDDATEADD != nil){
        dictionary[kTmsOrderItemModelORDDATEADD] = self.oRDDATEADD;
    }
    if(self.oRDNo != nil){
        dictionary[kTmsOrderItemModelORDNo] = self.oRDNo;
    }
    if(self.oRDQTY != nil){
        dictionary[kTmsOrderItemModelORDQTY] = self.oRDQTY;
    }
    if(self.oRDTOADDRESS != nil){
        dictionary[kTmsOrderItemModelORDTOADDRESS] = self.oRDTOADDRESS;
    }
    if(self.oRDTONAME != nil){
        dictionary[kTmsOrderItemModelORDTONAME] = self.oRDTONAME;
    }
    if(self.oRDVOLUME != nil){
        dictionary[kTmsOrderItemModelORDVOLUME] = self.oRDVOLUME;
    }
    if(self.oRDWEIGHT != nil){
        dictionary[kTmsOrderItemModelORDWEIGHT] = self.oRDWEIGHT;
    }
    if(self.tMSQTY != nil){
        dictionary[kTmsOrderItemModelTMSQTY] = self.tMSQTY;
    }
    if(self.tMSVOLUME != nil){
        dictionary[kTmsOrderItemModelTMSVOLUME] = self.tMSVOLUME;
    }
    if(self.tMSWEIGHT != nil){
        dictionary[kTmsOrderItemModelTMSWEIGHT] = self.tMSWEIGHT;
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
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kTmsOrderItemModelIDX];
    }
    if(self.oRDDATEADD != nil){
        [aCoder encodeObject:self.oRDDATEADD forKey:kTmsOrderItemModelORDDATEADD];
    }
    if(self.oRDNo != nil){
        [aCoder encodeObject:self.oRDNo forKey:kTmsOrderItemModelORDNo];
    }
    if(self.oRDQTY != nil){
        [aCoder encodeObject:self.oRDQTY forKey:kTmsOrderItemModelORDQTY];
    }
    if(self.oRDTOADDRESS != nil){
        [aCoder encodeObject:self.oRDTOADDRESS forKey:kTmsOrderItemModelORDTOADDRESS];
    }
    if(self.oRDTONAME != nil){
        [aCoder encodeObject:self.oRDTONAME forKey:kTmsOrderItemModelORDTONAME];
    }
    if(self.oRDVOLUME != nil){
        [aCoder encodeObject:self.oRDVOLUME forKey:kTmsOrderItemModelORDVOLUME];
    }
    if(self.oRDWEIGHT != nil){
        [aCoder encodeObject:self.oRDWEIGHT forKey:kTmsOrderItemModelORDWEIGHT];
    }
    if(self.tMSQTY != nil){
        [aCoder encodeObject:self.tMSQTY forKey:kTmsOrderItemModelTMSQTY];
    }
    if(self.tMSVOLUME != nil){
        [aCoder encodeObject:self.tMSVOLUME forKey:kTmsOrderItemModelTMSVOLUME];
    }
    if(self.tMSWEIGHT != nil){
        [aCoder encodeObject:self.tMSWEIGHT forKey:kTmsOrderItemModelTMSWEIGHT];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.iDX = [aDecoder decodeObjectForKey:kTmsOrderItemModelIDX];
    self.oRDDATEADD = [aDecoder decodeObjectForKey:kTmsOrderItemModelORDDATEADD];
    self.oRDNo = [aDecoder decodeObjectForKey:kTmsOrderItemModelORDNo];
    self.oRDQTY = [aDecoder decodeObjectForKey:kTmsOrderItemModelORDQTY];
    self.oRDTOADDRESS = [aDecoder decodeObjectForKey:kTmsOrderItemModelORDTOADDRESS];
    self.oRDTONAME = [aDecoder decodeObjectForKey:kTmsOrderItemModelORDTONAME];
    self.oRDVOLUME = [aDecoder decodeObjectForKey:kTmsOrderItemModelORDVOLUME];
    self.oRDWEIGHT = [aDecoder decodeObjectForKey:kTmsOrderItemModelORDWEIGHT];
    self.tMSQTY = [aDecoder decodeObjectForKey:kTmsOrderItemModelTMSQTY];
    self.tMSVOLUME = [aDecoder decodeObjectForKey:kTmsOrderItemModelTMSVOLUME];
    self.tMSWEIGHT = [aDecoder decodeObjectForKey:kTmsOrderItemModelTMSWEIGHT];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TmsOrderItemModel *copy = [TmsOrderItemModel new];
    
    copy.iDX = [self.iDX copy];
    copy.oRDDATEADD = [self.oRDDATEADD copy];
    copy.oRDNo = [self.oRDNo copy];
    copy.oRDQTY = [self.oRDQTY copy];
    copy.oRDTOADDRESS = [self.oRDTOADDRESS copy];
    copy.oRDTONAME = [self.oRDTONAME copy];
    copy.oRDVOLUME = [self.oRDVOLUME copy];
    copy.oRDWEIGHT = [self.oRDWEIGHT copy];
    copy.tMSQTY = [self.tMSQTY copy];
    copy.tMSVOLUME = [self.tMSVOLUME copy];
    copy.tMSWEIGHT = [self.tMSWEIGHT copy];
    
    return copy;
}

@end
