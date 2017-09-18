//
//  StockProductListModel.m
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockProductListModel.h"


NSString *const kStockProductListModelStockProductModel = @"List";


@implementation StockProductListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kStockProductListModelStockProductModel] != nil && [dictionary[kStockProductListModelStockProductModel] isKindOfClass:[NSArray class]]){
        NSArray * stockProductModelDictionaries = dictionary[kStockProductListModelStockProductModel];
        NSMutableArray * stockProductModelItems = [NSMutableArray array];
        for(NSDictionary * stockProductModelDictionary in stockProductModelDictionaries){
            StockProductModel * stockProductModelItem = [[StockProductModel alloc] initWithDictionary:stockProductModelDictionary];
            [stockProductModelItems addObject:stockProductModelItem];
        }
        self.stockProductModel = stockProductModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.stockProductModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(StockProductModel * stockProductModelElement in self.stockProductModel){
            [dictionaryElements addObject:[stockProductModelElement toDictionary]];
        }
        dictionary[kStockProductListModelStockProductModel] = dictionaryElements;
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
    if(self.stockProductModel != nil){
        [aCoder encodeObject:self.stockProductModel forKey:kStockProductListModelStockProductModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.stockProductModel = [aDecoder decodeObjectForKey:kStockProductListModelStockProductModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    StockProductListModel *copy = [StockProductListModel new];
    
    copy.stockProductModel = [self.stockProductModel copy];
    
    return copy;
}

@end
