//
//  DataItemModel.h
//  downDropMenu
//
//  Created by 凯东源 on 17/6/22.
//  Copyright © 2017年 xx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataItemModel : NSObject

@property (nonatomic, assign) NSInteger selected;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
