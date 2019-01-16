//
//  AppDelegate.m
//  Order
//
//  Created by 凯东源 on 16/9/26.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import "AppDelegate.h"
#import "WelcomeViewController.h"
#import "Tools.h"
// 微信发送位置
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import "VisitRoutePlanViewController.h"
#import "LatLng.h"

@interface AppDelegate ()<BMKGeneralDelegate>{
    BMKMapManager * _mapManager;
}

@end

@implementation AppDelegate

- (void)setUINavigationBar {
    
    [UINavigationBar appearance].translucent = NO;
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    [[UINavigationBar appearance] setBarTintColor:YBGreen];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _user = [[UserModel alloc] init];
    _business = [[BusinessModel alloc] init];
    
    
    //地图操作
    _mapManager = [[BMKMapManager alloc] init];
    
    // 如果要关注网络及授权验证事件，请设定generalDelegate参数
    BOOL ret = [_mapManager start:@"dpekkrgejAC0vIdyFZG6ZIMpPwrGgHtW"  generalDelegate:self];
    if (!ret) {
        NSLog(@"百度地图加载失败！");
    }else {
        NSLog(@"百度地图加载成功！");
    }
    
    [self setUINavigationBar];
    
    
    //界面生成
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    
    BMKMapPoint point0 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(22.629332, 114.046654));
    BMKMapPoint point1 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(22.615688, 114.052156));
    BMKMapPoint point2 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(22.633247, 114.027483));
    CLLocationDistance distance1 = BMKMetersBetweenMapPoints(point0,point1);
    CLLocationDistance distance2 = BMKMetersBetweenMapPoints(point0,point2);
    
    
    //设置根控制器
    WelcomeViewController *welcomeVC = [[WelcomeViewController alloc] init];
    [_window setRootViewController:welcomeVC];
    
    [_window makeKeyAndVisible];
    
    
    
    // 3D Touch
    // 手动创建3D Touch选项
    // 系统风格的icon
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeInvitation];
    // 自定义风格的icon
    UIApplicationShortcutIcon *customIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"menu_order_payed_unselected"];
    
    // 创建选项
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:@"com.LM.makeOrder" localizedTitle:@"下单" localizedSubtitle:@"" icon:icon userInfo:nil];
    UIApplicationShortcutItem *customItem = [[UIApplicationShortcutItem alloc] initWithType:@"com.LM.checkOrder" localizedTitle:@"查单" localizedSubtitle:@"" icon:customIcon userInfo:nil];
    
    // 添加到选项数组，UIApplicationShortcutItem类iOS9.0才有
    if(item && customItem) [UIApplication sharedApplication].shortcutItems = @[customItem, item];
    
    // 清空3dTouchType
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:k3DTouchType];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // 设置MainViewController未初始化
    [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:kMainViewController_init];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    NSLog(@"aaaa:%@", shortcutItem.type);
    
    // 设置3dTouchType
    [[NSUserDefaults standardUserDefaults] setValue:shortcutItem.type forKey:k3DTouchType];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kMainViewController_3DTouch object:nil userInfo:@{@"type":shortcutItem.type}];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -- BMKGeneralDelegate
// 百度地图获取网络连接状态
- (void)onGetNetworkState:(int)iError {
    if(iError == 0) {
        NSLog(@"联网成功");
    }else {
        NSLog(@"联网失败，错误代码：Error:%d", iError);
    }
}

// 百度地图key是否正确能够连接
- (void)onGetPermissionState:(int)iError {
    if (iError == 0) {
        NSLog(@"授权成功");
    }else{
        NSLog(@"授权失败，错误代码：Error:%d", iError);
    }
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"WeChatLocationDemo"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
