//
//  Stock_GetInputListService.h
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputListModel.h"

@protocol GetInputListServiceDelegate <NSObject>

@optional
- (void)successOfGetInputList:(InputListModel *)inputListM;

@optional
- (void)successOfGetInputList_NoData;

@optional
- (void)failureOfGetInputList:(NSString *)msg;

@end

@interface Stock_GetInputListService : NSObject

@property (weak, nonatomic) id <GetInputListServiceDelegate> delegate;


- (void)GetInputList:(nullable NSString *)ADD_USER andstrPage:(NSInteger)strPage andstrPageCount:(NSInteger)strPageCount andBUSINESS_IDX:(NSString *)BUSINESS_IDX;

@end
