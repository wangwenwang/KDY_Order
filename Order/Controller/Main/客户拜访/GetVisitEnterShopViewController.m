//
//  GetVisitEnterShopViewController.m
//  Order
//
//  Created by wenwang wang on 2018/11/20.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetVisitEnterShopViewController.h"
#import "UIImage+Compress.h"
#import "LM_alert.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "GetVisitEnterShopService.h"
#import "Tools.h"
#import <MBProgressHUD.h>
#import "ACMediaFrame.h"
#import "UIView+ACMediaExt.h"
// 位置
#import <BMKLocationkit/BMKLocationComponent.h>
#import <BMKLocationkit/BMKLocationAuth.h>
// 下一步
#import "GetVisitCheckInventoryViewController.h"



@interface GetVisitEnterShopViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, BMKLocationManagerDelegate, BMKLocationAuthDelegate, GetVisitEnterShopServiceDelegate>
{
    ACSelectMediaView *_mediaView;
}

// 网络层
@property (strong, nonatomic) GetVisitEnterShopService *service;

// 实际拜访地址
@property (weak, nonatomic) IBOutlet UILabel *ACTUAL_VISITING_ADDRESS;

// 确认
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

// 定位服务
@property (strong, nonatomic) BMKLocationManager *locationManager;

// 定位回调
@property (nonatomic, copy) BMKLocatingCompletionBlock completionBlock;

// 照片数组
@property (strong, nonatomic) NSArray *imageArr;

@end

@implementation GetVisitEnterShopViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[GetVisitEnterShopService alloc] init];
        _service.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"进店";
    
    [self initUI];
    
    // 初始化定位参数
    [self configLocationManager];
    // 声明回调
    [self initCompleteBlock];
    // 执行定位
    [self reGeocodeAction];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark - 功能函数

- (void)initUI {
    
    _confirmBtn.layer.cornerRadius = 20;
    _confirmBtn.layer.shadowOffset =  CGSizeMake(0, 3);
    _confirmBtn.layer.shadowOpacity = 0.5;
    _confirmBtn.layer.shadowColor =  [UIColor redColor].CGColor;
    
    ACSelectMediaView *mediaView = [[ACSelectMediaView alloc] initWithFrame:CGRectMake(0, 60, [[UIScreen mainScreen] bounds].size.width, 400)];
    mediaView.type = ACMediaTypeAll;
    mediaView.maxImageSelected = 2;
    mediaView.naviBarBgColor = [UIColor blueColor];
    mediaView.rowImageCount = 3;
    mediaView.lineSpacing = 20;
    mediaView.interitemSpacing = 20;
    mediaView.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    _mediaView = mediaView;
    [self.view addSubview:mediaView];
    
    [mediaView observeViewHeight:^(CGFloat mediaHeight) {
        mediaHeight = ([UIScreen mainScreen] .bounds.size.width - mediaView.sectionInset.left * 2 - mediaView.sectionInset.left * 2) / mediaView.rowImageCount + mediaView.sectionInset.top + mediaView.sectionInset.bottom;
    }];
    
    __weak __typeof(self)weakSelf = self;
    [_mediaView observeSelectedMediaArray:^(NSArray<ACMediaModel *> *list) {
            weakSelf.imageArr = list;
    }];
    
    _ACTUAL_VISITING_ADDRESS.text = @"";
}

#pragma mark - 事件

// 确认
- (IBAction)confirmOnclick {
    
    CGFloat maxLenth = 80 * 1000;
    CGFloat maxWidthAndHeight = 568 * 2;
    NSMutableArray *imageM = [[NSMutableArray alloc] init];
    
    for (ACMediaModel *m in _imageArr) {
        
        if(m.uploadType != nil) {
            UIImage *image = [UIImage imageWithData:m.uploadType];
            NSData *data = [image compressImage:image andMaxLength:maxLenth andMaxWidthAndHeight:maxWidthAndHeight];
            if(data != nil) {
                image = [UIImage imageWithData:data];
            }
            [imageM addObject:image];
        }
    }
    
    
//    if(image != nil) {
//
//        image = [image waterMarkedImage:@"测试"];
//        _stopPicture.image = image;
//    }
    
    
    NSString *image1Str = @"";
    NSString *image2Str = @"";
    if(imageM.count >= 1) {
        
        image1Str = [Tools changeImageToString:[imageM firstObject]];
    }
    if(imageM.count >= 2) {
        
        image2Str = [Tools changeImageToString:[imageM lastObject]];
    }
    if(image1Str != nil) {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service GetVisitEnterShopService:_pvItemM.vISITIDX andPictureFile1:image1Str andPictureFile2:image2Str andstrAddress:_ACTUAL_VISITING_ADDRESS.text];
    } else {
        
        [Tools showAlert:self.view andTitle:@"照片不能为空"];
    }
}


