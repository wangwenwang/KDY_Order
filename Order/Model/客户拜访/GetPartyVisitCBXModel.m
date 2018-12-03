//
//  GetPartyVisitCBXModel.m
//  Order
//
//  Created by wenwang wang on 2018/10/31.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitCBXModel.h"


NSString *const kGetPartyVisitCBXModelFREQUENCY = @"FREQUENCY";
NSString *const kGetPartyVisitCBXModelLEVEL = @"LEVEL";
NSString *const kGetPartyVisitCBXModelORG = @"ORG";
NSString *const kGetPartyVisitCBXModelSTATES = @"STATES";


@implementation GetPartyVisitCBXModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kGetPartyVisitCBXModelFREQUENCY] != nil && [dictionary[kGetPartyVisitCBXModelFREQUENCY] isKindOfClass:[NSArray class]]){
        NSArray * fREQUENCYDictionaries = dictionary[kGetPartyVisitCBXModelFREQUENCY];
        NSMutableArray * fREQUENCYItems = [NSMutableArray array];
        for(NSDictionary * fREQUENCYDictionary in fREQUENCYDictionaries){
            GetPartyVisitCBXItemModel * fREQUENCYItem = [[GetPartyVisitCBXItemModel alloc] initWithDictionary:fREQUENCYDictionary];
            [fREQUENCYItems addObject:fREQUENCYItem];
        }
        self.fREQUENCY = fREQUENCYItems;
    }
    if(dictionary[kGetPartyVisitCBXModelLEVEL] != nil && [dictionary[kGetPartyVisitCBXModelLEVEL] isKindOfClass:[NSArray class]]){
        NSArray * lEVELDictionaries = dictionary[kGetPartyVisitCBXModelLEVEL];
        NSMutableArray * lEVELItems = [NSMutableArray array];
        for(NSDictionary * lEVELDictionary in lEVELDictionaries){
            GetPartyVisitCBXItemModel * lEVELItem = [[GetPartyVisitCBXItemModel alloc] initWithDictionary:lEVELDictionary];
            [lEVELItems addObject:lEVELItem];
        }
        self.lEVEL = lEVELItems;
    }
    if(dictionary[kGetPartyVisitCBXModelORG] != nil && [dictionary[kGetPartyVisitCBXModelORG] isKindOfClass:[NSArray class]]){
        NSArray * oRGDictionaries = dictionary[kGetPartyVisitCBXModelORG];
        NSMutableArray * oRGItems = [NSMutableArray array];
        for(NSDictionary * oRGDictionary in oRGDictionaries){
            GetPartyVisitCBXItemModel * oRGItem = [[GetPartyVisitCBXItemModel alloc] initWithDictionary:oRGDictionary];
            [oRGItems addObject:oRGItem];
        }
        self.oRG = oRGItems;
    }
    if(dictionary[kGetPartyVisitCBXModelSTATES] != nil && [dictionary[kGetPartyVisitCBXModelSTATES] isKindOfClass:[NSArray class]]){
        NSArray * sTATESDictionaries = dictionary[kGetPartyVisitCBXModelSTATES];
        NSMutableArray * sTATESItems = [NSMutableArray array];
        for(NSDictionary * sTATESDictionary in sTATESDictionaries){
            GetPartyVisitCBXItemModel * sTATESItem = [[GetPartyVisitCBXItemModel alloc] initWithDictionary:sTATESDictionary];
            [sTATESItems addObject:sTATESItem];
        }
        self.sTATES = sTATESItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.fREQUENCY != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(GetPartyVisitCBXItemModel * fREQUENCYElement in self.fREQUENCY){
            [dictionaryElements addObject:[fREQUENCYElement toDictionary]];
        }
        dictionary[kGetPartyVisitCBXModelFREQUENCY] = dictionaryElements;
    }
    if(self.lEVEL != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(GetPartyVisitCBXItemModel * lEVELElement in self.lEVEL){
            [dictionaryElements addObject:[lEVELElement toDictionary]];
        }
        dictionary[kGetPartyVisitCBXModelLEVEL] = dictionaryElements;
    }
    if(self.oRG != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(GetPartyVisitCBXItemModel * oRGElement in self.oRG){
            [dictionaryElements addObject:[oRGElement toDictionary]];
        }
        dictionary[kGetPartyVisitCBXModelORG] = dictionaryElements;
    }
    if(self.sTATES != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(GetPartyVisitCBXItemModel * sTATESElement in self.sTATES){
            [dictionaryElements addObject:[sTATESElement toDictionary]];
        }
        dictionary[kGetPartyVisitCBXModelSTATES] = dictionaryElements;
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
    if(self.fREQUENCY != nil){
        [aCoder encodeObject:self.fREQUENCY forKey:kGetPartyVisitCBXModelFREQUENCY];
    }
    if(self.lEVEL != nil){
        [aCoder encodeObject:self.lEVEL forKey:kGetPartyVisitCBXModelLEVEL];
    }
    if(self.oRG != nil){
        [aCoder encodeObject:self.oRG forKey:kGetPartyVisitCBXModelORG];
    }
    if(self.sTATES != nil){
        [aCoder encodeObject:self.sTATES forKey:kGetPartyVisitCBXModelSTATES];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.fREQUENCY = [aDecoder decodeObjectForKey:kGetPartyVisitCBXModelFREQUENCY];
    self.lEVEL = [aDecoder decodeObjectForKey:kGetPartyVisitCBXModelLEVEL];
    self.oRG = [aDecoder decodeObjectForKey:kGetPartyVisitCBXModelORG];
    self.sTATES = [aDecoder decodeObjectForKey:kGetPartyVisitCBXModelSTATES];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    GetPartyVisitCBXModel *copy = [GetPartyVisitCBXModel new];
    
    copy.fREQUENCY = [self.fREQUENCY copy];
    copy.lEVEL = [self.lEVEL copy];
    copy.oRG = [self.oRG copy];
    copy.sTATES = [self.sTATES copy];
    
    return copy;
}
@end
