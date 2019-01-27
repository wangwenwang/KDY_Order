//
//  CARTotalOrderDetailItemModel.h
//  Order
//
//  Created by wenwang wang on 2019/1/22.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CARTotalOrderDetailItemModel : NSObject

@property (nonatomic, strong) NSString * aMOUNTMONEY;
@property (nonatomic, strong) NSString * bUSINESSIDX;
@property (nonatomic, strong) NSString * nUMBER;
@property (nonatomic, strong) NSString * pARTYCODE;
@property (nonatomic, strong) NSString * pARTYNAME;
@property (nonatomic, strong) NSString * pRODUCTNAME;
@property (nonatomic, strong) NSString * pRODUCTNO;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
