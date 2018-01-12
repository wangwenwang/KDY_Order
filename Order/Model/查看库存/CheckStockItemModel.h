//
//  CheckStockItemModel.h
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckStockItemModel : NSObject

@property (nonatomic, strong) NSString * qTY;
@property (nonatomic, strong) NSString * qTYALLOCATED;
@property (nonatomic, strong) NSString * weiQTYALLOCATED;
@property (nonatomic, strong) NSString * descr;
@property (nonatomic, strong) NSString * kesum;
@property (nonatomic, strong) NSString * sku;
@property (nonatomic, strong) NSString * susr2;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
