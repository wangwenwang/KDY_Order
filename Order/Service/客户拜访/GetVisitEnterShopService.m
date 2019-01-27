//
//  GetVisitEnterShopService.m
//  Order
//
//  Created by wenwang wang on 2018/11/20.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetVisitEnterShopService.h"
#import <AFNetworking.h>

#define kAPI_NAME_GetVisitEnterShop @"进店"
#define kAPI_NAME_GetPictureByVisitIdx @" 根据拜访ID获取图片"
#define kAPI_NAME_GetVisitConfirmCustomer @"确认客户资料信息"
#define kAPI_NAME_GetVisitCheckInventory @"检查库存"
#define kAPI_NAME_GetVisitRecommendedOrder @"建议订单"
#define kAPI_NAME_GetVisitVividDisplay @"生动化陈列"
#define kAPI_NAME_GetVisitLeaveShop @"离店"
#define kAPI_NAME_VividDisplayCBX @"获取生动化陈列"
#define kAPI_NAME_GetVisitAppOrder @"获取客户拜访订单"
#define kAPI_NAME_GetFatherAddress @"根据客户地址id，获取上级地址id"


@implementation GetVisitEnterShopService

- (void)GetVisitEnterShopService:(nullable NSString *)strVisitIdx andPictureFile1:(nullable NSString *)PictureFile1 andPictureFile2:(nullable NSString *)PictureFile2 andstrAddress:(nullable NSString *)strAddress {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strVisitIdx": strVisitIdx,
                                 @"PictureFile1": PictureFile1,
                                 @"PictureFile2": PictureFile2,
                                 @"strAddress": strAddress,
                                 @"strLicense": @""
                                 };
    NSLog(@"接口:%@请求%@参数：%@", API_GetVisitEnterShop, kAPI_NAME_GetVisitEnterShop, parameters);
    [manager POST:API_GetVisitEnterShop parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       NSLog(@"%@|请求成功---%@", kAPI_NAME_GetVisitEnterShop, responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        if(_type == 1) {
            if([_delegate respondsToSelector:@selector(successOfGetVisitEnterShopService:)]) {
                [_delegate successOfGetVisitEnterShopService:msg];
            }
        }else {
            if([_delegate respondsToSelector:@selector(failureOfGetVisitEnterShopService:)]) {
                [_delegate failureOfGetVisitEnterShopService:msg];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@|请求失败:%@", kAPI_NAME_GetVisitEnterShop, error);
        if([_delegate respondsToSelector:@selector(failureOfGetVisitEnterShopService:)]) {
            [_delegate failureOfGetVisitEnterShopService:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME_GetVisitEnterShop]];
        }
    }];
}


- (void)GetPictureByVisitIdx:(nullable NSString *)strVisitIdx andStrStep:(nullable NSString *)strStep {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strVisitIdx": strVisitIdx,
                                 @"strStep": strStep,
                                 @"strLicense": @""
                                 };
    NSLog(@"接口:%@请求%@参数：%@", API_GetPictureByVisitIdx, kAPI_NAME_GetPictureByVisitIdx, parameters);
    [manager POST:API_GetPictureByVisitIdx parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME_GetPictureByVisitIdx, responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        NSArray *array = responseObject[@"result"];
        if(_type == 1) {
            if(array > 0) {
                if([_delegate respondsToSelector:@selector(successOfGetPictureByVisitIdx:andType:)]) {
                    [_delegate successOfGetPictureByVisitIdx:array andType:strStep];
                }
            }else {
                if([_delegate respondsToSelector:@selector(failureOfGetPictureByVisitIdx:andType:)]) {
                    [_delegate failureOfGetPictureByVisitIdx:@"没有图片" andType:strStep];
                }
            }
        }else {
            if([_delegate respondsToSelector:@selector(failureOfGetPictureByVisitIdx:andType:)]) {
                [_delegate failureOfGetPictureByVisitIdx:msg andType:strStep];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@|请求失败:%@", kAPI_NAME_GetPictureByVisitIdx, error);
        if([_delegate respondsToSelector:@selector(failureOfGetPictureByVisitIdx:andType:)]) {
            [_delegate failureOfGetPictureByVisitIdx:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME_GetPictureByVisitIdx] andType:strStep];
        }
    }];
}

