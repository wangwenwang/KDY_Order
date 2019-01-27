//
//  VisitRoutePlanViewController.m
//  Order
//
//  Created by wenwang wang on 2019/1/10.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "VisitRoutePlanViewController.h"
#import "RouteAnnotation.h"
#import "Tools.h"
#import "LatLng.h"
#import <BMKLocationKit/BMKLocationComponent.h>
#import "LMBMKPinAnnotationView.h"
#import <MapKit/MKFoundation.h>
#import <MapKit/MKPlacemark.h>
#import <MapKit/MKMapItem.h>

#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>

#import <Masonry.h>
#import <MBProgressHUD.h>

@interface VisitRoutePlanViewController ()<BMKMapViewDelegate, BMKRouteSearchDelegate, BMKLocationManagerDelegate, BMKLocationServiceDelegate, BMKGeoCodeSearchDelegate, UIGestureRecognizerDelegate> {
    
    /// 百度地图定位服务
    BMKLocationService *_locationService;
    
    double navLat;
    double navLng;
    NSString *navAddress;
    int _orderPathDistance;
    BMKRouteSearch *drivingRouteSearch_all;
    UIView *_distanceContainerView;
    UIView *_shopInfoContainerView;
    BMKRouteSearch *drivingRouteSearch_did;
    BMKRouteSearch *drivingRouteSearch_will;
    // 已行驶Label
    UILabel *distanceDidLabel;
    // 已行驶距离
    int _orderPathDistance_did;
}

//当前界面的mapView
@property (nonatomic, strong) BMKMapView *mapView;

@property (assign, nonatomic) NSUInteger times;

@property (strong, nonatomic) LatLng *startLatLng;

@property (strong, nonatomic) NSMutableArray *latlngArray;

// 正向编码返回结果次数
@property (assign, nonatomic) int geoCount;

@property (weak, nonatomic) IBOutlet UIView *mapViewContainerView;

// 是否有拜访完成
@property (assign, nonatomic) BOOL isHasVisitComplete;

@end

