//
//  GetVisitLeaveShopViewController.m
//  Order
//
//  Created by wenwang wang on 2018/11/29.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetVisitLeaveShopViewController.h"
#import "GetVisitEnterShopService.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import "GetPartyVisitListViewController.h"

@interface GetVisitLeaveShopViewController ()<GetVisitEnterShopServiceDelegate>

// 网络层
@property (strong, nonatomic) GetVisitEnterShopService *service;

// 确认
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@end

@implementation GetVisitLeaveShopViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[GetVisitEnterShopService alloc] init];
        _service.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"离店";
    
    _confirmBtn.layer.cornerRadius = 20;
    _confirmBtn.layer.shadowOffset =  CGSizeMake(0, 3);
    _confirmBtn.layer.shadowOpacity = 0.5;
    _confirmBtn.layer.shadowColor =  [UIColor redColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (IBAction)confirmOnclick {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_service GetVisitLeaveShop:_pvItemM.vISITIDX];
}

#pragma mark - GetVisitEnterShopServiceDelegate

- (void)successOfGetVisitLeaveShop:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    
    NSArray *array = self.navigationController.viewControllers;
    
    for (UIViewController *vc in array) {
        
        if([vc isKindOfClass:[GetPartyVisitListViewController class]]) {
            
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}

- (void)failureOfGetVisitLeaveShop:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
