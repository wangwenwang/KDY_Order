//
//  CARTotalOrderListModel.m
//  Order
//
//  Created by wenwang wang on 2019/1/9.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CARTotalOrderListModel.h"

NSString *const kCARTotalOrderListModelCARTotalOrderItemModel = @"result";
NSString *const kCARTotalOrderListModelMsg = @"msg";
NSString *const kCARTotalOrderListModelType = @"type";;

@implementation CARTotalOrderListModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kCARTotalOrderListModelCARTotalOrderItemModel] != nil && [dictionary[kCARTotalOrderListModelCARTotalOrderItemModel] isKindOfClass:[NSArray class]]){
        NSArray * cARTotalOrderItemModelDictionaries = dictionary[kCARTotalOrderListModelCARTotalOrderItemModel];
        NSMutableArray * cARTotalOrderItemModelItems = [NSMutableArray array];
        for(NSDictionary * cARTotalOrderItemModelDictionary in cARTotalOrderItemModelDictionaries){
            CARTotalOrderItemModel * cARTotalOrderItemModelItem = [[CARTotalOrderItemModel alloc] initWithDictionary:cARTotalOrderItemModelDictionary];
            [cARTotalOrderItemModelItems addObject:cARTotalOrderItemModelItem];
        }
        self.cARTotalOrderItemModel = cARTotalOrderItemModelItems;
    }
    if(![dictionary[kCARTotalOrderListModelMsg] isKindOfClass:[NSNull class]]){
        self.msg = dictionary[kCARTotalOrderListModelMsg];
    }
    if(![dictionary[kCARTotalOrderListModelType] isKindOfClass:[NSNull class]]){
        self.type = dictionary[kCARTotalOrderListModelType];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.cARTotalOrderItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(CARTotalOrderItemModel * cARTotalOrderItemModelElement in self.cARTotalOrderItemModel){
            [dictionaryElements addObject:[cARTotalOrderItemModelElement toDictionary]];
        }
        dictionary[kCARTotalOrderListModelCARTotalOrderItemModel] = dictionaryElements;
    }
    if(self.msg != nil){
        dictionary[kCARTotalOrderListModelMsg] = self.msg;
    }
    if(self.type != nil){
        dictionary[kCARTotalOrderListModelType] = self.type;
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
    if(self.cARTotalOrderItemModel != nil){
        [aCoder encodeObject:self.cARTotalOrderItemModel forKey:kCARTotalOrderListModelCARTotalOrderItemModel];
    }
    if(self.msg != nil){
        [aCoder encodeObject:self.msg forKey:kCARTotalOrderListModelMsg];
    }
    if(self.type != nil){
        [aCoder encodeObject:self.type forKey:kCARTotalOrderListModelType];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.cARTotalOrderItemModel = [aDecoder decodeObjectForKey:kCARTotalOrderListModelCARTotalOrderItemModel];
    self.msg = [aDecoder decodeObjectForKey:kCARTotalOrderListModelMsg];
    self.type = [aDecoder decodeObjectForKey:kCARTotalOrderListModelType];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CARTotalOrderListModel *copy = [CARTotalOrderListModel new];
    
    copy.cARTotalOrderItemModel = [self.cARTotalOrderItemModel copy];
    copy.msg = [self.msg copy];
    copy.type = [self.type copy];
    
    return copy;
}

@end
