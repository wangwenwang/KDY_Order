//
//  StockNoWaterListModel.h
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockNoWaterInfoModel.h"
#import "StockNoWaterItemModel.h"

//{
//    "StockNoWaterInfoModel": {
//        "BUSINESS_IDX": "222",
//        "IDX": "9",
//        "ADDRESS_IDX": "55280",
//        "ADDRESS_NAME": "肇庆端州区和信烟酒商行",
//        "PRODUCT_IDX": "32225",
//        "PRODUCT_NO": "YB.0111",
//        "PRICE": "54.0000",
//        "OPERATOR_NAME": "张玉萍",
//        "STOCK_UOM": "箱",
//        "PRODUCT_NAME": "咖啡香浓,180ml,1×24",
//        "ADDRESS_CODE": "09.1401",
//        "EDIT_DATE": "2017-11-14 14:05:07",
//        "STOCK_QTY": "1.0000",
//        "ADD_DATE": "2017-11-14 14:05:07",
//        "SUM": "54.0000"
//    },
//    "StockNoWaterItemModel": [
//                         {
//                             "CHANGE_DATE": "2017-11-14 14:05:07",
//                             "PRODUCTION_DATE": "",
//                             "PRICE": "54.0000",
//                             "CHANGE_TYPE": "INPUT",
//                             "SOURCE_NO": "0000000382",
//                             "SOURCE_TYPE": "",
//                             "STOCK_NO": "0000000130",
//                             "STOCK_QTY": "1.0000",
//                             "STOCK_UOM": "箱",
//                             "SUM": "54.0000",
//                             "CHANGE_NO": "0000000350"
//                         }
//                         ]
//}


@interface StockNoWaterListModel : NSObject

@property (nonatomic, strong) StockNoWaterInfoModel * stockNoWaterInfoModel;
@property (nonatomic, strong) NSArray * stockNoWaterItemModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
