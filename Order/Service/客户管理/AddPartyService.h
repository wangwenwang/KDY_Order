//
//  AddPartyService.h
//  Order
//
//  Created by 凯东源 on 17/7/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddPartyModel.h"

@protocol AddPartyServiceDelegate <NSObject>

@optional
- (void)successOfAddParty:(NSString *)msg andAddPartyM:(AddPartyModel *)AddPartyM;

@optional
- (void)failureOfAddParty:(NSString *)msg;

@optional
- (void)successOfObtainPartyCode:(NSString *)partyCode;

@end

@interface AddPartyService : NSObject

@property (weak, nonatomic) id <AddPartyServiceDelegate> delegate;


- (void)AddParty:(NSString *)strUserId andPARTY_NAME:(NSString *)PARTY_NAME andPARTY_CITY:(NSString *)PARTY_CITY andPARTY_REMARK:(NSString *)PARTY_REMARK andBUSINESS_IDX:(NSString *)BUSINESS_IDX andStrLINE:(NSString *)strLINE andStrCHANNEL:(NSString *)strCHANNEL andPARTY_CODE:(NSString *)PARTY_CODE;


- (void)ObtainPartyCode:(NSString *)strBusinessCode andStrBusinessIDX:(NSString *)strBusinessIDX;

@end