@implementation VisitRoutePlanViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _startLatLng = [[LatLng alloc] init];
        _latlngArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"推荐路线";
    
    _locationService = [[BMKLocationService alloc] init];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    for (GetPartyVisitItemModel *m in _visitList) {
        
        BMKGeoCodeSearch *search = [[BMKGeoCodeSearch alloc] init];
        search.delegate = self;
        BMKGeoCodeSearchOption *geoCodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
        // 广东省深圳市龙华区民治街道8号仓
        // 广东省深圳市龙华区民治街道民乐科技园
        geoCodeSearchOption.address = m.pARTYADDRESS; //m.pARTYADDRESS;
        BOOL flag = [search geoCode: geoCodeSearchOption];
        if (flag) {
            NSLog(@"geo检索发送成功");
        }  else  {
            NSLog(@"geo检索发送失败");
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    //当mapView即将被显示的时候调用，恢复之前存储的mapView状态
    _locationService.delegate = self;
    _mapView.delegate = self;
    [_mapView viewWillAppear];
    [_locationService startUserLocationService];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    //当mapView即将被隐藏的时候调用，存储当前mapView的状态
    _locationService.delegate = nil;
    _mapView.delegate = nil;
    [_mapView viewWillDisappear];
    [_locationService stopUserLocationService];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - 手势

- (void)handleTap {
    
    [self navigationOnclick:navLat andLng:navLng andAddress:navAddress];
}

#pragma mark - 功能函数

- (void)addShopAnnotation {
    
    for (LatLng *latlng in _latlngArray) {
        
        RouteAnnotation *item = [[RouteAnnotation alloc] init];
        item = [[RouteAnnotation alloc] init];
        item.coordinate = CLLocationCoordinate2DMake(latlng.lat, latlng.lng);
        item.title = latlng.title;
        item.type = latlng.visitStatus;
        item.address = latlng.address;
        item.subtitle = latlng.address;
        [_mapView addAnnotation:item];
    }
}

// 根据polyline设置地图范围
- (void)mapViewFitPolyLine:(BMKPolyline *)polyline {
    if(polyline.pointCount < 1) {
        return;
    }
    
    BMKMapPoint pt = polyline.points[0];
    double ltX = pt.x;
    double rbX = pt.x;
    double ltY = pt.y;
    double rbY = pt.y;
    
    for (int i = 1; i < polyline.pointCount; i++) {
        BMKMapPoint pt = polyline.points[i];
        if(pt.x < ltX) {
            ltX = pt.x;
        }
        if(pt.x > rbX) {
            rbX = pt.x;
        }
        if(pt.y > ltY) {
            ltY = pt.y;
        }
        if(pt.y < rbY) {
            rbY = pt.y;
        }
    }
    //没补全
    BMKMapRect rect = BMKMapRectMake(ltX, ltY, rbX - ltX, rbY - ltY);
    _mapView.visibleMapRect = rect;
    _mapView.zoomLevel = _mapView.zoomLevel - 0.3;
}

/**
 * 根据 RouteAnnotation 的类型获取对应的图标
 *
 * routeAnnotation: RouteAnnotation
 *
 * return 对应类型的图标
 */
- (BMKAnnotationView *)getViewForRouteAnnotation:(RouteAnnotation *)routeAnnotation {
    LMBMKPinAnnotationView *view = nil;
    
    NSLog(@"%@", [NSString stringWithFormat:@"%lu,  %d", (unsigned long)_times, routeAnnotation.type]);
    _times ++;
    
    NSString *imageName = nil;
    switch (routeAnnotation.type) {
        case 0: imageName = @"nav_start"; break;
        case 1: imageName = @"nav_end"; break;
        case 2: imageName = @"nav_bus"; break;
        case 3: imageName = @"nav_rail"; break;
        case 4: imageName = @"direction"; break;
        case 5: imageName = @"nav_waypoint"; break;
        default:
            break;
    }
    NSString *identifier = [NSString stringWithFormat:@"%@_annotation", imageName];
    view = (LMBMKPinAnnotationView *)[_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if(view == nil) {
        view = [[LMBMKPinAnnotationView alloc]initWithAnnotation:routeAnnotation reuseIdentifier:identifier];
        view.centerOffset = CGPointMake(0, -(CGRectGetHeight(view.frame) * 0.5));
        view.canShowCallout = YES;
    }
    view.annotation = routeAnnotation;
    
    NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/mapapi.bundle/"];
    NSBundle *bundle = [[NSBundle alloc] initWithPath:bundlePath];
    NSString *imagePath = [[bundle resourcePath] stringByAppendingString:[NSString stringWithFormat:@"/images/icon_%@.png", imageName]];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    if(routeAnnotation.type == 4) {
        image = [self imageRotated:image andDegress:routeAnnotation.degree];
    }
    if(image != nil) {
        view.image = image;
    }
    if(routeAnnotation.type == 6) {
        view.image = [UIImage imageNamed:@"LM_visit_client"];
        view.animatesDrop = YES;
    }else if(routeAnnotation.type == 7) {
        view.image = [UIImage imageNamed:@"LM_visit_client_green"];
        view.animatesDrop = YES;
    }
    return view;
}

/**
 * 旋转图片
 *
 * image: 需要旋转的图片
 *
 * degrees: 旋转的角度
 *
 * return 旋转后的图片
 */
- (UIImage *)imageRotated:(UIImage *)image andDegress:(int)degrees {
    CGFloat width = CGImageGetWidth(image.CGImage);
    CGFloat height = CGImageGetHeight(image.CGImage);
    CGSize rotatedSize = CGSizeMake(width, height);
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width / 2, rotatedSize.height / 2);
    CGContextRotateCTM(bitmap, (float)(degrees * M_PI / 180.0));
    CGContextRotateCTM(bitmap, (float)M_PI);
    CGContextScaleCTM(bitmap, -1.0, 1.0);
    CGContextDrawImage(bitmap, CGRectMake(-rotatedSize.width / 2, -rotatedSize.height / 2, rotatedSize.width, rotatedSize.height), image.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    return newImage;
    
}


// 百度地图经纬度转换为高德地图经纬度
- (CLLocationCoordinate2D)bdToGaoDe:(CLLocationCoordinate2D)location {
    
    double bd_lat = location.latitude;
    double bd_lon = location.longitude;
    double PI = 3.14159265358979324 * 3000.0 / 180.0;
    double x = bd_lon - 0.0065, y = bd_lat - 0.006;
    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * PI);
    double theta = atan2(y, x) - 0.000003 * cos(x * PI);
    return CLLocationCoordinate2DMake(z * sin(theta), z * cos(theta));
}

// 导航
- (void)navigationOnclick:(double)lat andLng:(double)lng andAddress:(NSString *)address {
    
    NSMutableArray *maps = [NSMutableArray array];
    
    //苹果原生地图-苹果原生地图方法和其他不一样
    NSMutableDictionary *iosMapDic = [NSMutableDictionary dictionary];
    iosMapDic[@"title"] = @"苹果地图";
    [maps addObject:iosMapDic];
    
    //高德地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
        // 百度转高德坐标
        CLLocationCoordinate2D clBaidu = CLLocationCoordinate2DMake(lat, lng);
        CLLocationCoordinate2D clGaode = [self bdToGaoDe:clBaidu];
        NSMutableDictionary *gaodeMapDic = [NSMutableDictionary dictionary];
        gaodeMapDic[@"title"] = @"高德地图";
        NSString *urlString = [[NSString stringWithFormat:@"iosamap://navi?sourceApplication=%@&poiid=BGVIS&lat=%f&lon=%f&dev=0", @"配货易订单", clGaode.latitude, clGaode.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        gaodeMapDic[@"url"] = urlString;
        [maps addObject:gaodeMapDic];
    }
    
    //百度地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]]) {
        CLLocationCoordinate2D clBaidu = CLLocationCoordinate2DMake(lat, lng);
        CLLocationCoordinate2D clGaode = [self bdToGaoDe:clBaidu];
        NSMutableDictionary *baiduMapDic = [NSMutableDictionary dictionary];
        baiduMapDic[@"title"] = @"百度地图";
        NSString *urlString =[[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=%@&mode=driving&coord_type=gcj02", clGaode.latitude, clGaode.longitude, @""] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        baiduMapDic[@"url"] = urlString;
        [maps addObject:baiduMapDic];
    }
    
    //谷歌地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]) {
        NSMutableDictionary *googleMapDic = [NSMutableDictionary dictionary];
        googleMapDic[@"title"] = @"谷歌地图";
        NSString *urlString = [[NSString stringWithFormat:@"comgooglemaps://?x-source=%@&x-success=%@&saddr=&daddr=%@&directionsmode=driving",@"导航测试",@"nav123456", address] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        googleMapDic[@"url"] = urlString;
        [maps addObject:googleMapDic];
    }
    
    //选择
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"选择地图" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil])];
    
    NSInteger index = maps.count;
    
    for (int i = 0; i < index; i++) {
        
        NSString * title = maps[i][@"title"];
        
        //苹果原生地图方法
        if (i == 0) {
            
            UIAlertAction * action = [UIAlertAction actionWithTitle:title style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                // 起点
                MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
                
                // 终点
                CLGeocoder *geo = [[CLGeocoder alloc] init];
                [geo geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                    
                    CLPlacemark *endMark=placemarks.firstObject;
                    MKPlacemark *mkEndMark=[[MKPlacemark alloc]initWithPlacemark:endMark];
                    MKMapItem *endItem=[[MKMapItem alloc]initWithPlacemark:mkEndMark];
                    NSDictionary *dict=@{
                                         MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving,
                                         MKLaunchOptionsMapTypeKey:@(0),
                                         MKLaunchOptionsShowsTrafficKey:@(YES)
                                         };
                    [MKMapItem openMapsWithItems:@[currentLocation,endItem] launchOptions:dict];
                }];
            }];
            [alert addAction:action];
            
            continue;
        }
        
        
        UIAlertAction * action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *urlString = maps[i][@"url"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        }];
        
        [alert addAction:action];
    }
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark - BMKRouteSearchDelegate
/**
 *返回驾乘搜索结果
 *@param searcher 搜索对象
 *@param result 搜索结果，类型为BMKDrivingRouteResult
 *@param error 错误号，@see BMKSearchErrorCode
 */
