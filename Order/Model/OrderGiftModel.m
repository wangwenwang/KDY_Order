//
//  OrderGiftModel.m
//  Order
//
//  Created by 凯东源 on 16/10/22.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import "OrderGiftModel.h"
#import "ProductModel.h"

@implementation OrderGiftModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _TYPE_NAME = @"";
        _QTY = 0;
        _PRICE = 0;
        _choiceCount = 0;
        _isChecked = NO;
        _PRODUCT_LIST = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    OrderGiftModel *instance = [[OrderGiftModel alloc] init];
    if (instance) {
        instance.TYPE_NAME = self.TYPE_NAME;
        instance.QTY = self.QTY;
        instance.PRICE = self.PRICE;
        instance.choiceCount = self.choiceCount;
        instance.isChecked = self.isChecked;
        instance.CLASS_TYPE = self.CLASS_TYPE;
        instance.PRODUCT_LIST = self.PRODUCT_LIST;
    }
    return instance;
}

- (void)setDict:(NSDictionary *)dict {
    
    @try {
        
        _TYPE_NAME = dict[@"TYPE_NAME"] ? dict[@"TYPE_NAME"] : _TYPE_NAME;
        _QTY = dict[@"QTY"] ? [dict[@"QTY"] doubleValue] : _QTY;
        _PRICE = dict[@"PRICE"] ? [dict[@"PRICE"] doubleValue] : _PRICE;
        _choiceCount = dict[@"choiceCount"] ? [dict[@"choiceCount"] doubleValue] : _choiceCount;
        _isChecked = dict[@"isChecked"] ? [dict[@"isChecked"] boolValue] : _isChecked;
        
        _CLASS_TYPE = dict[@"CLASS_TYPE"] ? dict[@"CLASS_TYPE"] : _CLASS_TYPE;
        _PRODUCT_LIST = dict[@"PRODUCT_LIST"] ? dict[@"PRODUCT_LIST"] : _PRODUCT_LIST;
        NSMutableArray *ProductListArr = [[NSMutableArray alloc] init];
        for(int i = 0; i < _PRODUCT_LIST.count; i++) {
            ProductModel *m = [[ProductModel alloc] init];
            [m setDict:_PRODUCT_LIST[i]];
            [ProductListArr addObject:m];
        }
        _PRODUCT_LIST = ProductListArr;
    } @catch (NSException *exception) {
        
    }
}

@end
