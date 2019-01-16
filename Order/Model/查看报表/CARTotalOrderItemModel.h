//
//  CARTotalOrderItemModel.h
//  Order
//
//  Created by wenwang wang on 2019/1/9.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CARTotalOrderItemModel : NSObject

@property (nonatomic, strong) NSString * aMOUNTMONEY;
@property (nonatomic, strong) NSString * bUSINESSIDX;
@property (nonatomic, strong) NSString * nUMBER;
@property (nonatomic, strong) NSString * oRDERNUMBER;
@property (nonatomic, strong) NSString * pARTYCODE;
@property (nonatomic, strong) NSString * pARTYNAME;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
