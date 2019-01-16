//
//  LMBMKPinAnnotationView.h
//  Order
//
//  Created by wenwang wang on 2019/1/11.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKPinAnnotationView.h>

@interface LMBMKPinAnnotationView : BMKPinAnnotationView

/// 纬度
@property (assign, nonatomic) double lat;

/// 经度
@property (assign, nonatomic) double lng;

/// 地址
@property (copy, nonatomic) NSString *address;

@end
