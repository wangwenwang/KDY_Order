//
//  ChartService.h
//  Order
//
//  Created by 凯东源 on 16/10/20.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CARTotalOrderListModel.h"
#import "CARTotalOrderDetailListModel.h"

@protocol ChartServiceDelegate <NSObject>

@optional
- (void)successOfChartServiceWithCustomer:(NSMutableArray *)customerChart;

@optional
- (void)failureOfChartServiceWithCustomer:(NSString *)msg;

@optional
- (void)successOfChartServiceWithProduct:(NSMutableArray *)productChart;

@optional
- (void)failureOfChartServiceWithProduct:(NSString *)msg;

@optional
- (void)failureOfChartService:(NSString *)msg;

/// 客户订单总计报表
@optional
- (void)successOfCARTotalOrderList:(CARTotalOrderListModel *)CARTotalOrderListM;

/// 客户订单总计详情报表
@optional
- (void)successOfCARTotalOrderDetailList:(CARTotalOrderDetailListModel *)CARTotalOrderDetailListM;

@end

@interface ChartService : NSObject

@property (weak, nonatomic)id <ChartServiceDelegate> delegate;


/**
 * * 获取客户报表数据
 *
 * @param url Url
 * @param tag 发送请求是的标记
 * @return 发送请求是否成功
 */
- (void)getChartDataList:(NSString *)url andTag:(NSString *)tag;


/**
 * * 获取订单汇总报表数据
 *
 * @param strUserId 用户ID
 * @param strType   OUT|出库、INPUT|入库
 * @param strTime   本周，本月，本季，本年，全部
 * @return 订单汇总报表信息
 */
- (void)TotalOrderStatement:(nullable NSString *)strUserId andStrType:(nullable NSString *)strType andStrTime:(nullable NSString *)strTime;


/**
 * * 获取订单汇总报表数据
 *
 * @param strUserId 用户ID
 * @param strType   OUT|出库、INPUT|入库
 * @param strTime   本周，本月，本季，本年，全部
 * @return 订单汇总报表信息
 */
- (void)TotalOrderDetailStatement:(nullable NSString *)strUserId andStrType:(nullable NSString *)strType andStrTime:(nullable NSString *)strTime andStrBusinessIdx:(nullable NSString *)strBusinessIdx andStrPartyCode:(nullable NSString *)strPartyCode;

@end
