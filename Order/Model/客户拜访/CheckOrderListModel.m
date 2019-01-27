//
//  CheckOrderListModel.m
//  Order
//
//  Created by wenwang wang on 2019/1/25.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CheckOrderListModel.h"


NSString *const kCheckOrderListModelCheckOrderItemModel = @"List";


@implementation CheckOrderListModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kCheckOrderListModelCheckOrderItemModel] != nil && [dictionary[kCheckOrderListModelCheckOrderItemModel] isKindOfClass:[NSArray class]]){
        NSArray * checkOrderItemModelDictionaries = dictionary[kCheckOrderListModelCheckOrderItemModel];
        NSMutableArray * checkOrderItemModelItems = [NSMutableArray array];
        for(NSDictionary * checkOrderItemModelDictionary in checkOrderItemModelDictionaries){
            CheckOrderItemModel * checkOrderItemModelItem = [[CheckOrderItemModel alloc] initWithDictionary:checkOrderItemModelDictionary];
            [checkOrderItemModelItems addObject:checkOrderItemModelItem];
        }
        self.checkOrderItemModel = checkOrderItemModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.checkOrderItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(CheckOrderItemModel * checkOrderItemModelElement in self.checkOrderItemModel){
            [dictionaryElements addObject:[checkOrderItemModelElement toDictionary]];
        }
        dictionary[kCheckOrderListModelCheckOrderItemModel] = dictionaryElements;
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
    if(self.checkOrderItemModel != nil){
        [aCoder encodeObject:self.checkOrderItemModel forKey:kCheckOrderListModelCheckOrderItemModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.checkOrderItemModel = [aDecoder decodeObjectForKey:kCheckOrderListModelCheckOrderItemModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CheckOrderListModel *copy = [CheckOrderListModel new];
    
    copy.checkOrderItemModel = [self.checkOrderItemModel copy];
    
    return copy;
}

@end
