//
//  TmsOrderListModel.h
//  Order
//
//  Created by 凯东源 on 2018/1/3.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TmsOrderItemModel.h"


//{
//    "TmsOrderItemModel": [
//                          {
//                              "ORD_No": "RWI01000000030100",
//                              "ORD_DATE_ADD": "2017-08-11 14:51:42",
//                              "ORD_WEIGHT": "8.5",
//                              "TMS_WEIGHT": "8.5",
//                              "TMS_QTY": "1000.0000",
//                              "ORD_TO_ADDRESS": "广东省深圳市龙华区龙华街道创业花园艺术培训中心",
//                              "IDX": "1702696",
//                              "ORD_QTY": "1000.0000",
//                              "ORD_TO_NAME": "夏门沃尔玛1",
//                              "ORD_VOLUME": "9.18",
//                              "TMS_VOLUME": "9.18"
//                          },
//                          {
//                              "ORD_No": "YIB03000000028800",
//                              "ORD_DATE_ADD": "2017-08-12 14:51:42",
//                              "ORD_WEIGHT": "1.09",
//                              "TMS_WEIGHT": "1.09",
//                              "TMS_QTY": "122.0000",
//                              "ORD_TO_ADDRESS": "广东省深圳市龙华区民治街道328号",
//                              "IDX": "1747917",
//                              "ORD_QTY": "122.0000",
//                              "ORD_TO_NAME": "凯东源测试客户",
//                              "ORD_VOLUME": "2.05",
//                              "TMS_VOLUME": "2.05"
//                          }
//                          ]
//}
@interface TmsOrderListModel : NSObject

@property (nonatomic, strong) NSArray * tmsOrderItemModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
