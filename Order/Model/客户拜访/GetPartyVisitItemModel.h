//
//  GetPartyVisitItemModel.h
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetPartyVisitItemModel : NSObject

@property (nonatomic, strong) NSString * aCTUALVISITINGADDRESS;
@property (nonatomic, strong) NSString * aDDRESSCODE;
@property (nonatomic, strong) NSString * aDDRESSIDX;
@property (nonatomic, strong) NSString * aDDDATE;
@property (nonatomic, strong) NSString * bUSINESSIDX;
@property (nonatomic, strong) NSString * cHANNEL;
@property (nonatomic, strong) NSString * cHECKINVENTORY;
@property (nonatomic, strong) NSString * cONTACTS;
@property (nonatomic, strong) NSString * cONTACTSTEL;
@property (nonatomic, strong) NSString * eDITDATE;
@property (nonatomic, strong) NSString * fARTHERADDRESSID;
@property (nonatomic, strong) NSString * fARTHERPARTYID;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * lINE;
@property (nonatomic, strong) NSString * nECESSARYSKU;
@property (nonatomic, strong) NSString * pARTYADDRESS;
@property (nonatomic, strong) NSString * pARTYLEVEL;
@property (nonatomic, strong) NSString * pARTYNAME;
@property (nonatomic, strong) NSString * pARTYNO;
@property (nonatomic, strong) NSString * pARTYSTATES;
@property (nonatomic, strong) NSString * pARTYTYPE;
@property (nonatomic, strong) NSString * rEACHTHESITUATION;
@property (nonatomic, strong) NSString * rECOMMENDEDORDER;
@property (nonatomic, strong) NSString * sINGLESTORESALES;
@property (nonatomic, strong) NSString * uSERNAME;
@property (nonatomic, strong) NSString * uSERNO;
@property (nonatomic, strong) NSString * vISITDATE;
@property (nonatomic, strong) NSString * vISITIDX;
@property (nonatomic, strong) NSString * vISITSTATES;
@property (nonatomic, strong) NSString * vIVIDDISPLAYCBX;
@property (nonatomic, strong) NSString * vIVIDDISPLAYTEXT;
@property (nonatomic, strong) NSString * wEEKLYVISITFREQUENCY;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@property (assign, nonatomic) CGFloat cellHeight;
@end
