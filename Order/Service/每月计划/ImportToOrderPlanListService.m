//
//  ImportToOrderPlanListService.m
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "ImportToOrderPlanListService.h"
#import <AFNetworking.h>
#import "PromotionDetailModel.h"
#import "AppDelegate.h"
#import "Tools.h"

@interface ImportToOrderPlanListService ()

@property (strong, nonatomic) AppDelegate *app;

@end

@implementation ImportToOrderPlanListService

- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)ImportToOrderPlanList:(NSString *)order {
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                order, @"strOrderInfo",
                                @"", @"strLicense",
                                nil];
    
    NSLog(@"%@", parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];;
    
    [manager POST:API_ImportToOrderPlanList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        int type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(type == 1) {
            
            NSLog(@"下单成功---%@", responseObject);
            [_delegate successOfImportToOrderPlanList:msg];
        } else {
            
            NSLog(@"下单失败---%@", responseObject);
            [self failureOfImportToOrderPlanList:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败---%@", error);
        [self failureOfImportToOrderPlanList:nil];
    }];
}


- (void)failureOfImportToOrderPlanList:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfImportToOrderPlanList:)]) {
        
        [_delegate failureOfImportToOrderPlanList:msg];
    }
}


- (void)setConfirmData:(NSMutableArray *)returnGiftData andProducts:(NSMutableArray *)choicedProducts andTempTotalQTY:(long long)tempTotalQTY andDate:(NSDate *)date andRemark:(NSString *)remark andPromotionOrder:(PromotionOrderModel *)order andSelectPronotionDetails:(NSMutableArray *)selectPronotionDetails {
    
    // 总现价
    double mActPrice = 0;
    for (int i = 0; i < choicedProducts.count; i++) {
        PromotionDetailModel *m = selectPronotionDetails[i];
        mActPrice += m.ACT_PRICE * m.PO_QTY;
    }
    
    // 添加赠品
    for (int i = 0; i < returnGiftData.count; i++) {
        PromotionDetailModel *m = returnGiftData[i];
        // 如果赠品不存在则添加，防止提交失败，再次提交时重复添加赠品
        if([order.OrderDetails indexOfObject:m] == NSNotFound) {
            [order.OrderDetails addObject:m];
        }
    }
    
    // 依据手动配置赠品情况，修改订单中的总原价、总体积、总重量和总数目
    if(returnGiftData.count > 0) {
        double mOrgPrice = 0;
        double mVolume = 0;
        double mWeight = 0;
        long long prQty;
        for (int i = 0; i < returnGiftData.count; i++) {
            PromotionDetailModel *m = returnGiftData[i];
            prQty = m.PO_QTY;
            mOrgPrice += m.ORG_PRICE * prQty;
            mVolume += m.PO_VOLUME * prQty;
            mWeight += m.PO_WEIGHT * prQty;
        }
        order.ORG_PRICE += mOrgPrice;
        order.TOTAL_VOLUME += mVolume;
        order.TOTAL_WEIGHT += mWeight;
    }
    if(tempTotalQTY > order.TOTAL_QTY) {
        order.TOTAL_QTY = tempTotalQTY;
    }
    if(date) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        order.REQUEST_ISSUE = [formatter stringFromDate:date];
    } else {
        order.REQUEST_ISSUE = @"1900-01-01T00:00:00";
    }
    order.CONSIGNEE_REMARK = remark;
}


#pragma mark - 不明觉历函数

