//
//  StockNoWaterListModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockNoWaterListModel.h"


NSString *const kStockNoWaterListModelStockNoWaterInfoModel = @"List";
NSString *const kStockNoWaterListModelStockNoWaterItemModel = @"Info";


@implementation StockNoWaterListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kStockNoWaterListModelStockNoWaterInfoModel] isKindOfClass:[NSNull class]]){
        self.stockNoWaterInfoModel = [[StockNoWaterInfoModel alloc] initWithDictionary:dictionary[kStockNoWaterListModelStockNoWaterInfoModel]];
    }
    
    if(dictionary[kStockNoWaterListModelStockNoWaterItemModel] != nil && [dictionary[kStockNoWaterListModelStockNoWaterItemModel] isKindOfClass:[NSArray class]]){
        NSArray * stockNoWaterItemModelDictionaries = dictionary[kStockNoWaterListModelStockNoWaterItemModel];
        NSMutableArray * stockNoWaterItemModelItems = [NSMutableArray array];
        for(NSDictionary * stockNoWaterItemModelDictionary in stockNoWaterItemModelDictionaries){
            StockNoWaterItemModel * stockNoWaterItemModelItem = [[StockNoWaterItemModel alloc] initWithDictionary:stockNoWaterItemModelDictionary];
            [stockNoWaterItemModelItems addObject:stockNoWaterItemModelItem];
        }
        self.stockNoWaterItemModel = stockNoWaterItemModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.stockNoWaterInfoModel != nil){
        dictionary[kStockNoWaterListModelStockNoWaterInfoModel] = [self.stockNoWaterInfoModel toDictionary];
    }
    if(self.stockNoWaterItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(StockNoWaterItemModel * stockNoWaterItemModelElement in self.stockNoWaterItemModel){
            [dictionaryElements addObject:[stockNoWaterItemModelElement toDictionary]];
        }
        dictionary[kStockNoWaterListModelStockNoWaterItemModel] = dictionaryElements;
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
    if(self.stockNoWaterInfoModel != nil){
        [aCoder encodeObject:self.stockNoWaterInfoModel forKey:kStockNoWaterListModelStockNoWaterInfoModel];
    }
    if(self.stockNoWaterItemModel != nil){
        [aCoder encodeObject:self.stockNoWaterItemModel forKey:kStockNoWaterListModelStockNoWaterItemModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.stockNoWaterInfoModel = [aDecoder decodeObjectForKey:kStockNoWaterListModelStockNoWaterInfoModel];
    self.stockNoWaterItemModel = [aDecoder decodeObjectForKey:kStockNoWaterListModelStockNoWaterItemModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    StockNoWaterListModel *copy = [StockNoWaterListModel new];
    
    copy.stockNoWaterInfoModel = [self.stockNoWaterInfoModel copy];
    copy.stockNoWaterItemModel = [self.stockNoWaterItemModel copy];
    
    return copy;
}

@end