- (void)onGetDrivingRouteResult:(BMKRouteSearch*)searcher result:(BMKDrivingRouteResult*)result errorCode:(BMKSearchErrorCode)error{
    //BMKSearchErrorCode错误码，BMK_SEARCH_NO_ERROR：检索结果正常返回
    
    if(searcher == drivingRouteSearch_all) {
        NSLog(@"-----------总路线规划");
        if(error == BMK_SEARCH_NO_ERROR) {
            BMKDrivingRouteLine *plan = result.routes[0];
            NSInteger size = plan.steps.count;
            unsigned int planPointCounts = 0;
            for (int i = 0; i < size; i++) {
                BMKDrivingStep *transitStep = plan.steps[i];
                
                //            NSLog(@"sizesizesize:%ld, planPointCounts:%d", (long)size, planPointCounts);
                
                // 添加 annotation 节点
                RouteAnnotation *item = [[RouteAnnotation alloc] init];
                item.coordinate = transitStep.entrace.location;
                item.title = transitStep.instruction;
                item.degree = transitStep.direction * 30;
                item.type = 4;
                [_mapView addAnnotation:item];
                
                // 轨迹点总数累计
                planPointCounts = transitStep.pointsCount + planPointCounts;
            }
            // 门店标注
            [self addShopAnnotation];
            
            // 轨迹点
            BMKMapPoint tempPoints [planPointCounts];
            memset(tempPoints, 0, sizeof(tempPoints));
            int i = 0;
            for (int j = 0; j < size; j++) {
                BMKDrivingStep *transitStep = plan.steps[j];
                for (int k = 0; k < transitStep.pointsCount; k++) {
                    tempPoints[i].x = transitStep.points[k].x;
                    tempPoints[i].y = transitStep.points[k].y;
                    i += 1;
                }
            }
            
            // 通过 points 构建 BMKPolyline
            BMKPolyline *polyLine = [BMKPolyline polylineWithPoints:tempPoints count:planPointCounts];
            polyLine.title = @"总路程";
            
            // 缩放地图
            [self mapViewFitPolyLine:polyLine];
            
            [_mapView addOverlay:polyLine];
            
            // 统计总距离
            _orderPathDistance = _orderPathDistance + plan.distance;
            CGFloat distance = _orderPathDistance / 1000.0;
            NSLog(@"-------distance:%f", distance);
            
            
            // 客户地址容器
            _distanceContainerView = [[UIView alloc] init];
            [self.view addSubview:_distanceContainerView];
            _distanceContainerView.backgroundColor = [UIColor whiteColor];
            [_distanceContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.right.mas_equalTo(0);
                make.height.mas_equalTo(60);
                make.bottom.mas_equalTo(0);
            }];
            
            // 总路程
            UILabel *distanceAllLabel = [[UILabel alloc] init];
            [_distanceContainerView addSubview:distanceAllLabel];
            
            // 已行驶
            distanceDidLabel = [[UILabel alloc] init];
            [_distanceContainerView addSubview:distanceDidLabel];
            
            distanceAllLabel.textColor = [UIColor redColor];
            distanceAllLabel.textAlignment = NSTextAlignmentCenter;
            distanceAllLabel.text = [NSString stringWithFormat:@"总路程：%.1f公里", distance];
            distanceAllLabel.font = [UIFont systemFontOfSize:15];
            [distanceAllLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.right.mas_equalTo(distanceDidLabel.mas_left);
                make.width.mas_equalTo(distanceDidLabel.mas_width);
                make.height.mas_equalTo(60);
                make.bottom.mas_equalTo(-8);
            }];
            
            distanceDidLabel.textColor = RGB(87, 169, 55);
            distanceDidLabel.textAlignment = NSTextAlignmentCenter;
            if(_isHasVisitComplete == YES) {
                
                distanceDidLabel.text = [NSString stringWithFormat:@"已行驶："];
            }else {
                
                distanceDidLabel.text = [NSString stringWithFormat:@"已行驶：0公里"];
            }
            distanceDidLabel.font = [UIFont systemFontOfSize:15];
            [distanceDidLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(0);
                make.left.mas_equalTo(distanceAllLabel.mas_right);
                make.width.mas_equalTo(distanceAllLabel.mas_width);
                make.height.mas_equalTo(60);
                make.bottom.mas_equalTo(-8);
            }];
        } else {
            [Tools showAlert:self.view andTitle:@"获取线路失败！"];
            [self addShopAnnotation];
        }
    }
    if(searcher == drivingRouteSearch_did) {
        NSLog(@"-----------已行驶路程");
        if(error == BMK_SEARCH_NO_ERROR) {
            BMKDrivingRouteLine *plan = result.routes[0];
            NSInteger size = plan.steps.count;
            unsigned int planPointCounts = 0;
            for (int i = 0; i < size; i++) {
                BMKDrivingStep *transitStep = plan.steps[i];
                
                // 添加 annotation 节点
                RouteAnnotation *item = [[RouteAnnotation alloc] init];
                item.coordinate = transitStep.entrace.location;
                item.title = transitStep.instruction;
                item.degree = transitStep.direction * 30;
                item.type = 4;
                [_mapView addAnnotation:item];
                
                // 轨迹点总数累计
                planPointCounts = transitStep.pointsCount + planPointCounts;
            }
            
            // 轨迹点
            BMKMapPoint tempPoints [planPointCounts];
            memset(tempPoints, 0, sizeof(tempPoints));
            int i = 0;
            for (int j = 0; j < size; j++) {
                BMKDrivingStep *transitStep = plan.steps[j];
                for (int k = 0; k < transitStep.pointsCount; k++) {
                    tempPoints[i].x = transitStep.points[k].x;
                    tempPoints[i].y = transitStep.points[k].y;
                    i += 1;
                }
            }
            
            // 通过 points 构建 BMKPolyline
            BMKPolyline *polyLine = [BMKPolyline polylineWithPoints:tempPoints count:planPointCounts];
            polyLine.title = @"已行驶";
            
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                
                usleep(100000);
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [_mapView addOverlay:polyLine];
                });
            });
            // 统计总距离
            _orderPathDistance_did = _orderPathDistance_did + plan.distance;
            CGFloat distance = _orderPathDistance_did / 1000.0;
            dispatch_async(dispatch_get_main_queue(), ^{
                distanceDidLabel.text = [NSString stringWithFormat:@"已行驶：%.1f公里", distance];
            });
            NSLog(@"-------distance:%f", distance);
        } else {
            [Tools showAlert:self.view andTitle:@"获取已行驶线路失败！"];
        }
    }
    
    NSLog(@"获取驾车路线成功发挥结果:%u _已行驶", error);
}


