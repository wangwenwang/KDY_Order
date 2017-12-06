//
//  MonthlyPlanInfoModel.h
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonthlyPlanItemModel.h"

//{
//    "TO_PROPERTY": "Consignee",
//    "REQUEST_ISSUE": "",
//    "ORD_NO": "0000000015",
//    "MonthlyPlanItemModel": [
//                             {
//                                 "PO_QTY": "1.0000",
//                                 "PO_UOM": "箱",
//                                 "ACT_PRICE": "43.0000",
//                                 "PO_WEIGHT": "0.01",
//                                 "SALE_REMARK": "",
//                                 "LINE_NO": "1",
//                                 "PRODUCT_TYPE": "NR",
//                                 "PO_VOLUME": "0.02",
//                                 "PRODUCT_NO": "1020008000",
//                                 "PRODUCT_NAME": "奶茶原味,500ml,1×15",
//                                 "ORG_PRICE": "43.0000"
//                             }
//                             ],
//    "ORD_WORKFLOW": "新建",
//    "ADD_DATE": "2017-12-06 10:21:20",
//    "TO_CODE": "CSKF",
//    "BUSINESS_IDX": "15",
//    "REQUEST_DELIVERY": "",
//    "TO_NAME": "凯东源测试客户",
//    "ORD_WEIGHT": "0.01",
//    "ORD_VOLUME": "0.02",
//    "TO_CNAME": "1",
//    "TO_ADDRESS": "广东省深圳市龙华区民治街道328号",
//    "ORG_PRICE": "43.0000",
//    "ORD_QTY": "1.0000",
//    "ORD_STATE": "OPEN",
//    "ACT_PRICE": "43.0000",
//    "CONSIGNEE_REMARK": "备注",
//    "ORG_IDX": "70570",
//    "IDX": "12"
//}

@interface MonthlyPlanInfoModel : NSObject

@property (nonatomic, strong) NSString * aCTPRICE;
@property (nonatomic, strong) NSString * aDDDATE;
@property (nonatomic, strong) NSString * bUSINESSIDX;
@property (nonatomic, strong) NSString * cONSIGNEEREMARK;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSArray * monthlyPlanItemModel;
@property (nonatomic, strong) NSString * oRDNO;
@property (nonatomic, strong) NSString * oRDQTY;
@property (nonatomic, strong) NSString * oRDSTATE;
@property (nonatomic, strong) NSString * oRDVOLUME;
@property (nonatomic, strong) NSString * oRDWEIGHT;
@property (nonatomic, strong) NSString * oRDWORKFLOW;
@property (nonatomic, strong) NSString * oRGIDX;
@property (nonatomic, strong) NSString * oRGPRICE;
@property (nonatomic, strong) NSString * rEQUESTDELIVERY;
@property (nonatomic, strong) NSString * rEQUESTISSUE;
@property (nonatomic, strong) NSString * tOADDRESS;
@property (nonatomic, strong) NSString * tOCNAME;
@property (nonatomic, strong) NSString * tOCODE;
@property (nonatomic, strong) NSString * tONAME;
@property (nonatomic, strong) NSString * tOPROPERTY;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
