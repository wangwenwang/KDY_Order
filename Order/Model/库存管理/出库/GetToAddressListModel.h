//
//  GetToAddressListModel.h
//  Order
//
//  Created by 凯东源 on 2017/8/21.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetToAddressModel.h"


//{
//    "To": [
//           {
//               "ADDRESS_INFO": "天津天津市河东区二号桥街道11",
//               "CONTACT_PERSON": "11",
//               "PARTY_NAME": "11",
//               "PARTY_TYPE": "",
//               "IDX": "68656",
//               "CONTACT_TEL": "11",
//               "ITEM_CODE": "DK17080103462527"
//           },
//           {
//               "ADDRESS_INFO": "天津天津市河东区二号桥街道1号",
//               "CONTACT_PERSON": "1",
//               "PARTY_NAME": "1",
//               "PARTY_TYPE": "",
//               "IDX": "69090",
//               "CONTACT_TEL": "18888888888",
//               "ITEM_CODE": "DK17080905311690"
//           }
//           ]
//}


@interface GetToAddressListModel : NSObject

@property (nonatomic, strong) NSArray * getToAddressModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
