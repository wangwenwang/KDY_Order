//
//  GetPartyVisitCBXItemModel.m
//  Order
//
//  Created by wenwang wang on 2018/10/31.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitCBXItemModel.h"

NSString *const kFREQUENCYIDX = @"IDX";
NSString *const kFREQUENCYITEMNAME = @"ITEM_NAME";

@implementation GetPartyVisitCBXItemModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kFREQUENCYIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kFREQUENCYIDX];
    }
    if(![dictionary[kFREQUENCYITEMNAME] isKindOfClass:[NSNull class]]){
        self.iTEMNAME = dictionary[kFREQUENCYITEMNAME];
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
        dictionary[kFREQUENCYIDX] = self.iDX;
    }
    if(self.iTEMNAME != nil){
        dictionary[kFREQUENCYITEMNAME] = self.iTEMNAME;
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
        [aCoder encodeObject:self.iDX forKey:kFREQUENCYIDX];
    }
    if(self.iTEMNAME != nil){
        [aCoder encodeObject:self.iTEMNAME forKey:kFREQUENCYITEMNAME];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.iDX = [aDecoder decodeObjectForKey:kFREQUENCYIDX];
    self.iTEMNAME = [aDecoder decodeObjectForKey:kFREQUENCYITEMNAME];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    GetPartyVisitCBXItemModel *copy = [GetPartyVisitCBXItemModel new];
    
    copy.iDX = [self.iDX copy];
    copy.iTEMNAME = [self.iTEMNAME copy];
    
    return copy;
}

@end