- (void)GetVisitConfirmCustomer:(nullable NSString *)strVisitIdx andStrUserIDX:(nullable NSString *)strUserIDX andStrPartyName:(nullable NSString *)strPartyName andStrAddress:(nullable NSString *)strAddress andStrContacts:(nullable NSString *)strContacts andStrContactsTel:(nullable NSString *)strContactsTel andStrChange:(nullable NSString *)strChange andStrBussenIdx:(nullable NSString *)strBussenIdx andStrPartyCode:(nullable NSString *)strPartyCode {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strVisitIdx": strVisitIdx,
                                 @"strUserIDX": strUserIDX,
                                 @"strPartyName": strPartyName,
                                 @"strAddress": strAddress,
                                 @"strContacts": strContacts,
                                 @"strContactsTel": strContactsTel,
                                 @"strChange": strChange,
                                 @"strBussenIdx": strBussenIdx,
                                 @"strPartyCode": strPartyCode,
                                 @"strLicense": @""
                                 };
    NSLog(@"接口:%@请求%@参数：%@", API_GetVisitConfirmCustomer, kAPI_NAME_GetVisitConfirmCustomer, parameters);
    [manager POST:API_GetVisitConfirmCustomer parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME_GetVisitConfirmCustomer, responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        if(_type == 1) {
            if([_delegate respondsToSelector:@selector(successOfGetVisitConfirmCustomer:)]) {
                [_delegate successOfGetVisitConfirmCustomer:msg];
            }
        }else {
            if([_delegate respondsToSelector:@selector(failureOfGetVisitConfirmCustomer:)]) {
                [_delegate failureOfGetVisitConfirmCustomer:msg];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@|请求失败:%@", kAPI_NAME_GetVisitConfirmCustomer, error);
        if([_delegate respondsToSelector:@selector(failureOfGetVisitConfirmCustomer:)]) {
            [_delegate failureOfGetVisitConfirmCustomer:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME_GetVisitConfirmCustomer]];
        }
    }];
}


- (void)GetVisitCheckInventory:(nullable NSString *)strVisitIdx andStrCheckInventory:(nullable NSString *)strCheckInventory {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strVisitIdx": strVisitIdx,
                                 @"strCheckInventory": strCheckInventory,
                                 @"strLicense": @""
                                 };
    NSLog(@"接口:%@请求%@参数：%@", kAPI_NAME_GetVisitCheckInventory, kAPI_NAME_GetVisitCheckInventory, parameters);
    [manager POST:API_GetVisitCheckInventory parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME_GetVisitCheckInventory, responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        if(_type == 1) {
            if([_delegate respondsToSelector:@selector(successOfGetVisitCheckInventory:)]) {
                [_delegate successOfGetVisitCheckInventory:msg];
            }
        }else {
            if([_delegate respondsToSelector:@selector(failureOfGetVisitCheckInventory:)]) {
                [_delegate failureOfGetVisitCheckInventory:msg];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@|请求失败:%@", kAPI_NAME_GetVisitCheckInventory, error);
        if([_delegate respondsToSelector:@selector(failureOfGetVisitCheckInventory:)]) {
            [_delegate failureOfGetVisitCheckInventory:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME_GetVisitCheckInventory]];
        }
    }];
}

- (void)GetVisitRecommendedOrder:(nullable NSString *)strVisitIdx andStrRecommendedOrder:(nullable NSString *)strRecommendedOrder {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strVisitIdx": strVisitIdx,
                                 @"strRecommendedOrder": strRecommendedOrder,
                                 @"strLicense": @""
                                 };
    NSLog(@"接口:%@请求%@参数：%@", kAPI_NAME_GetVisitRecommendedOrder, kAPI_NAME_GetVisitRecommendedOrder, parameters);
    [manager POST:API_GetVisitRecommendedOrder parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME_GetVisitRecommendedOrder, responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        if(_type == 1) {
            if([_delegate respondsToSelector:@selector(successOfGetVisitRecommendedOrder:)]) {
                [_delegate successOfGetVisitRecommendedOrder:msg];
            }
        }else {
            if([_delegate respondsToSelector:@selector(failureOfGetVisitRecommendedOrder:)]) {
                [_delegate failureOfGetVisitRecommendedOrder:msg];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@|请求失败:%@", kAPI_NAME_GetVisitRecommendedOrder, error);
        if([_delegate respondsToSelector:@selector(failureOfGetVisitRecommendedOrder:)]) {
            [_delegate failureOfGetVisitRecommendedOrder:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME_GetVisitRecommendedOrder]];
        }
    }];
}


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
             andPictureFile9:(nullable NSString *)PictureFile9 {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strVisitIdx": strVisitIdx,
                                 @"strVividDisplayCbx": strVividDisplayCbx,
                                 @"strVividDisplayText": strVividDisplayText,
                                 @"PictureFile1": PictureFile1,
                                 @"PictureFile2": PictureFile2,
                                 @"PictureFile3": PictureFile3,
                                 @"PictureFile4": PictureFile4,
                                 @"PictureFile5": PictureFile5,
                                 @"PictureFile6": PictureFile6,
                                 @"PictureFile7": PictureFile7,
                                 @"PictureFile8": PictureFile8,
                                 @"PictureFile9": PictureFile9,
                                 @"strLicense": @""
                                 };
    NSLog(@"接口:%@请求%@参数：%@", kAPI_NAME_GetVisitVividDisplay, kAPI_NAME_GetVisitVividDisplay, parameters);
    [manager POST:API_GetVisitVividDisplay parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME_GetVisitVividDisplay, responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        if(_type == 1) {
            if([_delegate respondsToSelector:@selector(successOfGetVisitVividDisplay:)]) {
                [_delegate successOfGetVisitVividDisplay:msg];
            }
        }else {
            if([_delegate respondsToSelector:@selector(failureOfGetVisitVividDisplay:)]) {
                [_delegate failureOfGetVisitVividDisplay:msg];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@|请求失败:%@", kAPI_NAME_GetVisitVividDisplay, error);
        if([_delegate respondsToSelector:@selector(failureOfGetVisitVividDisplay:)]) {
            [_delegate failureOfGetVisitVividDisplay:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME_GetVisitVividDisplay]];
        }
    }];
}


