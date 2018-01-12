//
//  TmsOrderInfoItemModel.m
//  Order
//
//  Created by 凯东源 on 2018/1/4.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "TmsOrderInfoItemModel.h"


NSString *const kTmsOrderInfoItemModelDRIVERPAY = @"DRIVER_PAY";
NSString *const kTmsOrderInfoItemModelORDISSUEQTY = @"ORD_ISSUE_QTY";
NSString *const kTmsOrderInfoItemModelORDISSUEVOLUME = @"ORD_ISSUE_VOLUME";
NSString *const kTmsOrderInfoItemModelORDISSUEWEIGHT = @"ORD_ISSUE_WEIGHT";
NSString *const kTmsOrderInfoItemModelORDNO = @"ORD_NO";
NSString *const kTmsOrderInfoItemModelORDWORKFLOW = @"ORD_WORKFLOW";
NSString *const kTmsOrderInfoItemModelTMSDATEISSUE = @"TMS_DATE_ISSUE";
NSString *const kTmsOrderInfoItemModelTMSDATELOAD = @"TMS_DATE_LOAD";
NSString *const kTmsOrderInfoItemModelTMSSHIPMENTNO = @"TMS_SHIPMENT_NO";


@implementation TmsOrderInfoItemModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kTmsOrderInfoItemModelDRIVERPAY] isKindOfClass:[NSNull class]]){
        self.dRIVERPAY = dictionary[kTmsOrderInfoItemModelDRIVERPAY];
    }
    if(![dictionary[kTmsOrderInfoItemModelORDISSUEQTY] isKindOfClass:[NSNull class]]){
        self.oRDISSUEQTY = dictionary[kTmsOrderInfoItemModelORDISSUEQTY];
    }
    if(![dictionary[kTmsOrderInfoItemModelORDISSUEVOLUME] isKindOfClass:[NSNull class]]){
        self.oRDISSUEVOLUME = dictionary[kTmsOrderInfoItemModelORDISSUEVOLUME];
    }
    if(![dictionary[kTmsOrderInfoItemModelORDISSUEWEIGHT] isKindOfClass:[NSNull class]]){
        self.oRDISSUEWEIGHT = dictionary[kTmsOrderInfoItemModelORDISSUEWEIGHT];
    }
    if(![dictionary[kTmsOrderInfoItemModelORDNO] isKindOfClass:[NSNull class]]){
        self.oRDNO = dictionary[kTmsOrderInfoItemModelORDNO];
    }
    if(![dictionary[kTmsOrderInfoItemModelORDWORKFLOW] isKindOfClass:[NSNull class]]){
        self.oRDWORKFLOW = dictionary[kTmsOrderInfoItemModelORDWORKFLOW];
    }
    if(![dictionary[kTmsOrderInfoItemModelTMSDATEISSUE] isKindOfClass:[NSNull class]]){
        self.tMSDATEISSUE = dictionary[kTmsOrderInfoItemModelTMSDATEISSUE];
    }
    if(![dictionary[kTmsOrderInfoItemModelTMSDATELOAD] isKindOfClass:[NSNull class]]){
        self.tMSDATELOAD = dictionary[kTmsOrderInfoItemModelTMSDATELOAD];
    }
    if(![dictionary[kTmsOrderInfoItemModelTMSSHIPMENTNO] isKindOfClass:[NSNull class]]){
        self.tMSSHIPMENTNO = dictionary[kTmsOrderInfoItemModelTMSSHIPMENTNO];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.dRIVERPAY != nil){
        dictionary[kTmsOrderInfoItemModelDRIVERPAY] = self.dRIVERPAY;
    }
    if(self.oRDISSUEQTY != nil){
        dictionary[kTmsOrderInfoItemModelORDISSUEQTY] = self.oRDISSUEQTY;
    }
    if(self.oRDISSUEVOLUME != nil){
        dictionary[kTmsOrderInfoItemModelORDISSUEVOLUME] = self.oRDISSUEVOLUME;
    }
    if(self.oRDISSUEWEIGHT != nil){
        dictionary[kTmsOrderInfoItemModelORDISSUEWEIGHT] = self.oRDISSUEWEIGHT;
    }
    if(self.oRDNO != nil){
        dictionary[kTmsOrderInfoItemModelORDNO] = self.oRDNO;
    }
    if(self.oRDWORKFLOW != nil){
        dictionary[kTmsOrderInfoItemModelORDWORKFLOW] = self.oRDWORKFLOW;
    }
    if(self.tMSDATEISSUE != nil){
        dictionary[kTmsOrderInfoItemModelTMSDATEISSUE] = self.tMSDATEISSUE;
    }
    if(self.tMSDATELOAD != nil){
        dictionary[kTmsOrderInfoItemModelTMSDATELOAD] = self.tMSDATELOAD;
    }
    if(self.tMSSHIPMENTNO != nil){
        dictionary[kTmsOrderInfoItemModelTMSSHIPMENTNO] = self.tMSSHIPMENTNO;
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
    if(self.dRIVERPAY != nil){
        [aCoder encodeObject:self.dRIVERPAY forKey:kTmsOrderInfoItemModelDRIVERPAY];
    }
    if(self.oRDISSUEQTY != nil){
        [aCoder encodeObject:self.oRDISSUEQTY forKey:kTmsOrderInfoItemModelORDISSUEQTY];
    }
    if(self.oRDISSUEVOLUME != nil){
        [aCoder encodeObject:self.oRDISSUEVOLUME forKey:kTmsOrderInfoItemModelORDISSUEVOLUME];
    }
    if(self.oRDISSUEWEIGHT != nil){
        [aCoder encodeObject:self.oRDISSUEWEIGHT forKey:kTmsOrderInfoItemModelORDISSUEWEIGHT];
    }
    if(self.oRDNO != nil){
        [aCoder encodeObject:self.oRDNO forKey:kTmsOrderInfoItemModelORDNO];
    }
    if(self.oRDWORKFLOW != nil){
        [aCoder encodeObject:self.oRDWORKFLOW forKey:kTmsOrderInfoItemModelORDWORKFLOW];
    }
    if(self.tMSDATEISSUE != nil){
        [aCoder encodeObject:self.tMSDATEISSUE forKey:kTmsOrderInfoItemModelTMSDATEISSUE];
    }
    if(self.tMSDATELOAD != nil){
        [aCoder encodeObject:self.tMSDATELOAD forKey:kTmsOrderInfoItemModelTMSDATELOAD];
    }
    if(self.tMSSHIPMENTNO != nil){
        [aCoder encodeObject:self.tMSSHIPMENTNO forKey:kTmsOrderInfoItemModelTMSSHIPMENTNO];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.dRIVERPAY = [aDecoder decodeObjectForKey:kTmsOrderInfoItemModelDRIVERPAY];
    self.oRDISSUEQTY = [aDecoder decodeObjectForKey:kTmsOrderInfoItemModelORDISSUEQTY];
    self.oRDISSUEVOLUME = [aDecoder decodeObjectForKey:kTmsOrderInfoItemModelORDISSUEVOLUME];
    self.oRDISSUEWEIGHT = [aDecoder decodeObjectForKey:kTmsOrderInfoItemModelORDISSUEWEIGHT];
    self.oRDNO = [aDecoder decodeObjectForKey:kTmsOrderInfoItemModelORDNO];
    self.oRDWORKFLOW = [aDecoder decodeObjectForKey:kTmsOrderInfoItemModelORDWORKFLOW];
    self.tMSDATEISSUE = [aDecoder decodeObjectForKey:kTmsOrderInfoItemModelTMSDATEISSUE];
    self.tMSDATELOAD = [aDecoder decodeObjectForKey:kTmsOrderInfoItemModelTMSDATELOAD];
    self.tMSSHIPMENTNO = [aDecoder decodeObjectForKey:kTmsOrderInfoItemModelTMSSHIPMENTNO];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TmsOrderInfoItemModel *copy = [TmsOrderInfoItemModel new];
    
    copy.dRIVERPAY = [self.dRIVERPAY copy];
    copy.oRDISSUEQTY = [self.oRDISSUEQTY copy];
    copy.oRDISSUEVOLUME = [self.oRDISSUEVOLUME copy];
    copy.oRDISSUEWEIGHT = [self.oRDISSUEWEIGHT copy];
    copy.oRDNO = [self.oRDNO copy];
    copy.oRDWORKFLOW = [self.oRDWORKFLOW copy];
    copy.tMSDATEISSUE = [self.tMSDATEISSUE copy];
    copy.tMSDATELOAD = [self.tMSDATELOAD copy];
    copy.tMSSHIPMENTNO = [self.tMSSHIPMENTNO copy];
    
    return copy;
}

@end
