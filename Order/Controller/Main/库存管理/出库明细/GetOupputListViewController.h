//
//  GetOupputListViewController.h
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressModel.h"

@interface GetOupputListViewController : UIViewController

@property (assign, nonatomic) BOOL refreshList;

@property (strong, nonatomic) AddressModel *addressM;

@end
