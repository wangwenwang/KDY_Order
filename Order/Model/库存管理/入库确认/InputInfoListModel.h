//
//  InputInfoListModel.h
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputInfoModel.h"
#import "InputItemModel.h"

@interface InputInfoListModel : NSObject

@property (nonatomic, strong) InputInfoModel * inputInfoModel;
@property (nonatomic, strong) NSArray * inputItemModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
