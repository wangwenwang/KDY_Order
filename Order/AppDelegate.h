//
//  AppDelegate.h
//  Order
//
//  Created by 凯东源 on 16/9/26.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "BusinessModel.h"
// 微信发送位置
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UserModel *user;

@property (strong, nonatomic) BusinessModel *business;

// 微信发送位置
@property (readonly, strong) NSPersistentContainer *persistentContainer;
- (void)saveContext;


@end

