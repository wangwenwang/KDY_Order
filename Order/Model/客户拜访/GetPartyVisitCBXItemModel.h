//
//  GetPartyVisitCBXItemModel.h
//  Order
//
//  Created by wenwang wang on 2018/10/31.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetPartyVisitCBXItemModel : NSObject

@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * iTEMNAME;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
