//
//  CheckStockItemModel.m
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "CheckStockItemModel.h"


NSString *const kCheckStockItemModelQTY = @"QTY";
NSString *const kCheckStockItemModelQTYALLOCATED = @"QTYALLOCATED";
NSString *const kCheckStockItemModelWeiQTYALLOCATED = @"WeiQTYALLOCATED";
NSString *const kCheckStockItemModelDescr = @"descr";
NSString *const kCheckStockItemModelKesum = @"kesum";
NSString *const kCheckStockItemModelSku = @"sku";
NSString *const kCheckStockItemModelSusr2 = @"susr2";


@implementation CheckStockItemModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kCheckStockItemModelQTY] isKindOfClass:[NSNull class]]){
        self.qTY = dictionary[kCheckStockItemModelQTY];
    }
    if(![dictionary[kCheckStockItemModelQTYALLOCATED] isKindOfClass:[NSNull class]]){
        self.qTYALLOCATED = dictionary[kCheckStockItemModelQTYALLOCATED];
    }
    if(![dictionary[kCheckStockItemModelWeiQTYALLOCATED] isKindOfClass:[NSNull class]]){
        self.weiQTYALLOCATED = dictionary[kCheckStockItemModelWeiQTYALLOCATED];
    }
    if(![dictionary[kCheckStockItemModelDescr] isKindOfClass:[NSNull class]]){
        self.descr = dictionary[kCheckStockItemModelDescr];
    }
    if(![dictionary[kCheckStockItemModelKesum] isKindOfClass:[NSNull class]]){
        self.kesum = dictionary[kCheckStockItemModelKesum];
    }
    if(![dictionary[kCheckStockItemModelSku] isKindOfClass:[NSNull class]]){
        self.sku = dictionary[kCheckStockItemModelSku];
    }
    if(![dictionary[kCheckStockItemModelSusr2] isKindOfClass:[NSNull class]]){
        self.susr2 = dictionary[kCheckStockItemModelSusr2];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.qTY != nil){
        dictionary[kCheckStockItemModelQTY] = self.qTY;
    }
    if(self.qTYALLOCATED != nil){
        dictionary[kCheckStockItemModelQTYALLOCATED] = self.qTYALLOCATED;
    }
    if(self.weiQTYALLOCATED != nil){
        dictionary[kCheckStockItemModelWeiQTYALLOCATED] = self.weiQTYALLOCATED;
    }
    if(self.descr != nil){
        dictionary[kCheckStockItemModelDescr] = self.descr;
    }
    if(self.kesum != nil){
        dictionary[kCheckStockItemModelKesum] = self.kesum;
    }
    if(self.sku != nil){
        dictionary[kCheckStockItemModelSku] = self.sku;
    }
    if(self.susr2 != nil){
        dictionary[kCheckStockItemModelSusr2] = self.susr2;
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
    if(self.qTY != nil){
        [aCoder encodeObject:self.qTY forKey:kCheckStockItemModelQTY];
    }
    if(self.qTYALLOCATED != nil){
        [aCoder encodeObject:self.qTYALLOCATED forKey:kCheckStockItemModelQTYALLOCATED];
    }
    if(self.weiQTYALLOCATED != nil){
        [aCoder encodeObject:self.weiQTYALLOCATED forKey:kCheckStockItemModelWeiQTYALLOCATED];
    }
    if(self.descr != nil){
        [aCoder encodeObject:self.descr forKey:kCheckStockItemModelDescr];
    }
    if(self.kesum != nil){
        [aCoder encodeObject:self.kesum forKey:kCheckStockItemModelKesum];
    }
    if(self.sku != nil){
        [aCoder encodeObject:self.sku forKey:kCheckStockItemModelSku];
    }
    if(self.susr2 != nil){
        [aCoder encodeObject:self.susr2 forKey:kCheckStockItemModelSusr2];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.qTY = [aDecoder decodeObjectForKey:kCheckStockItemModelQTY];
    self.qTYALLOCATED = [aDecoder decodeObjectForKey:kCheckStockItemModelQTYALLOCATED];
    self.weiQTYALLOCATED = [aDecoder decodeObjectForKey:kCheckStockItemModelWeiQTYALLOCATED];
    self.descr = [aDecoder decodeObjectForKey:kCheckStockItemModelDescr];
    self.kesum = [aDecoder decodeObjectForKey:kCheckStockItemModelKesum];
    self.sku = [aDecoder decodeObjectForKey:kCheckStockItemModelSku];
    self.susr2 = [aDecoder decodeObjectForKey:kCheckStockItemModelSusr2];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CheckStockItemModel *copy = [CheckStockItemModel new];
    
    copy.qTY = [self.qTY copy];
    copy.qTYALLOCATED = [self.qTYALLOCATED copy];
    copy.weiQTYALLOCATED = [self.weiQTYALLOCATED copy];
    copy.descr = [self.descr copy];
    copy.kesum = [self.kesum copy];
    copy.sku = [self.sku copy];
    copy.susr2 = [self.susr2 copy];
    
    return copy;
}

@end
