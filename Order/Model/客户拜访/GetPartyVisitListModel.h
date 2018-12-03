//
//  GetPartyVisitListModel.h
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetPartyVisitItemModel.h"

//{
//    "type": "1",
//    "msg": "获取客户拜访列表成功",
//    "GetPartyVisitItemModel": [{
//        "EDIT_DATE": "2018/11/27 14:30:50",
//        "ACTUAL_VISITING_ADDRESS": "",
//        "CHANNEL": "批发",
//        "VIVID_DISPLAY_CBX": "",
//        "USER_NO": "",
//        "PARTY_LEVEL": "",
//        "USER_NAME": "",
//        "WEEKLY_VISIT_FREQUENCY": "",
//        "ADD_DATE": "2018/11/27 14:30:50",
//        "SINGLE_STORE_SALES": "",
//        "BUSINESS_IDX": "15",
//        "REACH_THE_SITUATION": "",
//        "CONTACTS": "浩陈",
//        "PARTY_ADDRESS": "陕西省咸阳市武功县小村镇3",
//        "PARTY_STATES": "",
//        "CHECK_INVENTORY": "",
//        "PARTY_NAME": "王二",
//        "CONTACTS_TEL": "13428910855",
//        "VISIT_STATES": "",
//        "PARTY_NO": "DK18112702305178",
//        "LINE": "星期二",
//        "RECOMMENDED_ORDER": "",
//        "NECESSARY_SKU": "",
//        "VIVID_DISPLAY_TEXT": "",
//        "VISIT_DATE": "",
//        "IDX": "178962",
//        "VISIT_IDX":"",
//        "ADDRESS_IDX":"",
//        "ADDRESS_CODE":"",
//        "PARTY_TYPE":""
//    }]
//}
@interface GetPartyVisitListModel : NSObject

@property (nonatomic, strong) NSArray * getPartyVisitItemModel;
@property (nonatomic, strong) NSString * msg;
@property (nonatomic, strong) NSString * type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