#pragma mark - BMKMapViewDelegate
// 百度地图初始化完成
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView {
    
    // 先关闭显示的定位图层
    _mapView.showsUserLocation = NO;
    // 设置定位的状态
    //    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    // 显示定位图层
    _mapView.showsUserLocation = YES;
    // 设置定位精度
    _locationService.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    // 指定最小距离更新(米)，默认：kCLDistanceFilterNone
    _locationService.distanceFilter = 1;
    //    _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
}

/**
 *根据overlay生成对应的View
 *@param mapView 地图View
 *@param overlay 指定的overlay
 *@return 生成的覆盖物View
 */
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay {
    NSLog(@"overlay %f %f", overlay.coordinate.latitude, overlay.coordinate.longitude);
    NSLog(@"overlay title %@", overlay.title);
    NSLog(@"overlay subtitle %@", overlay.subtitle);
    NSLog(@"overlay %f %f", overlay.coordinate.latitude, overlay.coordinate.longitude);
    
    if([overlay.title isEqualToString:@"总路程"]) {
        
        if(overlay != nil) {
            BMKPolylineView *polylineView = [[BMKPolylineView alloc] initWithPolyline:overlay];
            polylineView.strokeColor = [UIColor redColor];
            polylineView.lineWidth = 3;
            return polylineView;
        } else {
            return nil;
        }
    }else if([overlay.title isEqualToString:@"已行驶"]) {
        
        if(overlay != nil) {
            BMKPolylineView *polylineView = [[BMKPolylineView alloc] initWithPolyline:overlay];
            polylineView.strokeColor = RGB(87, 169, 55);
            polylineView.lineWidth = 3;
            return polylineView;
        } else {
            return nil;
        }
    }else {
        
        if(overlay != nil) {
            BMKPolylineView *polylineView = [[BMKPolylineView alloc] initWithPolyline:overlay];
            polylineView.strokeColor = [UIColor blackColor];
            polylineView.lineWidth = 3;
            return polylineView;
        } else {
            return nil;
        }
    }
}

- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _shopInfoContainerView.alpha = 0;
        _distanceContainerView.alpha = 1;
        _mapView.mapScaleBarPosition = CGPointMake(13, _mapView.frame.size.height - 95); //比例尺的位置
    }];
}

/**
 *根据anntation生成对应的View
 *@param mapView 地图View
 *@param annotation 指定的标注
 *@return 生成的标注View
 */
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    RouteAnnotation *routeAnnotation = annotation;
    if(routeAnnotation) {
        return [self getViewForRouteAnnotation:routeAnnotation];
    }else {
        return nil;
    }
}

- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view {
    
    NSLog(@"经度: %f", view.annotation.coordinate.longitude);
    NSLog(@"纬度: %f", view.annotation.coordinate.latitude);
    NSLog(@"地址: %@", view.annotation.subtitle);
    
    NSString *partyName = @""; // 客户名称
    NSString *visitStatus = nil; // 拜访状态
    for (GetPartyVisitItemModel *m in _visitList) {
        if([m.pARTYADDRESS isEqualToString:view.annotation.subtitle]) {
            partyName = m.pARTYNAME;
            visitStatus = m.vISITSTATES;
            break;
        }
    }
    
    if(visitStatus == nil) {
        return;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _distanceContainerView.alpha = 0;
        _shopInfoContainerView.alpha = 1;
        _mapView.mapScaleBarPosition = CGPointMake(13, _mapView.frame.size.height - 215); //比例尺的位置
    }];
    
    [_shopInfoContainerView removeFromSuperview];
    _shopInfoContainerView = nil;
    if(!_shopInfoContainerView) {
        
        _shopInfoContainerView = [[UIView alloc] init];
        [self.view addSubview:_shopInfoContainerView];
    }
    _shopInfoContainerView.backgroundColor = [UIColor whiteColor];
    _shopInfoContainerView.layer.cornerRadius = 3.0f;
    [_shopInfoContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(180);
    }];
    
    // 客户名称
    UILabel *partyNameLabel = [[UILabel alloc] init];
    [_shopInfoContainerView addSubview:partyNameLabel];
    partyNameLabel.text = [NSString stringWithFormat:@"门店名称：%@", partyName];
    partyNameLabel.font = [UIFont systemFontOfSize:15];
    [partyNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(12);
    }];
    
    // 客户地址
    UILabel *partyAddressLabel = [[UILabel alloc] init];
    [_shopInfoContainerView addSubview:partyAddressLabel];
    partyAddressLabel.text = [NSString stringWithFormat:@"门店地址：%@", view.annotation.subtitle];
    partyAddressLabel.font = [UIFont systemFontOfSize:15];
    [partyAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(partyNameLabel.mas_bottom).mas_equalTo(6);
    }];
    
    // 拜访状态
    UILabel *visitStatusLabel = [[UILabel alloc] init];
    [_shopInfoContainerView addSubview:visitStatusLabel];
    visitStatusLabel.text = [NSString stringWithFormat:@"拜访状态：%@", [Tools getVISIT_STATES:visitStatus]];
    visitStatusLabel.font = [UIFont systemFontOfSize:15];
    [visitStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(partyAddressLabel.mas_bottom).mas_equalTo(6);
    }];
    
    // 查看路线按钮
    UIView *btnView = [[UIView alloc] init];
    [_shopInfoContainerView addSubview:btnView];
    btnView.layer.cornerRadius = 2.0f;
    btnView.layer.borderWidth = 1.0f;
    btnView.layer.borderColor = RGB(240, 158, 56).CGColor;
    [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-30);
        make.height.mas_equalTo(40);
    }];
    // 单击的手势
    UITapGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap)];
    tapRecognize.numberOfTapsRequired = 1;
    tapRecognize.delegate = self;
    [tapRecognize setEnabled :YES];
    [tapRecognize delaysTouchesBegan];
    [tapRecognize cancelsTouchesInView];
    [btnView addGestureRecognizer:tapRecognize];
    navLat =  view.annotation.coordinate.latitude;
    navLng = view.annotation.coordinate.longitude;
    navAddress = view.annotation.subtitle;
    
    UILabel *btnViewText = [[UILabel alloc] init];
    [btnView addSubview:btnViewText];
    btnViewText.font = [UIFont systemFontOfSize:15];
    btnViewText.text = @"导航";
    btnViewText.textColor = RGB(240, 158, 56);
    [btnViewText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
}

