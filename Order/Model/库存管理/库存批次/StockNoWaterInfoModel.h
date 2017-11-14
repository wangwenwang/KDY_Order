//
//  StockNoWaterInfoModel.h
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockNoWaterInfoModel : NSObject

@property (nonatomic, strong) NSString * aDDRESSCODE;
@property (nonatomic, strong) NSString * aDDRESSIDX;
@property (nonatomic, strong) NSString * aDDRESSNAME;
@property (nonatomic, strong) NSString * aDDDATE;
@property (nonatomic, strong) NSString * bUSINESSIDX;
@property (nonatomic, strong) NSString * eDITDATE;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * oPERATORNAME;
@property (nonatomic, strong) NSString * pRICE;
@property (nonatomic, strong) NSString * pRODUCTIDX;
@property (nonatomic, strong) NSString * pRODUCTNAME;
@property (nonatomic, strong) NSString * pRODUCTNO;
@property (nonatomic, strong) NSString * sTOCKQTY;
@property (nonatomic, strong) NSString * sTOCKUOM;
@property (nonatomic, strong) NSString * sUM;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
