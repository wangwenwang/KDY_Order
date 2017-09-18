//
//  InputInfoListModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "InputInfoListModel.h"


NSString *const kInputInfoListModelInputInfoModel = @"Info";
NSString *const kInputInfoListModelInputItemModel = @"List";


@implementation InputInfoListModel
-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kInputInfoListModelInputInfoModel] isKindOfClass:[NSNull class]]){
        self.inputInfoModel = [[InputInfoModel alloc] initWithDictionary:dictionary[kInputInfoListModelInputInfoModel]];
    }
    
    if(dictionary[kInputInfoListModelInputItemModel] != nil && [dictionary[kInputInfoListModelInputItemModel] isKindOfClass:[NSArray class]]){
        NSArray * inputItemModelDictionaries = dictionary[kInputInfoListModelInputItemModel];
        NSMutableArray * inputItemModelItems = [NSMutableArray array];
        for(NSDictionary * inputItemModelDictionary in inputItemModelDictionaries){
            InputItemModel * inputItemModelItem = [[InputItemModel alloc] initWithDictionary:inputItemModelDictionary];
            [inputItemModelItems addObject:inputItemModelItem];
        }
        self.inputItemModel = inputItemModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.inputInfoModel != nil){
        dictionary[kInputInfoListModelInputInfoModel] = [self.inputInfoModel toDictionary];
    }
    if(self.inputItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(InputItemModel * inputItemModelElement in self.inputItemModel){
            [dictionaryElements addObject:[inputItemModelElement toDictionary]];
        }
        dictionary[kInputInfoListModelInputItemModel] = dictionaryElements;
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
    if(self.inputInfoModel != nil){
        [aCoder encodeObject:self.inputInfoModel forKey:kInputInfoListModelInputInfoModel];
    }
    if(self.inputItemModel != nil){
        [aCoder encodeObject:self.inputItemModel forKey:kInputInfoListModelInputItemModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.inputInfoModel = [aDecoder decodeObjectForKey:kInputInfoListModelInputInfoModel];
    self.inputItemModel = [aDecoder decodeObjectForKey:kInputInfoListModelInputItemModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    InputInfoListModel *copy = [InputInfoListModel new];
    
    copy.inputInfoModel = [self.inputInfoModel copy];
    copy.inputItemModel = [self.inputItemModel copy];
    
    return copy;
}

@end
