//
//  GetVisitEnterShopService.h
//  Order
//
//  Created by wenwang wang on 2018/11/20.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PartyModel.h"
#import "AddressModel.h"


/**
 进店
 */
@protocol GetVisitEnterShopServiceDelegate <NSObject>

// 第一步，进店
@optional
- (void)successOfGetVisitEnterShopService:(nullable NSString *)msg;

@optional
- (void)failureOfGetVisitEnterShopService:(nullable NSString *)msg;

// 第一步，获取照片 type是Visit时进店，type是VisitVividDisplay时生动化陈列
@optional
- (void)successOfGetPictureByVisitIdx:(nullable NSArray *)arrayUrl andType:(nullable NSString *)type;

@optional
- (void)failureOfGetPictureByVisitIdx:(nullable NSString *)msg;

// 第二步，确认客户资料信息
@optional
- (void)successOfGetVisitConfirmCustomer:(nullable NSString *)msg;

@optional
- (void)failureOfGetVisitConfirmCustomer:(nullable NSString *)msg;

// 第三步，检查库存
@optional
- (void)successOfGetVisitCheckInventory:(nullable NSString *)msg;

@optional
- (void)failureOfGetVisitCheckInventory:(nullable NSString *)msg;

// 第四步，建议订单
@optional
- (void)successOfGetVisitRecommendedOrder:(nullable NSString *)msg;

@optional
- (void)failureOfGetVisitRecommendedOrder:(nullable NSString *)msg;

// 第五步，生动化陈列
@optional
- (void)successOfGetVisitVividDisplay:(nullable NSString *)msg;

@optional
- (void)failureOfGetVisitVividDisplay:(nullable NSString *)msg;

// 第五步，离店
@optional
- (void)successOfGetVisitLeaveShop:(nullable NSString *)msg;

@optional
- (void)failureOfGetVisitLeaveShop:(nullable NSString *)msg;

// 获取生动化陈列
@optional
- (void)successOfVividDisplayCBX:(nullable NSString *)msg andCBX:(nullable NSArray *)CBX;

@optional
- (void)failureOfVividDisplayCBX:(nullable NSString *)msg;

// 获取线路内订单
@optional
- (void)successOfGetVisitAppOrder:(nullable NSString *)msg;

@optional
- (void)failureOfGetVisitAppOrder:(nullable NSString *)msg;

// 根据客户地址id，获取上级地址id
@optional
- (void)successOfGetFatherAddress:(nullable NSString *)msg andPartyM:(nullable PartyModel *)partyM andAddressM:(nullable AddressModel *)addressM;

@optional
- (void)failureOfGetFatherAddress:(nullable NSString *)msg;

@end


@interface GetVisitEnterShopService : NSObject

@property (nullable, weak, nonatomic)id <GetVisitEnterShopServiceDelegate> delegate;

/**
 第一步，进店

 @param strVisitIdx 拜访ID
 @param PictureFile1 门店照片1
 @param PictureFile2 门店照片2
 @param strAddress 当前位置
 */
- (void)GetVisitEnterShopService:(nullable NSString *)strVisitIdx andPictureFile1:(nullable NSString *)PictureFile1 andPictureFile2:(nullable NSString *)PictureFile2 andstrAddress:(nullable NSString *)strAddress;



/**
 获取进店照片

 @param strVisitIdx 拜访ID
 @param strStep     照片类型，进店照片:Visit，生动化陈列传照片:VisitVividDisplay
 */
- (void)GetPictureByVisitIdx:(nullable NSString *)strVisitIdx andStrStep:(nullable NSString *)strStep;


/**
 第二步，确认客户资料信息

 @param strVisitIdx 客户拜访IDX
 @param strUserIDX 用户IDX
 @param strPartyName 客户名称
 @param strAddress 地址
 @param strContacts 联系人
 @param strContactsTel 联系电话
 @param strChange 是否更改个人信息
 @param strChange 业务代码
 @param strChange 客户代码
 */
- (void)GetVisitConfirmCustomer:(nullable NSString *)strVisitIdx andStrUserIDX:(nullable NSString *)strUserIDX andStrPartyName:(nullable NSString *)strPartyName andStrAddress:(nullable NSString *)strAddress andStrContacts:(nullable NSString *)strContacts andStrContactsTel:(nullable NSString *)strContactsTel andStrChange:(nullable NSString *)strChange andStrBussenIdx:(nullable NSString *)strBussenIdx andStrPartyCode:(nullable NSString *)strPartyCode;


/**
 第三步，检查库存

 @param strVisitIdx 客户拜访IDX
 @param strCheckInventory 检查库存
 */
- (void)GetVisitCheckInventory:(nullable NSString *)strVisitIdx andStrCheckInventory:(nullable NSString *)strCheckInventory;


/**
 第四步，建议订单
 
 @param strVisitIdx 客户拜访IDX
 @param strCheckInventory 建议订单
 */
- (void)GetVisitRecommendedOrder:(nullable NSString *)strVisitIdx andStrRecommendedOrder:(nullable NSString *)strRecommendedOrder;


/**
 第五步，生动化陈列
 
 @param strVisitIdx 客户拜访IDX
 @param strVividDisplayText 生动化陈列文本框值
 */
- (void)GetVisitVividDisplay:(nullable NSString *)strVisitIdx
       andStrVividDisplayCbx:(nullable NSString *)strVividDisplayCbx
      andStrVividDisplayText:(nullable NSString *)strVividDisplayText
             andPictureFile1:(nullable NSString *)PictureFile1
             andPictureFile2:(nullable NSString *)PictureFile2
             andPictureFile3:(nullable NSString *)PictureFile3
             andPictureFile4:(nullable NSString *)PictureFile4
             andPictureFile5:(nullable NSString *)PictureFile5
             andPictureFile6:(nullable NSString *)PictureFile6
             andPictureFile7:(nullable NSString *)PictureFile7
             andPictureFile8:(nullable NSString *)PictureFile8
             andPictureFile9:(nullable NSString *)PictureFile9;

/**
 第六步，离店
 
 @param strVisitIdx 客户拜访IDX
 */
- (void)GetVisitLeaveShop:(nullable NSString *)strVisitIdx;


/**
 
 获取生动化陈列
 */
- (void)VividDisplayCBX;


/**
 
 获取客户拜访订单
 */
- (void)GetVisitAppOrder:(nullable NSString *)strVisitIdx;


/**
 
 根据客户地址id，获取上级地址id
 */
- (void)GetFatherAddress:(nullable NSString *)strAddressIdx;

@end
