//
//  MonthlyPlanListModel.h
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonthlyPlanModel.h"


//{
//    "type": "1",
//    "msg": "获取成功",
//    "MonthlyPlanModel": [
//                         {
//                             "ORD_WORKFLOW": "新建",
//                             "IDX": "12",
//                             "CONSIGNEE_REMARK": "备注",
//                             "REQUEST_ISSUE": "",
//                             "ORD_WEIGHT": "0.01",
//                             "ORD_STATE": "OPEN",
//                             "TO_CNAME": "1",
//                             "ORD_NO": "0000000015",
//                             "ORD_VOLUME": "0.02",
//                             "ORD_QTY": "1.0000",
//                             "REQUEST_DELIVERY": "",
//                             "TO_CODE": "CSKF",
//                             "ORG_PRICE": "43.0000",
//                             "TO_NAME": "凯东源测试客户",
//                             "ACT_PRICE": "43.0000",
//                             "TO_ADDRESS": "广东省深圳市龙华区民治街道328号",
//                             "ADD_DATE": "2017-12-06 10:21:20"
//                         }
//                         ]
//}


@interface MonthlyPlanListModel : NSObject

@property (nonatomic, strong) NSArray * monthlyPlanModel;
@property (nonatomic, strong) NSString * msg;
@property (nonatomic, strong) NSString * type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
