//
//  LatLng.h
//  Order
//
//  Created by wenwang wang on 2019/1/11.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LatLng : NSString

/// 经度
@property (assign, nonatomic) CLLocationDegrees lat;

/// 纬度
@property (assign, nonatomic) CLLocationDegrees lng;

/// 标注名称
@property (copy, nonatomic) NSString *title;

/// 6 未拜访，7 已拜访
@property (assign, nonatomic) int visitStatus;

/// 门店地址
@property (copy, nonatomic) NSString *address;

/// 与『我的位置』的距离
@property (assign, nonatomic) CLLocationDistance distanceMyLocation;

@end
