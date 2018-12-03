//
//  GetPartyVisitUpdateService.h
//  Order
//
//  Created by wenwang wang on 2018/11/7.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol GetPartyVisitUpdateServiceDelegate <NSObject>

@optional
- (void)successOfGetPartyVisitUpdateService:(nullable NSString *)msg;

@optional
- (void)failureOfGetPartyVisitUpdateService:(nullable NSString *)msg;

@end

@interface GetPartyVisitUpdateService : NSObject


@property (nullable, weak, nonatomic) id <GetPartyVisitUpdateServiceDelegate> delegate;

/**
 修改客户拜访
 */
- (void)GetPartyVisitUpdate:(nullable NSString *)IDX
                andPARTY_NO:(nullable NSString *)PARTY_NO
              andPARTY_NAME:(nullable NSString *)PARTY_NAME
                andCONTACTS:(nullable NSString *)CONTACTS
            andCONTACTS_TEL:(nullable NSString *)CONTACTS_TEL
           andPARTY_ADDRESS:(nullable NSString *)PARTY_ADDRESS
               andUSER_NAME:(nullable NSString *)USER_NAME
                 andUSER_NO:(nullable NSString *)USER_NO
              andCHANNEL_NO:(nullable NSString *)CHANNEL_NO
             andPARTY_LEVEL:(nullable NSString *)PARTY_LEVEL
  andWEEKLY_VISIT_FREQUENCY:(nullable NSString *)WEEKLY_VISIT_FREQUENCY
              andVISIT_DATE:(nullable NSString *)VISIT_DATE
            andOPERATOR_IDX:(nullable NSString *)OPERATOR_IDX
            andPARTY_STATES:(nullable NSString *)PARTY_STATES
           andNECESSARY_SKU:(nullable NSString *)NECESSARY_SKU
      andSINGLE_STORE_SALES:(nullable NSString *)SINGLE_STORE_SALES
        andVISIT_THE_TARGET:(nullable NSString *)VISIT_THE_TARGET
     andREACH_THE_SITUATION:(nullable NSString *)REACH_THE_SITUATION
            andBUSINESS_IDX:(nullable NSString *)BUSINESS_IDX
        andORGANIZATION_IDX:(nullable NSString *)ORGANIZATION_IDX
                    andLINE:(nullable NSString *)LINE;

@end
