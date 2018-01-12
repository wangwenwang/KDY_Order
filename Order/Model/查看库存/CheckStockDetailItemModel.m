//
//  CheckStockDetailItemModel.m
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "CheckStockDetailItemModel.h"


NSString *const kCheckStockDetailItemModelCasecnt = @"Casecnt";
NSString *const kCheckStockDetailItemModelLoc = @"Loc";
NSString *const kCheckStockDetailItemModelQTY = @"QTY";
NSString *const kCheckStockDetailItemModelQTYALLOCATED = @"QTYALLOCATED";
NSString *const kCheckStockDetailItemModelWeiQTYALLOCATED = @"WeiQTYALLOCATED";
NSString *const kCheckStockDetailItemModelDescr = @"descr";
NSString *const kCheckStockDetailItemModelKesum = @"kesum";
NSString *const kCheckStockDetailItemModelLottable04 = @"lottable04";
NSString *const kCheckStockDetailItemModelSku = @"sku";
NSString *const kCheckStockDetailItemModelSusr2 = @"susr2";


@implementation CheckStockDetailItemModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kCheckStockDetailItemModelCasecnt] isKindOfClass:[NSNull class]]){
        self.casecnt = dictionary[kCheckStockDetailItemModelCasecnt];
    }
    if(![dictionary[kCheckStockDetailItemModelLoc] isKindOfClass:[NSNull class]]){
        self.loc = dictionary[kCheckStockDetailItemModelLoc];
    }
    if(![dictionary[kCheckStockDetailItemModelQTY] isKindOfClass:[NSNull class]]){
        self.qTY = dictionary[kCheckStockDetailItemModelQTY];
    }
    if(![dictionary[kCheckStockDetailItemModelQTYALLOCATED] isKindOfClass:[NSNull class]]){
        self.qTYALLOCATED = dictionary[kCheckStockDetailItemModelQTYALLOCATED];
    }
    if(![dictionary[kCheckStockDetailItemModelWeiQTYALLOCATED] isKindOfClass:[NSNull class]]){
        self.weiQTYALLOCATED = dictionary[kCheckStockDetailItemModelWeiQTYALLOCATED];
    }
    if(![dictionary[kCheckStockDetailItemModelDescr] isKindOfClass:[NSNull class]]){
        self.descr = dictionary[kCheckStockDetailItemModelDescr];
    }
    if(![dictionary[kCheckStockDetailItemModelKesum] isKindOfClass:[NSNull class]]){
        self.kesum = dictionary[kCheckStockDetailItemModelKesum];
    }
    if(![dictionary[kCheckStockDetailItemModelLottable04] isKindOfClass:[NSNull class]]){
        self.lottable04 = dictionary[kCheckStockDetailItemModelLottable04];
    }
    if(![dictionary[kCheckStockDetailItemModelSku] isKindOfClass:[NSNull class]]){
        self.sku = dictionary[kCheckStockDetailItemModelSku];
    }
    if(![dictionary[kCheckStockDetailItemModelSusr2] isKindOfClass:[NSNull class]]){
        self.susr2 = dictionary[kCheckStockDetailItemModelSusr2];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.casecnt != nil){
        dictionary[kCheckStockDetailItemModelCasecnt] = self.casecnt;
    }
    if(self.loc != nil){
        dictionary[kCheckStockDetailItemModelLoc] = self.loc;
    }
    if(self.qTY != nil){
        dictionary[kCheckStockDetailItemModelQTY] = self.qTY;
    }
    if(self.qTYALLOCATED != nil){
        dictionary[kCheckStockDetailItemModelQTYALLOCATED] = self.qTYALLOCATED;
    }
    if(self.weiQTYALLOCATED != nil){
        dictionary[kCheckStockDetailItemModelWeiQTYALLOCATED] = self.weiQTYALLOCATED;
    }
    if(self.descr != nil){
        dictionary[kCheckStockDetailItemModelDescr] = self.descr;
    }
    if(self.kesum != nil){
        dictionary[kCheckStockDetailItemModelKesum] = self.kesum;
    }
    if(self.lottable04 != nil){
        dictionary[kCheckStockDetailItemModelLottable04] = self.lottable04;
    }
    if(self.sku != nil){
        dictionary[kCheckStockDetailItemModelSku] = self.sku;
    }
    if(self.susr2 != nil){
        dictionary[kCheckStockDetailItemModelSusr2] = self.susr2;
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
    if(self.casecnt != nil){
        [aCoder encodeObject:self.casecnt forKey:kCheckStockDetailItemModelCasecnt];
    }
    if(self.loc != nil){
        [aCoder encodeObject:self.loc forKey:kCheckStockDetailItemModelLoc];
    }
    if(self.qTY != nil){
        [aCoder encodeObject:self.qTY forKey:kCheckStockDetailItemModelQTY];
    }
    if(self.qTYALLOCATED != nil){
        [aCoder encodeObject:self.qTYALLOCATED forKey:kCheckStockDetailItemModelQTYALLOCATED];
    }
    if(self.weiQTYALLOCATED != nil){
        [aCoder encodeObject:self.weiQTYALLOCATED forKey:kCheckStockDetailItemModelWeiQTYALLOCATED];
    }
    if(self.descr != nil){
        [aCoder encodeObject:self.descr forKey:kCheckStockDetailItemModelDescr];
    }
    if(self.kesum != nil){
        [aCoder encodeObject:self.kesum forKey:kCheckStockDetailItemModelKesum];
    }
    if(self.lottable04 != nil){
        [aCoder encodeObject:self.lottable04 forKey:kCheckStockDetailItemModelLottable04];
    }
    if(self.sku != nil){
        [aCoder encodeObject:self.sku forKey:kCheckStockDetailItemModelSku];
    }
    if(self.susr2 != nil){
        [aCoder encodeObject:self.susr2 forKey:kCheckStockDetailItemModelSusr2];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.casecnt = [aDecoder decodeObjectForKey:kCheckStockDetailItemModelCasecnt];
    self.loc = [aDecoder decodeObjectForKey:kCheckStockDetailItemModelLoc];
    self.qTY = [aDecoder decodeObjectForKey:kCheckStockDetailItemModelQTY];
    self.qTYALLOCATED = [aDecoder decodeObjectForKey:kCheckStockDetailItemModelQTYALLOCATED];
    self.weiQTYALLOCATED = [aDecoder decodeObjectForKey:kCheckStockDetailItemModelWeiQTYALLOCATED];
    self.descr = [aDecoder decodeObjectForKey:kCheckStockDetailItemModelDescr];
    self.kesum = [aDecoder decodeObjectForKey:kCheckStockDetailItemModelKesum];
    self.lottable04 = [aDecoder decodeObjectForKey:kCheckStockDetailItemModelLottable04];
    self.sku = [aDecoder decodeObjectForKey:kCheckStockDetailItemModelSku];
    self.susr2 = [aDecoder decodeObjectForKey:kCheckStockDetailItemModelSusr2];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CheckStockDetailItemModel *copy = [CheckStockDetailItemModel new];
    
    copy.casecnt = [self.casecnt copy];
    copy.loc = [self.loc copy];
    copy.qTY = [self.qTY copy];
    copy.qTYALLOCATED = [self.qTYALLOCATED copy];
    copy.weiQTYALLOCATED = [self.weiQTYALLOCATED copy];
    copy.descr = [self.descr copy];
    copy.kesum = [self.kesum copy];
    copy.lottable04 = [self.lottable04 copy];
    copy.sku = [self.sku copy];
    copy.susr2 = [self.susr2 copy];
    
    return copy;
}

@end
