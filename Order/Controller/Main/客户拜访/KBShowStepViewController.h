//
//  KBShowStepViewController.h
//  Order
//
//  Created by wenwang wang on 2018/11/21.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetPartyVisitItemModel.h"

@interface KBShowStepViewController : UIViewController

// 列表信息
@property (strong, nonatomic) GetPartyVisitItemModel * pvItemM;

@property (strong, nonatomic) UIViewController *pushVc;

@property (assign, nonatomic) BOOL isShowConfirmBtn;

@end
