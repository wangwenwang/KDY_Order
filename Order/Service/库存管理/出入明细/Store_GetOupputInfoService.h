//
//  Store_GetOupputInfoService.h
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetOupputDetailModel.h"

@protocol Store_GetOupputInfoServiceDelegate <NSObject>

/// 出库列表 成功
@optional
- (void)successOfGetOupputInfo:(GetOupputDetailModel *)getOupputDetailM;

/// 出库列表 失败
@optional
- (void)failureOfGetOupputInfo:(NSString *)msg;

/// 确认出库 成功
@optional
- (void)successOfOutPutWorkflow:(NSString *)msg;

/// 确认出库 失败
@optional
- (void)failureOfOutPutWorkflow:(NSString *)msg;

/// 取消出库 成功
@optional
- (void)successOfOutPutCancel:(NSString *)msg;

/// 取消出库 失败
@optional
- (void)failureOfOutPutCancel:(NSString *)msg;

@end

@interface Store_GetOupputInfoService : NSObject

@property (weak, nonatomic)id <Store_GetOupputInfoServiceDelegate> delegate;

/// 获取出库列表
- (void)GetOupputInfo:(NSInteger)OutputIdx;

/**
 确认出库

 @param Output_idx 出库单idx
 @param ADUT_USER  操作用户
 */
- (void)confirm:(NSInteger)Output_idx andADUT_USER:(NSString *)ADUT_USER;

/// 取消出库

- (void)cancel:(NSInteger)OutputIdx andOPER_USER:(NSString *)OPER_USER;

@end
