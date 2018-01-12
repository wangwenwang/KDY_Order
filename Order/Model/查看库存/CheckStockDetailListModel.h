//
//  CheckStockDetailListModel.h
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckStockDetailItemModel.h"


//{
//    "TmsList": [{
//        "Casecnt": "1.00000",
//        "QTYALLOCATED": "0/0",
//        "sku": "207112",
//        "susr2": "袋",
//        "descr": "东海明珠渔乡苏北大米10kg*1",
//        "Loc": "8S216-1",
//        "lottable04": "2017/12/27 0:00:00",
//        "QTY": "23/0",
//        "WeiQTYALLOCATED": "0/0",
//        "kesum": "23/0"
//    }]
//}


@interface CheckStockDetailListModel : NSObject

@property (nonatomic, strong) NSArray * checkStockDetailItemModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
