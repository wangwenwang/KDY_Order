//
//  CheckStockDetailListModel.m
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "CheckStockDetailListModel.h"


NSString *const kCheckStockDetailListModelCheckStockDetailItemModel = @"TmsList";


@implementation CheckStockDetailListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kCheckStockDetailListModelCheckStockDetailItemModel] != nil && [dictionary[kCheckStockDetailListModelCheckStockDetailItemModel] isKindOfClass:[NSArray class]]){
        NSArray * checkStockDetailItemModelDictionaries = dictionary[kCheckStockDetailListModelCheckStockDetailItemModel];
        NSMutableArray * checkStockDetailItemModelItems = [NSMutableArray array];
        for(NSDictionary * checkStockDetailItemModelDictionary in checkStockDetailItemModelDictionaries){
            CheckStockDetailItemModel * checkStockDetailItemModelItem = [[CheckStockDetailItemModel alloc] initWithDictionary:checkStockDetailItemModelDictionary];
            [checkStockDetailItemModelItems addObject:checkStockDetailItemModelItem];
        }
        self.checkStockDetailItemModel = checkStockDetailItemModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.checkStockDetailItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(CheckStockDetailItemModel * checkStockDetailItemModelElement in self.checkStockDetailItemModel){
            [dictionaryElements addObject:[checkStockDetailItemModelElement toDictionary]];
        }
        dictionary[kCheckStockDetailListModelCheckStockDetailItemModel] = dictionaryElements;
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
    if(self.checkStockDetailItemModel != nil){
        [aCoder encodeObject:self.checkStockDetailItemModel forKey:kCheckStockDetailListModelCheckStockDetailItemModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.checkStockDetailItemModel = [aDecoder decodeObjectForKey:kCheckStockDetailListModelCheckStockDetailItemModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CheckStockDetailListModel *copy = [CheckStockDetailListModel new];
    
    copy.checkStockDetailItemModel = [self.checkStockDetailItemModel copy];
    
    return copy;
}

@end
