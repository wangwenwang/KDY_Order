//
//  CARTotalOrderDetailListModel.m
//  Order
//
//  Created by wenwang wang on 2019/1/22.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CARTotalOrderDetailListModel.h"


NSString *const kCARTotalOrderDetailListModelCARTotalOrderDetailItemModel = @"result";
NSString *const kCARTotalOrderDetailListModelMsg = @"msg";
NSString *const kCARTotalOrderDetailListModelType = @"type";


@implementation CARTotalOrderDetailListModel
/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kCARTotalOrderDetailListModelCARTotalOrderDetailItemModel] != nil && [dictionary[kCARTotalOrderDetailListModelCARTotalOrderDetailItemModel] isKindOfClass:[NSArray class]]){
        NSArray * cARTotalOrderDetailItemModelDictionaries = dictionary[kCARTotalOrderDetailListModelCARTotalOrderDetailItemModel];
        NSMutableArray * cARTotalOrderDetailItemModelItems = [NSMutableArray array];
        for(NSDictionary * cARTotalOrderDetailItemModelDictionary in cARTotalOrderDetailItemModelDictionaries){
            CARTotalOrderDetailItemModel * cARTotalOrderDetailItemModelItem = [[CARTotalOrderDetailItemModel alloc] initWithDictionary:cARTotalOrderDetailItemModelDictionary];
            [cARTotalOrderDetailItemModelItems addObject:cARTotalOrderDetailItemModelItem];
        }
        self.cARTotalOrderDetailItemModel = cARTotalOrderDetailItemModelItems;
    }
    if(![dictionary[kCARTotalOrderDetailListModelMsg] isKindOfClass:[NSNull class]]){
        self.msg = dictionary[kCARTotalOrderDetailListModelMsg];
    }
    if(![dictionary[kCARTotalOrderDetailListModelType] isKindOfClass:[NSNull class]]){
        self.type = dictionary[kCARTotalOrderDetailListModelType];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.cARTotalOrderDetailItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(CARTotalOrderDetailItemModel * cARTotalOrderDetailItemModelElement in self.cARTotalOrderDetailItemModel){
            [dictionaryElements addObject:[cARTotalOrderDetailItemModelElement toDictionary]];
        }
        dictionary[kCARTotalOrderDetailListModelCARTotalOrderDetailItemModel] = dictionaryElements;
    }
    if(self.msg != nil){
        dictionary[kCARTotalOrderDetailListModelMsg] = self.msg;
    }
    if(self.type != nil){
        dictionary[kCARTotalOrderDetailListModelType] = self.type;
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
    if(self.cARTotalOrderDetailItemModel != nil){
        [aCoder encodeObject:self.cARTotalOrderDetailItemModel forKey:kCARTotalOrderDetailListModelCARTotalOrderDetailItemModel];
    }
    if(self.msg != nil){
        [aCoder encodeObject:self.msg forKey:kCARTotalOrderDetailListModelMsg];
    }
    if(self.type != nil){
        [aCoder encodeObject:self.type forKey:kCARTotalOrderDetailListModelType];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.cARTotalOrderDetailItemModel = [aDecoder decodeObjectForKey:kCARTotalOrderDetailListModelCARTotalOrderDetailItemModel];
    self.msg = [aDecoder decodeObjectForKey:kCARTotalOrderDetailListModelMsg];
    self.type = [aDecoder decodeObjectForKey:kCARTotalOrderDetailListModelType];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CARTotalOrderDetailListModel *copy = [CARTotalOrderDetailListModel new];
    
    copy.cARTotalOrderDetailItemModel = [self.cARTotalOrderDetailItemModel copy];
    copy.msg = [self.msg copy];
    copy.type = [self.type copy];
    
    return copy;
}


@end
