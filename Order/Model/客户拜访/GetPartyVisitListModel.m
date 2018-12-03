//
//  GetPartyVisitListModel.m
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitListModel.h"

NSString *const kGetPartyVisitListModelMsg = @"msg";
NSString *const kGetPartyVisitListModelType = @"type";
NSString *const kGetPartyVisitListModelGetPartyVisitItemModel = @"result";

@implementation GetPartyVisitListModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kGetPartyVisitListModelGetPartyVisitItemModel] != nil && [dictionary[kGetPartyVisitListModelGetPartyVisitItemModel] isKindOfClass:[NSArray class]]){
        NSArray * getPartyVisitItemModelDictionaries = dictionary[kGetPartyVisitListModelGetPartyVisitItemModel];
        NSMutableArray * getPartyVisitItemModelItems = [NSMutableArray array];
        for(NSDictionary * getPartyVisitItemModelDictionary in getPartyVisitItemModelDictionaries){
            GetPartyVisitItemModel * getPartyVisitItemModelItem = [[GetPartyVisitItemModel alloc] initWithDictionary:getPartyVisitItemModelDictionary];
            [getPartyVisitItemModelItems addObject:getPartyVisitItemModelItem];
        }
        self.getPartyVisitItemModel = getPartyVisitItemModelItems;
    }
    if(![dictionary[kGetPartyVisitListModelMsg] isKindOfClass:[NSNull class]]){
        self.msg = dictionary[kGetPartyVisitListModelMsg];
    }
    if(![dictionary[kGetPartyVisitListModelType] isKindOfClass:[NSNull class]]){
        self.type = dictionary[kGetPartyVisitListModelType];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.getPartyVisitItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(GetPartyVisitItemModel * getPartyVisitItemModelElement in self.getPartyVisitItemModel){
            [dictionaryElements addObject:[getPartyVisitItemModelElement toDictionary]];
        }
        dictionary[kGetPartyVisitListModelGetPartyVisitItemModel] = dictionaryElements;
    }
    if(self.msg != nil){
        dictionary[kGetPartyVisitListModelMsg] = self.msg;
    }
    if(self.type != nil){
        dictionary[kGetPartyVisitListModelType] = self.type;
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
    if(self.getPartyVisitItemModel != nil){
        [aCoder encodeObject:self.getPartyVisitItemModel forKey:kGetPartyVisitListModelGetPartyVisitItemModel];
    }
    if(self.msg != nil){
        [aCoder encodeObject:self.msg forKey:kGetPartyVisitListModelMsg];
    }
    if(self.type != nil){
        [aCoder encodeObject:self.type forKey:kGetPartyVisitListModelType];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.getPartyVisitItemModel = [aDecoder decodeObjectForKey:kGetPartyVisitListModelGetPartyVisitItemModel];
    self.msg = [aDecoder decodeObjectForKey:kGetPartyVisitListModelMsg];
    self.type = [aDecoder decodeObjectForKey:kGetPartyVisitListModelType];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    GetPartyVisitListModel *copy = [GetPartyVisitListModel new];
    
    copy.getPartyVisitItemModel = [self.getPartyVisitItemModel copy];
    copy.msg = [self.msg copy];
    copy.type = [self.type copy];
    
    return copy;
}
@end
