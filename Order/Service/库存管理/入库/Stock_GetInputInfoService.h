//
//  Stock_GetInputInfoService.h
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputInfoListModel.h"

@protocol GetInputInfoServiceDelegate <NSObject>

@optional
- (void)successOfGetInputInfo:(InputInfoListModel *)inputInfoListM;

@optional
- (void)successOfGetInputInfo_NoData;

@optional
- (void)failureOfGetInputInfo:(NSString *)msg;

@end

@interface Stock_GetInputInfoService : NSObject

@property (weak, nonatomic) id <GetInputInfoServiceDelegate> delegate;


- (void)GetInputInfo:(nullable NSString *)OutputIdx;

@end
