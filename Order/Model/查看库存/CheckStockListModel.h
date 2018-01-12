//
//  CheckStockListModel.h
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckStockItemModel.h"


//{
//    "CheckStockItemModel": [{
//        "QTYALLOCATED": "0/0",
//        "sku": "202229",
//        "susr2": "袋",
//        "descr": "福临门苏软香10kg*1",
//        "QTY": "34/0",
//        "WeiQTYALLOCATED": "0/0",
//        "kesum": "34/0"
//    },
//                            {
//                                "QTYALLOCATED": "0/0",
//                                "sku": "202229",
//                                "susr2": "袋",
//                                "descr": "福临门苏软香10kg*1",
//                                "QTY": "200/0",
//                                "WeiQTYALLOCATED": "0/0",
//                                "kesum": "200/0"
//                            }
//                            ]
//}


@interface CheckStockListModel : NSObject

@property (nonatomic, strong) NSArray * checkStockItemModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
