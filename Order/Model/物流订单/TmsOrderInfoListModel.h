//
//  TmsOrderInfoListModel.h
//  Order
//
//  Created by 凯东源 on 2018/1/4.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TmsOrderInfoItemModel.h"

@interface TmsOrderInfoListModel : NSObject

@property (nonatomic, strong) NSArray * tmsOrderInfoItemModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
