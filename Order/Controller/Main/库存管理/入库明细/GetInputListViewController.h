//
//  GetInputListViewController.h
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressModel.h"

@interface GetInputListViewController : UIViewController

@property (strong, nonatomic) AddressModel *addressM;

@property (assign, nonatomic) BOOL refreshList;

@end
