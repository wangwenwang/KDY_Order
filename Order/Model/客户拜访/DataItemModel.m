//
//  DataItemModel.m
//  downDropMenu
//
//  Created by 凯东源 on 17/6/22.
//  Copyright © 2017年 xx. All rights reserved.
//

#import "DataItemModel.h"


NSString *const kDataItemModelSelected = @"selected";
NSString *const kDataItemModelTitle = @"title";


@implementation DataItemModel


/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kDataItemModelSelected] isKindOfClass:[NSNull class]]){
        self.selected = [dictionary[kDataItemModelSelected] integerValue];
    }
    
    if(![dictionary[kDataItemModelTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kDataItemModelTitle];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kDataItemModelSelected] = @(self.selected);
    if(self.title != nil){
        dictionary[kDataItemModelTitle] = self.title;
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
    [aCoder encodeObject:@(self.selected) forKey:kDataItemModelSelected];	if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kDataItemModelTitle];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.selected = [[aDecoder decodeObjectForKey:kDataItemModelSelected] integerValue];
    self.title = [aDecoder decodeObjectForKey:kDataItemModelTitle];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    DataItemModel *copy = [DataItemModel new];
    
    copy.selected = self.selected;
    copy.title = [self.title copy];
    
    return copy;
}

@end
