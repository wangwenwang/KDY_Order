//
//  Stock_InPutWorkflowService.h
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InPutWorkflowServiceDelegate <NSObject>

@optional
- (void)successOfInPutWorkflow:(NSString *)msg;

@optional
- (void)failureOfInPutWorkflow:(NSString *)msg;

@end

@interface Stock_InPutWorkflowService : NSObject

@property (weak, nonatomic) id <InPutWorkflowServiceDelegate> delegate;


- (void)InPutWorkflow:(nullable NSString *)Input_idx andADUT_USER:(nullable NSString *)ADUT_USER;

@end
