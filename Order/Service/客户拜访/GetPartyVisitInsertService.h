//
//  GetPartyVisitInsertService.h
//  Order
//
//  Created by wenwang wang on 2018/11/6.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol GetPartyVisitInsertServiceDelegate <NSObject>

@optional
- (void)successOfGetPartyVisitInsertService:(nullable NSString *)msg andVISIT_IDX:(nullable NSString *)VISIT_IDX;

@optional
- (void)failureOfGetPartyVisitInsertService:(nullable NSString *)msg;

@end

@interface GetPartyVisitInsertService : NSObject


@property (nullable, weak, nonatomic) id <GetPartyVisitInsertServiceDelegate> delegate;

/**
 添加客户拜访
 */
- (void)GetPartyVisitInsert:(nullable NSString *)PARTY_NO
              andPARTY_NAME:(nullable NSString *)PARTY_NAME
                andCONTACTS:(nullable NSString *)CONTACTS
            andCONTACTS_TEL:(nullable NSString *)CONTACTS_TEL
           andPARTY_ADDRESS:(nullable NSString *)PARTY_ADDRESS
               andUSER_NAME:(nullable NSString *)USER_NAME
                 andUSER_NO:(nullable NSString *)USER_NO
                 andCHANNEL:(nullable NSString *)CHANNEL
             andPARTY_LEVEL:(nullable NSString *)PARTY_LEVEL
  andWEEKLY_VISIT_FREQUENCY:(nullable NSString *)WEEKLY_VISIT_FREQUENCY
              andVISIT_DATE:(nullable NSString *)VISIT_DATE
            andOPERATOR_IDX:(nullable NSString *)OPERATOR_IDX
            andPARTY_STATES:(nullable NSString *)PARTY_STATES
     andREACH_THE_SITUATION:(nullable NSString *)REACH_THE_SITUATION
            andBUSINESS_IDX:(nullable NSString *)BUSINESS_IDX
        andORGANIZATION_IDX:(nullable NSString *)ORGANIZATION_IDX
                    andLINE:(nullable NSString *)LINE;
@end