- (NSString *)promotionOrderModelTransfromNSString:(PromotionOrderModel *)p andpartyId:(NSString *)partyId andorderAddressIdx:(NSString *)orderAddressIdx {
    
    NSMutableArray *OrderDetails = [self promotionDetailModelTransfromNSString:p.OrderDetails];
    NSMutableArray *GiftClasses = [[NSMutableArray alloc] init];
    
    @try {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              @(p.ACT_PRICE), @"ACT_PRICE",
                              p.ADD_DATE, @"ADD_DATE",
                              _app.business.BUSINESS_IDX, @"BUSINESS_IDX",
                              @(p.BUSINESS_TYPE), @"BUSINESS_TYPE",
                              p.CONSIGNEE_REMARK, @"CONSIGNEE_REMARK",
                              p.EDIT_DATE, @"EDIT_DATE",
                              @(9008), @"ENT_IDX",
                              p.FROM_ADDRESS, @"FROM_ADDRESS",
                              p.FROM_CITY, @"FROM_CITY",
                              p.FROM_CNAME, @"FROM_CNAME",
                              p.FROM_CODE, @"FROM_CODE",
                              p.FROM_COUNTRY, @"FROM_COUNTRY",
                              p.FROM_CSMS, @"FROM_CSMS",
                              p.FROM_CTEL, @"FROM_CTEL",
                              @(p.FROM_IDX), @"FROM_IDX",
                              p.FROM_NAME, @"FROM_NAME",
                              p.FROM_PROPERTY, @"FROM_PROPERTY",
                              p.FROM_PROVINCE, @"FROM_PROVINCE",
                              p.FROM_REGION, @"FROM_REGION",
                              p.FROM_ZIP, @"FROM_ZIP",
                              p.GROUP_NO, @"GROUP_NO",
                              GiftClasses, @"GiftClasses",
                              p.HAVE_GIFT, @"HAVE_GIFT",
                              @(p.IDX), @"IDX",
                              @(p.MJ_PRICE), @"MJ_PRICE",
                              p.MJ_REMARK, @"MJ_REMARK",
                              @(p.OPERATOR_IDX), @"OPERATOR_IDX",
                              p.ORD_NO, @"ORD_NO",
                              p.ORD_NO_CLIENT, @"ORD_NO_CLIENT",
                              p.ORD_NO_CONSIGNEE, @"ORD_NO_CONSIGNEE",
                              p.ORD_STATE, @"ORD_STATE",
                              partyId, @"ORG_IDX",
                              @(p.ORG_PRICE), @"ORG_PRICE",
                              OrderDetails, @"OrderPlanDetails",
                              p.PARTY_IDX, @"PARTY_IDX",
                              p.PAYMENT_TYPE, @"PAYMENT_TYPE",
                              p.REQUEST_DELIVERY, @"REQUEST_DELIVERY",
                              p.REQUEST_ISSUE, @"REQUEST_ISSUE",
                              @(p.TOTAL_QTY), @"ORD_QTY",
                              @(p.TOTAL_VOLUME), @"ORD_VOLUME",
                              @(p.TOTAL_WEIGHT), @"ORD_WEIGHT",
                              p.TO_ADDRESS, @"TO_ADDRESS",
                              p.TO_CITY, @"TO_CITY",
                              p.TO_CNAME, @"TO_CNAME",
                              p.TO_CODE, @"TO_CODE",
                              p.TO_COUNTRY, @"TO_COUNTRY",
                              p.TO_CSMS, @"TO_CSMS",
                              p.TO_CTEL, @"TO_CTEL",
                              orderAddressIdx, @"TO_IDX",
                              p.TO_NAME, @"TO_NAME",
                              p.TO_PROPERTY, @"TO_PROPERTY",
                              p.TO_PROVINCE, @"TO_PROVINCE",
                              p.TO_REGION, @"TO_REGION",
                              p.TO_ZIP, @"TO_ZIP",
                              nil];
        
        NSString *s = [Tools JsonStringWithDictonary:dict];
        return s;
    } @catch (NSException *exception) {
        return @"";
    }
}


- (NSMutableArray *)promotionDetailModelTransfromNSString:(NSMutableArray *)ps {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    @try {
        for(int i = 0; i < ps.count; i++) {
            PromotionDetailModel *p = ps[i];
            NSDictionary *dict = nil;
            if([p.PRODUCT_TYPE isEqualToString:@"NR"]) {
                dict = [NSDictionary dictionaryWithObjectsAndKeys:
                        @(p.ACT_PRICE), @"ACT_PRICE",
                        p.ADD_DATE, @"ADD_DATE",
                        p.EDIT_DATE, @"EDIT_DATE",
                        @(p.ENT_IDX), @"ENT_IDX",
                        @(p.IDX), @"IDX",
                        @(p.LINE_NO), @"LINE_NO",
                        p.LOTTABLE01, @"LOTTABLE01",
                        p.LOTTABLE02, @"LOTTABLE02",
                        p.LOTTABLE03, @"LOTTABLE03",
                        p.LOTTABLE04, @"LOTTABLE04",
                        p.LOTTABLE05, @"LOTTABLE05",
                        p.LOTTABLE06, @"LOTTABLE06",
                        p.LOTTABLE07, @"LOTTABLE07",
                        p.LOTTABLE08, @"LOTTABLE08",
                        p.LOTTABLE09, @"LOTTABLE09",
                        p.LOTTABLE10, @"LOTTABLE10",
                        @(p.LOTTABLE11), @"LOTTABLE11",
                        @(p.LOTTABLE12), @"LOTTABLE12",
                        @(p.LOTTABLE13), @"LOTTABLE13",
                        @(p.MJ_PRICE), @"MJ_PRICE",
                        p.MJ_REMARK, @"MJ_REMARK",
                        @(p.OPERATOR_IDX), @"OPERATOR_IDX",
                        @(p.ORDER_IDX), @"ORDER_IDX",
                        @(p.ORG_PRICE), @"ORG_PRICE",
                        @(p.PO_QTY), @"PO_QTY",
                        p.PO_UOM, @"PO_UOM",
                        @(p.PO_VOLUME), @"PO_VOLUME",
                        @(p.PO_WEIGHT), @"PO_WEIGHT",
                        @(p.PRODUCT_IDX), @"PRODUCT_IDX",
                        p.PRODUCT_NAME, @"PRODUCT_NAME",
                        p.PRODUCT_NO, @"PRODUCT_NO",
                        p.PRODUCT_TYPE, @"PRODUCT_TYPE",
                        p.PRODUCT_URL, @"PRODUCT_URL",
                        p.SALE_REMARK, @"SALE_REMARK",
                        nil];
            } else {
                
                dict = [[NSDictionary alloc] init];
            }
            
            NSString *s = [Tools JsonStringWithDictonary:dict];
            [array addObject:s];
        }
    } @catch (NSException *exception) {
        
        return [[NSMutableArray alloc] init];
    }
    return array;
}

@end
