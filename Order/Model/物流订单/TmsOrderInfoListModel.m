//
//  TmsOrderInfoListModel.m
//  Order
//
//  Created by 凯东源 on 2018/1/4.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "TmsOrderInfoListModel.h"


NSString *const kTmsOrderInfoListModelTmsOrderInfoItemModel = @"TmsOrderInfoItemModel";


@implementation TmsOrderInfoListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kTmsOrderInfoListModelTmsOrderInfoItemModel] != nil && [dictionary[kTmsOrderInfoListModelTmsOrderInfoItemModel] isKindOfClass:[NSArray class]]){
        NSArray * tmsOrderInfoItemModelDictionaries = dictionary[kTmsOrderInfoListModelTmsOrderInfoItemModel];
        NSMutableArray * tmsOrderInfoItemModelItems = [NSMutableArray array];
        for(NSDictionary * tmsOrderInfoItemModelDictionary in tmsOrderInfoItemModelDictionaries){
            TmsOrderInfoItemModel * tmsOrderInfoItemModelItem = [[TmsOrderInfoItemModel alloc] initWithDictionary:tmsOrderInfoItemModelDictionary];
            [tmsOrderInfoItemModelItems addObject:tmsOrderInfoItemModelItem];
        }
        self.tmsOrderInfoItemModel = tmsOrderInfoItemModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.tmsOrderInfoItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(TmsOrderInfoItemModel * tmsOrderInfoItemModelElement in self.tmsOrderInfoItemModel){
            [dictionaryElements addObject:[tmsOrderInfoItemModelElement toDictionary]];
        }
        dictionary[kTmsOrderInfoListModelTmsOrderInfoItemModel] = dictionaryElements;
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
    if(self.tmsOrderInfoItemModel != nil){
        [aCoder encodeObject:self.tmsOrderInfoItemModel forKey:kTmsOrderInfoListModelTmsOrderInfoItemModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.tmsOrderInfoItemModel = [aDecoder decodeObjectForKey:kTmsOrderInfoListModelTmsOrderInfoItemModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TmsOrderInfoListModel *copy = [TmsOrderInfoListModel new];
    
    copy.tmsOrderInfoItemModel = [self.tmsOrderInfoItemModel copy];
    
    return copy;
}

@end
