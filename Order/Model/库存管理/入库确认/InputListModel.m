//
//  InputListModel.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "InputListModel.h"


NSString *const kInputListModelInputModel = @"List";


@implementation InputListModel
-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kInputListModelInputModel] != nil && [dictionary[kInputListModelInputModel] isKindOfClass:[NSArray class]]){
        NSArray * inputModelDictionaries = dictionary[kInputListModelInputModel];
        NSMutableArray * inputModelItems = [NSMutableArray array];
        for(NSDictionary * inputModelDictionary in inputModelDictionaries){
            InputModel * inputModelItem = [[InputModel alloc] initWithDictionary:inputModelDictionary];
            [inputModelItems addObject:inputModelItem];
        }
        self.inputModel = inputModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.inputModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(InputModel * inputModelElement in self.inputModel){
            [dictionaryElements addObject:[inputModelElement toDictionary]];
        }
        dictionary[kInputListModelInputModel] = dictionaryElements;
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
    if(self.inputModel != nil){
        [aCoder encodeObject:self.inputModel forKey:kInputListModelInputModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.inputModel = [aDecoder decodeObjectForKey:kInputListModelInputModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    InputListModel *copy = [InputListModel new];
    
    copy.inputModel = [self.inputModel copy];
    
    return copy;
}

@end
