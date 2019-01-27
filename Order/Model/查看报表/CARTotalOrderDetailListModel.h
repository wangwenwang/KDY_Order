//
//  CARTotalOrderDetailListModel.h
//  Order
//
//  Created by wenwang wang on 2019/1/22.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CARTotalOrderDetailItemModel.h"


//{
//    "type" : "1",
//    "msg" : "获取订单总计报表（明细）成功",
//    "CARTotalOrderDetailItemModel" : [
//                                      {
//                                          "BUSINESS_IDX" : "129",
//                                          "PARTY_CODE" : "0001.001",
//                                          "NUMBER" : "102",
//                                          "AMOUNT_MONEY" : "5100",
//                                          "PARTY_NAME" : "炳坤",
//                                          "PRODUCT_NO" : "YB001",
//                                          "PRODUCT_NAME" : "怡宝_大怡宝"
//                                      },
//                                      {
//                                          "BUSINESS_IDX" : "129",
//                                          "PARTY_CODE" : "0001.001",
//                                          "NUMBER" : "200",
//                                          "AMOUNT_MONEY" : "200",
//                                          "PARTY_NAME" : "炳坤",
//                                          "PRODUCT_NO" : "116",
//                                          "PRODUCT_NAME" : "木托盘"
//                                      }
//                                      ]
//}


@interface CARTotalOrderDetailListModel : NSObject

@property (nonatomic, strong) NSArray * cARTotalOrderDetailItemModel;
@property (nonatomic, strong) NSString * msg;
@property (nonatomic, strong) NSString * type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
