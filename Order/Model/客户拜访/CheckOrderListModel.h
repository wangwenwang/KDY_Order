//
//  CheckOrderListModel.h
//  Order
//
//  Created by wenwang wang on 2019/1/25.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckOrderItemModel.h"

//{
//    "CheckOrderItemModel": [{
//        "ORD_WORKFLOW": "新建",
//        "IDX": "25338",
//        "OMS_SPLIT_TYPE": "",
//        "ORD_WEIGHT": "0.01",
//        "ORD_TO_NAME": "深圳市",
//        "PARTY_TYPE": "",
//        "ORD_NO": "RWI01000000039400",
//        "ORD_TO_CNAME": "123456",
//        "ORD_TO_ADDRESS": "广东省深圳市",
//        "ORD_QTY": "11.0000",
//        "TMS_PLATE_NUMBER": "",
//        "ADD_CODE": "",
//        "ORD_VOLUME": "0",
//        "OMS_PARENT_NO": "",
//        "ORD_STATE": "PENDING",
//        "TMS_DRIVER_TEL": "",
//        "ACT_PRICE": "256.0000",
//        "ORD_DATE_ADD": "2019/1/25 13:48:58",
//        "TMS_DRIVER_NAME": ""
//    }]
//}

@interface CheckOrderListModel : NSObject

@property (nonatomic, strong) NSArray * checkOrderItemModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
