//
//  InputInfoModel.h
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputInfoModel : NSObject

@property (nonatomic, strong) NSString * aDDRESSCODE;
@property (nonatomic, strong) NSString * aDDRESSIDX;
@property (nonatomic, strong) NSString * aDDRESSINFO;
@property (nonatomic, strong) NSString * aDDRESSNAME;
@property (nonatomic, strong) NSString * aDDDATE;
@property (nonatomic, strong) NSString * aDDUSER;
@property (nonatomic, strong) NSString * aDUTDATE;
@property (nonatomic, strong) NSString * aDUTMARK;
@property (nonatomic, strong) NSString * aDUTUSER;
@property (nonatomic, strong) NSString * bUSINESSIDX;
@property (nonatomic, strong) NSString * eDITDATE;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * iNPUTDATE;
@property (nonatomic, strong) NSString * iNPUTNO;
@property (nonatomic, strong) NSString * iNPUTQTY;
@property (nonatomic, strong) NSString * iNPUTSTATE;
@property (nonatomic, strong) NSString * iNPUTSUM;
@property (nonatomic, strong) NSString * iNPUTTYPE;
@property (nonatomic, strong) NSString * iNPUTVOLUME;
@property (nonatomic, strong) NSString * iNPUTWEIGHT;
@property (nonatomic, strong) NSString * iNPUTWORKFLOW;
@property (nonatomic, strong) NSString * oPERUSER;
@property (nonatomic, strong) NSString * oUTPUTNO;
@property (nonatomic, strong) NSString * pARTYMARK;
@property (nonatomic, strong) NSString * sUPPLIERADDRESS;
@property (nonatomic, strong) NSString * sUPPLIERCODE;
@property (nonatomic, strong) NSString * sUPPLIERNAME;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
