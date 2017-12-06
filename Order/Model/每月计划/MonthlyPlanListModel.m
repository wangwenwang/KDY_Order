//
//  MonthlyPlanListModel.m
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "MonthlyPlanListModel.h"


NSString *const kMonthlyPlanListModelMonthlyPlanModel = @"result";
NSString *const kMonthlyPlanListModelMsg = @"msg";
NSString *const kMonthlyPlanListModelType = @"type";


@implementation MonthlyPlanListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kMonthlyPlanListModelMonthlyPlanModel] != nil && [dictionary[kMonthlyPlanListModelMonthlyPlanModel] isKindOfClass:[NSArray class]]){
        NSArray * monthlyPlanModelDictionaries = dictionary[kMonthlyPlanListModelMonthlyPlanModel];
        NSMutableArray * monthlyPlanModelItems = [NSMutableArray array];
        for(NSDictionary * monthlyPlanModelDictionary in monthlyPlanModelDictionaries){
            MonthlyPlanModel * monthlyPlanModelItem = [[MonthlyPlanModel alloc] initWithDictionary:monthlyPlanModelDictionary];
            [monthlyPlanModelItems addObject:monthlyPlanModelItem];
        }
        self.monthlyPlanModel = monthlyPlanModelItems;
    }
    if(![dictionary[kMonthlyPlanListModelMsg] isKindOfClass:[NSNull class]]){
        self.msg = dictionary[kMonthlyPlanListModelMsg];
    }
    if(![dictionary[kMonthlyPlanListModelType] isKindOfClass:[NSNull class]]){
        self.type = dictionary[kMonthlyPlanListModelType];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.monthlyPlanModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(MonthlyPlanModel * monthlyPlanModelElement in self.monthlyPlanModel){
            [dictionaryElements addObject:[monthlyPlanModelElement toDictionary]];
        }
        dictionary[kMonthlyPlanListModelMonthlyPlanModel] = dictionaryElements;
    }
    if(self.msg != nil){
        dictionary[kMonthlyPlanListModelMsg] = self.msg;
    }
    if(self.type != nil){
        dictionary[kMonthlyPlanListModelType] = self.type;
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
    if(self.monthlyPlanModel != nil){
        [aCoder encodeObject:self.monthlyPlanModel forKey:kMonthlyPlanListModelMonthlyPlanModel];
    }
    if(self.msg != nil){
        [aCoder encodeObject:self.msg forKey:kMonthlyPlanListModelMsg];
    }
    if(self.type != nil){
        [aCoder encodeObject:self.type forKey:kMonthlyPlanListModelType];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.monthlyPlanModel = [aDecoder decodeObjectForKey:kMonthlyPlanListModelMonthlyPlanModel];
    self.msg = [aDecoder decodeObjectForKey:kMonthlyPlanListModelMsg];
    self.type = [aDecoder decodeObjectForKey:kMonthlyPlanListModelType];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    MonthlyPlanListModel *copy = [MonthlyPlanListModel new];
    
    copy.monthlyPlanModel = [self.monthlyPlanModel copy];
    copy.msg = [self.msg copy];
    copy.type = [self.type copy];
    
    return copy;
}

@end
