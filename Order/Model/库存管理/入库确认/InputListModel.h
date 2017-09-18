//
//  InputListModel.h
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputModel.h"


//{
//    "InputModel": [
//                   {
//                       "INPUT_QTY": "15.0000",
//                       "ADUT_DATE": "",
//                       "SUPPLIER_ADDRESS": "广东省深圳市龙华区民治街道深圳上塘地铁站",
//                       "SUPPLIER_NAME": "VANGO深圳上塘地铁店",
//                       "ADUT_USER": "",
//                       "EDIT_DATE": "2017/9/16 15:27:57",
//                       "ADDRESS_CODE": "7550100020",
//                       "INPUT_TYPE": "采购入库",
//                       "INPUT_DATE": "",
//                       "ADDRESS_INFO": "广东省深圳市罗湖区桂园街道深圳罗湖区红桂路红桂大厦首层",
//                       "ADUT_MARK": "",
//                       "ADD_DATE": "2017/9/16 15:27:57",
//                       "INPUT_SUM": "445.0000",
//                       "BUSINESS_IDX": "7",
//                       "SUPPLIER_CODE": "7550099674",
//                       "ENT_IDX": "9008",
//                       "INPUT_WEIGHT": "125000.0000",
//                       "ADDRESS_NAME": "7-11红桂路店",
//                       "ADD_USER": "系统管理员",
//                       "INPUT_STATE": "OPEN",
//                       "ADDRESS_IDX": "69303",
//                       "PARTY_MARK": "",
//                       "OUTPUT_NO": "",
//                       "INPUT_WORKFLOW": "新建",
//                       "OPER_USER": "系统管理员",
//                       "INPUT_VOLUME": "250400.0000",
//                       "INPUT_NO": "0000000010",
//                       "IDX": "2"
//                   }
//                   ]
//}


@interface InputListModel : NSObject

@property (nonatomic, strong) NSArray * inputModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
