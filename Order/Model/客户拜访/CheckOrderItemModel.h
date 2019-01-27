//
//  CheckOrderItemModel.h
//  Order
//
//  Created by wenwang wang on 2019/1/25.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckOrderItemModel : NSObject

@property (nonatomic, strong) NSString * aCTPRICE;
@property (nonatomic, strong) NSString * aDDCODE;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * oMSPARENTNO;
@property (nonatomic, strong) NSString * oMSSPLITTYPE;
@property (nonatomic, strong) NSString * oRDDATEADD;
@property (nonatomic, strong) NSString * oRDNO;
@property (nonatomic, strong) NSString * oRDQTY;
@property (nonatomic, strong) NSString * oRDSTATE;
@property (nonatomic, strong) NSString * oRDTOADDRESS;
@property (nonatomic, strong) NSString * oRDTOCNAME;
@property (nonatomic, strong) NSString * oRDTONAME;
@property (nonatomic, strong) NSString * oRDVOLUME;
@property (nonatomic, strong) NSString * oRDWEIGHT;
@property (nonatomic, strong) NSString * oRDWORKFLOW;
@property (nonatomic, strong) NSString * pARTYTYPE;
@property (nonatomic, strong) NSString * tMSDRIVERNAME;
@property (nonatomic, strong) NSString * tMSDRIVERTEL;
@property (nonatomic, strong) NSString * tMSPLATENUMBER;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