#pragma mark - BMKLocationServiceDelegate 前台显示
/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation {
    
    [_mapView updateLocationData:userLocation];
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    
    [_mapView updateLocationData:userLocation];
    _startLatLng.lat = userLocation.location.coordinate.latitude;
    _startLatLng.lng = userLocation.location.coordinate.longitude;
    NSLog(@"已获取当前位置");
}


#pragma mark - BMKGeoCodeSearchDelegate

/**
 正向地理编码检索结果回调
 
 @param searcher 检索对象
 @param result 正向地理编码检索结果
 @param error 错误码，@see BMKCloudErrorCode
 */
- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error {
    if (error == BMK_SEARCH_NO_ERROR) {
        NSLog(@"检索成功");
        //在此处理正常结果
        LatLng *latlng = [[LatLng alloc] init];
        latlng.lat = result.location.latitude;
        latlng.lng = result.location.longitude;
        for (GetPartyVisitItemModel *m in _visitList) {
            // 百度地图正向编码会把中文符号变成英文符号，例如：
            // "广东省深圳市龙华区民治街道天虹商场（民治店）"  会转换成  "广东省深圳市龙华区民治街道天虹商场(民治店)"
            if([[Tools ToDBC:m.pARTYADDRESS] isEqualToString:result.address]) {
                latlng.title = m.pARTYNAME;
                if([m.vISITSTATES isEqualToString:@"离店"]) {
                    latlng.visitStatus = 7;
                }else {
                    latlng.visitStatus = 6;
                }
                break;
            }
        }
        latlng.address = result.address;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            for (int i = 0; i < 200; i++) {
                if(!_startLatLng.lat) {
                    NSLog(@"等待当前位置坐标_下一步_路线排序");
                    usleep(100000);
                    continue;
                }
                // 路线最优
                BMKMapPoint point0 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(_startLatLng.lat, _startLatLng.lng));
                BMKMapPoint point1 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(latlng.lat, latlng.lng));
                latlng.distanceMyLocation = BMKMetersBetweenMapPoints(point0,point1);
                [_latlngArray addObject:latlng];
                break;
            }
            
            // 冒泡排序
            NSLog(@"冒泡排序开始");
            for (int i = 0; i < _latlngArray.count - 1; i++) {
                for (int j = 0; j < _latlngArray.count - 1 - i; j++) {
                    LatLng *leftLatlng = _latlngArray[j];
                    LatLng *rightLatlng = _latlngArray[j + 1];
                    CLLocationDistance left = leftLatlng.distanceMyLocation;
                    CLLocationDistance right = rightLatlng.distanceMyLocation;
                    if (left > right) {
                        [_latlngArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                    }
                }
            }
            NSLog(@"冒泡排序完成");
        });
    }
    else {
        NSLog(@"检索失败");
    }
    _geoCount ++;
    if(_geoCount == _visitList.count) {
        // 全部地址编码完成
        NSLog(@"全部地址正向编码完成（地址转坐标）");
        
        _mapView = [[BMKMapView alloc] initWithFrame:self.view.bounds];
        //设置mapView的代理
        _mapView.delegate = self;
        _mapView.showMapScaleBar = YES;
        _mapView.mapScaleBarPosition = CGPointMake(13, _mapView.frame.size.height - 95); //比例尺的位置
        //将mapView添加到当前视图中
        [self.view addSubview:_mapView];
        
        //初始化BMKRouteSearch实例
        drivingRouteSearch_all = [[BMKRouteSearch alloc]init];
        //设置驾车路径的规划
        drivingRouteSearch_all.delegate = self;
        
        BMKDrivingRoutePlanOption *drivingRoutePlanOption = [[BMKDrivingRoutePlanOption alloc] init];
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            for (int i = 0; i < 200; i++) {
                
                if(!_startLatLng.lat) {
                    
                    NSLog(@"等待当前位置坐标_下一步_路线规划");
                    usleep(100000);
                    continue;
                }
                
                NSLog(@"开始路线规划");
                //用着路线规划
                NSMutableArray *tempLatlng = [[NSMutableArray alloc]initWithArray:[_latlngArray copy]];
                
                // 起点
                BMKPlanNode *start = [[BMKPlanNode alloc]init];
                start.pt = CLLocationCoordinate2DMake(_startLatLng.lat, _startLatLng.lng);
                NSLog(@"起点 %f %f", start.pt.latitude, start.pt.longitude);
                
                // 终点
                BMKPlanNode *end = [[BMKPlanNode alloc]init];
                if(tempLatlng.count > 0) {
                    LatLng *latlng = [tempLatlng lastObject];
                    end.pt = CLLocationCoordinate2DMake(latlng.lat, latlng.lng);
                    [tempLatlng removeLastObject];
                }
                NSLog(@"终点 %f %f", end.pt.latitude, end.pt.longitude);
                drivingRoutePlanOption.from = start;
                drivingRoutePlanOption.to = end;
                
                // 途经点
                NSMutableArray * wayPointsArray = [[NSMutableArray alloc] init];
                for (LatLng *latlng in tempLatlng) {
                    BMKPlanNode* wayPointItem = [[BMKPlanNode alloc]init];
                    wayPointItem.pt = CLLocationCoordinate2DMake(latlng.lat, latlng.lng);
                    [wayPointsArray addObject:wayPointItem];
                    NSLog(@"途经点 %f %f", wayPointItem.pt.latitude, wayPointItem.pt.longitude);
                }
                drivingRoutePlanOption.wayPointsArray = wayPointsArray;
                
                /**
                 发起驾乘路线检索请求，异步函数，返回结果在BMKRouteSearchDelegate的onGetDrivingRouteResult中
                 */
                BOOL flag = [drivingRouteSearch_all drivingSearch: drivingRoutePlanOption];
                if(flag) {
                    NSLog(@"驾车检索成功");
                } else {
                    NSLog(@"驾车检索失败");
                    [self addShopAnnotation];
                }
                
                
                
                
                
                
                // 规划已行驶
                BMKDrivingRoutePlanOption *drivingRoutePlanOption_did = [[BMKDrivingRoutePlanOption alloc] init];
                drivingRoutePlanOption_did.from = start;
                LatLng *latlng_last_did;
                int k = -1;
                for(int j = 0; j < _latlngArray.count; j++) {
                    LatLng *latlng = _latlngArray[j];
                    // 找到最后一个『已拜访』坐标
                    if(latlng.visitStatus == 7) {
                        latlng_last_did = latlng;
                        k = j;
                    }
                }
                // k != 0，有『已拜访』坐标
                NSMutableArray * wayPointsArray_did = [[NSMutableArray alloc] init];
                if(k != -1) {
                    
                    _isHasVisitComplete = YES;
                    for(int m = 0; m <= k; m++) {
                        LatLng *latlng = _latlngArray[m];
                        BMKPlanNode* wayPointItem = [[BMKPlanNode alloc]init];
                        wayPointItem.pt = CLLocationCoordinate2DMake(latlng.lat, latlng.lng);
                        [wayPointsArray_did addObject:wayPointItem];
                        NSLog(@"途经点_已行驶 %f %f", wayPointItem.pt.latitude, wayPointItem.pt.longitude);
                    }
                    
                    drivingRoutePlanOption_did.wayPointsArray = wayPointsArray_did;
                    end.pt = CLLocationCoordinate2DMake(latlng_last_did.lat, latlng_last_did.lng);
                    drivingRoutePlanOption_did.to = end;
                    //初始化BMKRouteSearch实例
                    drivingRouteSearch_did = [[BMKRouteSearch alloc]init];
                    //设置驾车路径的规划
                    drivingRouteSearch_did.delegate = self;
                    BOOL flag1 = [drivingRouteSearch_did drivingSearch: drivingRoutePlanOption];
                    if(flag1) {
                        NSLog(@"驾车检索成功_已行驶");
                    } else {
                        NSLog(@"驾车检索失败_已行驶");
                    }
                    
                }else {
                    
                    _isHasVisitComplete = NO;
                }
                
                
                
                
                
                
                break;
            }
        });
    }
}

@end
