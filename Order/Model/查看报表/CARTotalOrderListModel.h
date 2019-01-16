//
//  CARTotalOrderListModel.h
//  Order
//
//  Created by wenwang wang on 2019/1/9.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CARTotalOrderItemModel.h"

//{
//    "type": "1",
//    "msg": "获取订单总计报表成功",
//    "CARTotalOrderItemModel": [{
//        "BUSINESS_IDX": "92",
//        "PARTY_NAME": "万科麓城球场",
//        "NUMBER": "0",
//        "AMOUNT_MONEY": "0",
//        "PARTY_CODE": "08.01.0100",
//        "ORDER_NUMBER": "0"
//    },
//                               {
//                                   "BUSINESS_IDX": "92",
//                                   "PARTY_NAME": "民治小店",
//                                   "NUMBER": "0",
//                                   "AMOUNT_MONEY": "0",
//                                   "PARTY_CODE": "MZXD",
//                                   "ORDER_NUMBER": "0"
//                               },
//                               {
//                                   "BUSINESS_IDX": "92",
//                                   "PARTY_NAME": "沙元埔小店",
//                                   "NUMBER": "0",
//                                   "AMOUNT_MONEY": "0",
//                                   "PARTY_CODE": "1",
//                                   "ORDER_NUMBER": "0"
//                               }
//                               ]
//}

@interface CARTotalOrderListModel : NSObject

@property (nonatomic, strong) NSArray * cARTotalOrderItemModel;
@property (nonatomic, strong) NSString * msg;
@property (nonatomic, strong) NSString * type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
