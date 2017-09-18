//
//  StockNoListModel.h
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockNoInfoModel.h"
#import "StockNoItemModel.h"



//{
//    "StockNoInfoModel": {
//        "BUSINESS_IDX": "122",
//        "IDX": "6",
//        "ADDRESS_IDX": "68932",
//        "ADDRESS_NAME": "葵隽仓库",
//        "PRODUCT_IDX": "33944",
//        "PRODUCT_NO": "YB.0135",
//        "PRICE": "55.0000",
//        "OPERATOR_NAME": "系统管理员",
//        "STOCK_UOM": "箱",
//        "PRODUCT_NAME": "水溶C100/445ml×1×15  (青皮桔)",
//        "ADDRESS_CODE": "BSTEST",
//        "EDIT_DATE": "2017-09-14 08:46:06",
//        "STOCK_QTY": "10.0000",
//        "ADD_DATE": "2017-09-14 08:46:06",
//        "SUM": "550.0000"
//    },
//    "StockNoItemModel": [
//                         {
//                             "STOCK_UOM": "箱",
//                             "PRODUCT_STATE": "",
//                             "AB_WORKFLOW": "NR",
//                             "ADDRESS_CODE": "BSTEST",
//                             "PRODUCT_NO": "YB.0135",
//                             "SUM": "550.0000",
//                             "BATCH_NUMBER": "",
//                             "ADD_DATE": "2017-09-14 08:46:06",
//                             "BUSINESS_IDX": "122",
//                             "STOCK_QTY": "10.0000",
//                             "PRODUCT_IDX": "33944",
//                             "ADDRESS_NAME": "葵隽仓库",
//                             "LINE_NO": "1",
//                             "ADDRESS_IDX": "68932",
//                             "PRODUCT_NAME": "水溶C100/445ml×1×15  (青皮桔)",
//                             "OPERATOR_NAME": "系统管理员",
//                             "STOCK_NO": "0000000006",
//                             "PRICE": "55.0000",
//                             "EDIT_DATE": "2017-09-14 08:46:06",
//                             "IDX": "9"
//                         }
//                         ]
//}


@interface StockNoListModel : NSObject

@property (nonatomic, strong) StockNoInfoModel * stockNoInfoModel;
@property (nonatomic, strong) NSArray * stockNoItemModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
