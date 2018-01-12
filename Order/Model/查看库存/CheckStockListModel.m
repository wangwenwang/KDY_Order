//
//  CheckStockListModel.m
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "CheckStockListModel.h"


NSString *const kCheckStockListModelCheckStockItemModel = @"TmsList";


@implementation CheckStockListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kCheckStockListModelCheckStockItemModel] != nil && [dictionary[kCheckStockListModelCheckStockItemModel] isKindOfClass:[NSArray class]]){
        NSArray * checkStockItemModelDictionaries = dictionary[kCheckStockListModelCheckStockItemModel];
        NSMutableArray * checkStockItemModelItems = [NSMutableArray array];
        for(NSDictionary * checkStockItemModelDictionary in checkStockItemModelDictionaries){
            CheckStockItemModel * checkStockItemModelItem = [[CheckStockItemModel alloc] initWithDictionary:checkStockItemModelDictionary];
            [checkStockItemModelItems addObject:checkStockItemModelItem];
        }
        self.checkStockItemModel = checkStockItemModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.checkStockItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(CheckStockItemModel * checkStockItemModelElement in self.checkStockItemModel){
            [dictionaryElements addObject:[checkStockItemModelElement toDictionary]];
        }
        dictionary[kCheckStockListModelCheckStockItemModel] = dictionaryElements;
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
    if(self.checkStockItemModel != nil){
        [aCoder encodeObject:self.checkStockItemModel forKey:kCheckStockListModelCheckStockItemModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.checkStockItemModel = [aDecoder decodeObjectForKey:kCheckStockListModelCheckStockItemModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CheckStockListModel *copy = [CheckStockListModel new];
    
    copy.checkStockItemModel = [self.checkStockItemModel copy];
    
    return copy;
}

@end
