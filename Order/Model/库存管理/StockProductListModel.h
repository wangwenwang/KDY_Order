//
//  StockProductListModel.h
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockProductModel.h"

//{
//    "StockProductModel": [
//                          {
//                              "BUSINESS_IDX": "122",
//                              "IDX": "6",
//                              "ADDRESS_IDX": "68932",
//                              "ADDRESS_NAME": "葵隽仓库",
//                              "PRODUCT_IDX": "33944",
//                              "PRODUCT_NO": "YB.0135",
//                              "PRICE": "55.0000",
//                              "EDIT_DATE": "2017/9/14 8:46:06",
//                              "OPERATOR_IDX": "系统管理员",
//                              "STOCK_UOM": "箱",
//                              "PRODUCT_NAME": "水溶C100/445ml×1×15  (青皮桔)",
//                              "ADDRESS_CODE": "BSTEST",
//                              "ENT_IDX": "9008",
//                              "STOCK_QTY": "10.0000",
//                              "ADD_DATE": "2017/9/14 8:46:06",
//                              "SUM": "550.0000"
//                          },
//                          {
//                              "BUSINESS_IDX": "122",
//                              "IDX": "7",
//                              "ADDRESS_IDX": "68932",
//                              "ADDRESS_NAME": "葵隽仓库",
//                              "PRODUCT_IDX": "34043",
//                              "PRODUCT_NO": "YB.0234",
//                              "PRICE": "11.0000",
//                              "EDIT_DATE": "2017/9/14 8:46:06",
//                              "OPERATOR_IDX": "系统管理员",
//                              "STOCK_UOM": "箱",
//                              "PRODUCT_NAME": "冰露水 550ml×1×24",
//                              "ADDRESS_CODE": "BSTEST",
//                              "ENT_IDX": "9008",
//                              "STOCK_QTY": "10.0000",
//                              "ADD_DATE": "2017/9/14 8:46:06",
//                              "SUM": "110.0000"
//                          }
//                          ]
//}

@interface StockProductListModel : NSObject

@property (nonatomic, strong) NSArray * stockProductModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