#pragma mark - 位置

- (void)configLocationManager {
    
    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:@"dpekkrgejAC0vIdyFZG6ZIMpPwrGgHtW" authDelegate:self];
    
    //初始化实例
    _locationManager = [[BMKLocationManager alloc] init];
    //设置delegate
    _locationManager.delegate = self;
    //设置返回位置的坐标系类型
    _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
    //设置距离过滤参数
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    //设置预期精度参数
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //设置应用位置类型
    _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
    //设置是否自动停止位置更新
    _locationManager.pausesLocationUpdatesAutomatically = NO;
    //设置是否允许后台定位
    //_locationManager.allowsBackgroundLocationUpdates = YES;
    //设置位置获取超时时间
    _locationManager.locationTimeout = 10;
    //设置获取地址信息超时时间
    _locationManager.reGeocodeTimeout = 10;
}


- (void)reGeocodeAction {
    
    [self.locationManager requestLocationWithReGeocode:YES withNetworkState:NO completionBlock:self.completionBlock];
}


#pragma mark - BMKLocationManagerDelegate

- (void)initCompleteBlock {
    
    __weak __typeof(self)weakSelf = self;
    self.completionBlock = ^(BMKLocation *location, BMKLocationNetworkState state, NSError *error) {
        if (error) {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
        }
        if (location) {//得到定位信息，添加annotation
            
            if (location.location) {
                NSLog(@"LOC = %@",location.location);
            }
            if (location.rgcData) {
                NSLog(@"rgc = %@",[location.rgcData description]);
            }
            
            BMKLocationReGeocode *rgcData = location.rgcData;
            NSString *displayLabel = @"";
            // 省
            if(rgcData.province) {
                
                displayLabel = [NSString stringWithFormat:@"%@%@", displayLabel, rgcData.province];
            }
            // 市
            if(rgcData.city) {
                
                displayLabel = [NSString stringWithFormat:@"%@%@", displayLabel, rgcData.city];
            }
            // 区/县
            if(rgcData.district) {
                
                displayLabel = [NSString stringWithFormat:@"%@%@", displayLabel, rgcData.district];
            }
            // 街道
            if(rgcData.street) {
                
                displayLabel = [NSString stringWithFormat:@"%@%@", displayLabel, rgcData.street];
            }
            // 门牌号
            if(rgcData.streetNumber) {
                
                displayLabel = [NSString stringWithFormat:@"%@%@", displayLabel, rgcData.streetNumber];
            }
            NSLog(@"省:%@", rgcData.province);
            NSLog(@"市:%@", rgcData.city);
            NSLog(@"区/县:%@", rgcData.district);
            NSLog(@"街道:%@", rgcData.street);
            NSLog(@"门牌号:%@", rgcData.streetNumber);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                weakSelf.ACTUAL_VISITING_ADDRESS.text = displayLabel;
            });
            
            if(!rgcData.province && !rgcData.city && !rgcData.district) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [Tools showAlert:weakSelf.view andTitle:@"鉴权失败，重新定位"];
                    // 执行定位
                    [weakSelf reGeocodeAction];
                });
            }
        }
        NSLog(@"netstate = %d",state);
    };
}

#pragma mark - GetVisitEnterShopServiceDelegate

- (void)successOfGetVisitEnterShopService:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    
    GetVisitCheckInventoryViewController *vc = [[GetVisitCheckInventoryViewController alloc] init];
    vc.pvItemM = _pvItemM;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)failureOfGetVisitEnterShopService:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
