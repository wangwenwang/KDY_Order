//
//  StockNoWaterItemModel.h
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockNoWaterItemModel : NSObject

@property (nonatomic, strong) NSString * cHANGEDATE;
@property (nonatomic, strong) NSString * cHANGENO;
@property (nonatomic, strong) NSString * cHANGETYPE;
@property (nonatomic, strong) NSString * pRICE;
@property (nonatomic, strong) NSString * pRODUCTIONDATE;
@property (nonatomic, strong) NSString * sOURCENO;
@property (nonatomic, strong) NSString * sOURCETYPE;
@property (nonatomic, strong) NSString * sTOCKNO;
@property (nonatomic, strong) NSString * sTOCKQTY;
@property (nonatomic, strong) NSString * sTOCKUOM;
@property (nonatomic, strong) NSString * sUM;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
