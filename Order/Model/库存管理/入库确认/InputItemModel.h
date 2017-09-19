//
//  InputItemModel.h
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputItemModel : NSObject

@property (nonatomic, strong) NSString * aDDDATE;
@property (nonatomic, strong) NSString * bATCHNUMBER;
@property (nonatomic, strong) NSString * eDITDATE;
@property (nonatomic, strong) NSString * eNTIDX;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * iNPUTIDX;
@property (nonatomic, strong) NSString * iNPUTQTY;
@property (nonatomic, strong) NSString * iNPUTUOM;
@property (nonatomic, strong) NSString * lINENO;
@property (nonatomic, strong) NSString * oPERUSER;
@property (nonatomic, strong) NSString * pRICE;
@property (nonatomic, strong) NSString * pRODUCTIONDATE;
@property (nonatomic, strong) NSString * pRODUCTDESC;
@property (nonatomic, strong) NSString * pRODUCTIDX;
@property (nonatomic, strong) NSString * pRODUCTNAME;
@property (nonatomic, strong) NSString * pRODUCTNO;
@property (nonatomic, strong) NSString * pRODUCTSTATE;
@property (nonatomic, strong) NSString * pRODUCTTYPE;
@property (nonatomic, strong) NSString * pRODUCTVOLUME;
@property (nonatomic, strong) NSString * pRODUCTWEIGHT;
@property (nonatomic, strong) NSString * sUM;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@property (assign, nonatomic) CGFloat cellHeight;

@end
