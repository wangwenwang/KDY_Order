//
//  StockNoListModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockNoListModel.h"


NSString *const kStockNoListModelStockNoInfoModel = @"List";
NSString *const kStockNoListModelStockNoItemModel = @"Info";


@implementation StockNoListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kStockNoListModelStockNoInfoModel] isKindOfClass:[NSNull class]]){
        self.stockNoInfoModel = [[StockNoInfoModel alloc] initWithDictionary:dictionary[kStockNoListModelStockNoInfoModel]];
    }
    
    if(dictionary[kStockNoListModelStockNoItemModel] != nil && [dictionary[kStockNoListModelStockNoItemModel] isKindOfClass:[NSArray class]]){
        NSArray * stockNoItemModelDictionaries = dictionary[kStockNoListModelStockNoItemModel];
        NSMutableArray * stockNoItemModelItems = [NSMutableArray array];
        for(NSDictionary * stockNoItemModelDictionary in stockNoItemModelDictionaries){
            StockNoItemModel * stockNoItemModelItem = [[StockNoItemModel alloc] initWithDictionary:stockNoItemModelDictionary];
            [stockNoItemModelItems addObject:stockNoItemModelItem];
        }
        self.stockNoItemModel = stockNoItemModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.stockNoInfoModel != nil){
        dictionary[kStockNoListModelStockNoInfoModel] = [self.stockNoInfoModel toDictionary];
    }
    if(self.stockNoItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(StockNoItemModel * stockNoItemModelElement in self.stockNoItemModel){
            [dictionaryElements addObject:[stockNoItemModelElement toDictionary]];
        }
        dictionary[kStockNoListModelStockNoItemModel] = dictionaryElements;
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
    if(self.stockNoInfoModel != nil){
        [aCoder encodeObject:self.stockNoInfoModel forKey:kStockNoListModelStockNoInfoModel];
    }
    if(self.stockNoItemModel != nil){
        [aCoder encodeObject:self.stockNoItemModel forKey:kStockNoListModelStockNoItemModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.stockNoInfoModel = [aDecoder decodeObjectForKey:kStockNoListModelStockNoInfoModel];
    self.stockNoItemModel = [aDecoder decodeObjectForKey:kStockNoListModelStockNoItemModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    StockNoListModel *copy = [StockNoListModel new];
    
    copy.stockNoInfoModel = [self.stockNoInfoModel copy];
    copy.stockNoItemModel = [self.stockNoItemModel copy];
    
    return copy;
}

@end
