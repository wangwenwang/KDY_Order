//
//  TmsOrderListModel.m
//  Order
//
//  Created by 凯东源 on 2018/1/3.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "TmsOrderListModel.h"


NSString *const kTmsOrderListModelTmsOrderItemModel = @"List";


@implementation TmsOrderListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kTmsOrderListModelTmsOrderItemModel] != nil && [dictionary[kTmsOrderListModelTmsOrderItemModel] isKindOfClass:[NSArray class]]){
        NSArray * tmsOrderItemModelDictionaries = dictionary[kTmsOrderListModelTmsOrderItemModel];
        NSMutableArray * tmsOrderItemModelItems = [NSMutableArray array];
        for(NSDictionary * tmsOrderItemModelDictionary in tmsOrderItemModelDictionaries){
            TmsOrderItemModel * tmsOrderItemModelItem = [[TmsOrderItemModel alloc] initWithDictionary:tmsOrderItemModelDictionary];
            [tmsOrderItemModelItems addObject:tmsOrderItemModelItem];
        }
        self.tmsOrderItemModel = tmsOrderItemModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.tmsOrderItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(TmsOrderItemModel * tmsOrderItemModelElement in self.tmsOrderItemModel){
            [dictionaryElements addObject:[tmsOrderItemModelElement toDictionary]];
        }
        dictionary[kTmsOrderListModelTmsOrderItemModel] = dictionaryElements;
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
    if(self.tmsOrderItemModel != nil){
        [aCoder encodeObject:self.tmsOrderItemModel forKey:kTmsOrderListModelTmsOrderItemModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.tmsOrderItemModel = [aDecoder decodeObjectForKey:kTmsOrderListModelTmsOrderItemModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TmsOrderListModel *copy = [TmsOrderListModel new];
    
    copy.tmsOrderItemModel = [self.tmsOrderItemModel copy];
    
    return copy;
}

@end