- (void)GetVisitLeaveShop:(nullable NSString *)strVisitIdx {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strVisitIdx": strVisitIdx,
                                 @"strLicense": @""
                                 };
    NSLog(@"接口:%@请求%@参数：%@", kAPI_NAME_GetVisitLeaveShop, kAPI_NAME_GetVisitLeaveShop, parameters);
    [manager POST:API_GetVisitLeaveShop parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME_GetVisitLeaveShop, responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        if(_type == 1) {
            if([_delegate respondsToSelector:@selector(successOfGetVisitLeaveShop:)]) {
                [_delegate successOfGetVisitLeaveShop:msg];
            }
        }else {
            if([_delegate respondsToSelector:@selector(failureOfGetVisitLeaveShop:)]) {
                [_delegate failureOfGetVisitLeaveShop:msg];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@|请求失败:%@", kAPI_NAME_GetVisitLeaveShop, error);
        if([_delegate respondsToSelector:@selector(failureOfGetVisitLeaveShop:)]) {
            [_delegate failureOfGetVisitLeaveShop:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME_GetVisitLeaveShop]];
        }
    }];
}


- (void)VividDisplayCBX {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strLicense": @""
                                 };
    NSLog(@"接口:%@请求%@参数：%@", API_VividDisplayCBX, kAPI_NAME_VividDisplayCBX, parameters);
    [manager POST:API_VividDisplayCBX parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME_VividDisplayCBX, responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        NSArray *result = responseObject[@"result"];
        if(_type == 1) {
            if([_delegate respondsToSelector:@selector(successOfVividDisplayCBX:andCBX:)]) {
                [_delegate successOfVividDisplayCBX:msg andCBX:result];
            }
        }else {
            if([_delegate respondsToSelector:@selector(failureOfVividDisplayCBX:)]) {
                [_delegate failureOfVividDisplayCBX:msg];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@|请求失败:%@", kAPI_NAME_VividDisplayCBX, error);
        if([_delegate respondsToSelector:@selector(failureOfVividDisplayCBX:)]) {
            [_delegate failureOfVividDisplayCBX:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME_VividDisplayCBX]];
        }
    }];
}


- (void)GetFatherAddress:(nullable NSString *)strAddressIdx {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strAddressIdx": strAddressIdx,
                                 @"strLicense": @""
                                 };
    NSLog(@"接口:%@请求%@参数：%@", API_GetFatherAddress, kAPI_NAME_GetFatherAddress, parameters);
    [manager POST:API_GetFatherAddress parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@|请求成功---%@", kAPI_NAME_GetFatherAddress, responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        NSArray *result = responseObject[@"result"];
        if(_type == 1) {
            
            PartyModel *partyM = [[PartyModel alloc] init];
            AddressModel *addressM = [[AddressModel alloc] init];
            if(result.count > 0) {
                NSDictionary *dict = result[0];
                partyM.PARTY_CITY = dict[@"PARTY_CITY"];
                partyM.IDX = dict[@"IDX"];
                addressM.IDX = dict[@"ADDRESS_IDX"];
                partyM.PARTY_CLASS = dict[@"PARTY_CLASS"];
                addressM.ADDRESS_INFO = dict[@"ADDRESS_INFO"];
                partyM.PARTY_TYPE = dict[@"PARTY_TYPE"];
                partyM.PARTY_NAME = dict[@"PARTY_NAME"];
                partyM.PARTY_PROPERTY = dict[@"PARTY_PROPERTY"];
                addressM.CONTACT_PERSON = dict[@"CONTACT_PERSON"];
                addressM.ADDRESS_ALIAS = dict[@"ADDRESS_ALIAS"];
                addressM.CONTACT_TEL = dict[@"CONTACT_TEL"];
                partyM.PARTY_CODE = dict[@"PARTY_CODE"];
                addressM.ADDRESS_CODE = dict[@"ADDRESS_CODE"];
                partyM.PARTY_COUNTRY = dict[@"PARTY_COUNTRY"];
            }
            if([_delegate respondsToSelector:@selector(successOfGetFatherAddress:andPartyM:andAddressM:)]) {
                [_delegate successOfGetFatherAddress:msg andPartyM:partyM andAddressM:addressM];
            }
        }else {
            if([_delegate respondsToSelector:@selector(failureOfGetFatherAddress:)]) {
                [_delegate failureOfGetFatherAddress:msg];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@|请求失败:%@", kAPI_NAME_GetFatherAddress, error);
        if([_delegate respondsToSelector:@selector(failureOfGetFatherAddress:)]) {
            [_delegate failureOfGetFatherAddress:[NSString stringWithFormat:@"%@|请求失败", kAPI_NAME_GetFatherAddress]];
        }
    }];
}

@end
