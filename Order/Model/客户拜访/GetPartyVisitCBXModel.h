//
//  GetPartyVisitCBXModel.h
//  Order
//
//  Created by wenwang wang on 2018/10/31.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetPartyVisitCBXItemModel.h"

//{
//    "LEVEL" : [
//               {
//                   "IDX" : "874",
//                   "ITEM_NAME" : "金"
//               },
//               {
//                   "IDX" : "875",
//                   "ITEM_NAME" : "银"
//               },
//               {
//                   "IDX" : "876",
//                   "ITEM_NAME" : "钻石"
//               }
//               ],
//    "STATES" : [
//                {
//                    "IDX" : "877",
//                    "ITEM_NAME" : "打开"
//                },
//                {
//                    "IDX" : "878",
//                    "ITEM_NAME" : "关闭"
//                }
//                ],
//    "FREQUENCY" : [
//                   {
//                       "IDX" : "880",
//                       "ITEM_NAME" : "两周三次"
//                   },
//                   {
//                       "IDX" : "879",
//                       "ITEM_NAME" : "两周一次"
//                   }
//                   ],
//    "ORG" : [
//             {
//                 "IDX" : "14",
//                 "ITEM_NAME" : "凯东源贸易"
//             }
//             ]
//}

@interface GetPartyVisitCBXModel : NSObject

@property (nonatomic, strong) NSArray * fREQUENCY;
@property (nonatomic, strong) NSArray * lEVEL;
@property (nonatomic, strong) NSArray * oRG;
@property (nonatomic, strong) NSArray * sTATES;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
