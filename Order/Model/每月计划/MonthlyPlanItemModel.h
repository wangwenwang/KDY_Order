//
//  MonthlyPlanItemModel.h
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonthlyPlanItemModel : NSObject

@property (nonatomic, strong) NSString * aCTPRICE;
@property (nonatomic, strong) NSString * lINENO;
@property (nonatomic, strong) NSString * oRGPRICE;
@property (nonatomic, strong) NSString * pOQTY;
@property (nonatomic, strong) NSString * pOUOM;
@property (nonatomic, strong) NSString * pOVOLUME;
@property (nonatomic, strong) NSString * pOWEIGHT;
@property (nonatomic, strong) NSString * pRODUCTNAME;
@property (nonatomic, strong) NSString * pRODUCTNO;
@property (nonatomic, strong) NSString * pRODUCTTYPE;
@property (nonatomic, strong) NSString * sALEREMARK;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@property (assign, nonatomic) CGFloat cellHeight;

@end
