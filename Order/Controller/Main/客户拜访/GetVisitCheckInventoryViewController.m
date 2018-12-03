//
//  GetVisitCheckInventoryViewController.m
//  Order
//
//  Created by wenwang wang on 2018/11/20.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetVisitCheckInventoryViewController.h"
#import "GetVisitEnterShopService.h"
#import "Tools.h"
#import <MBProgressHUD.h>
#import "GetVisitRecommendedOrderViewController.h"

@interface GetVisitCheckInventoryViewController ()<GetVisitEnterShopServiceDelegate>

// 检查库存
@property (weak, nonatomic) IBOutlet UITextView *strCheckInventory;

//textView的placeholder
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

// 确认
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@end

@implementation GetVisitCheckInventoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"检查库存";
    
    _confirmBtn.layer.cornerRadius = 20;
    _confirmBtn.layer.shadowOffset =  CGSizeMake(0, 3);
    _confirmBtn.layer.shadowOpacity = 0.5;
    _confirmBtn.layer.shadowColor =  [UIColor redColor].CGColor;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - 事件

- (IBAction)confirmOnclick {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    GetVisitEnterShopService *s = [[GetVisitEnterShopService alloc] init];
    s.delegate = self;
    [s GetVisitCheckInventory:_pvItemM.vISITIDX andStrCheckInventory:_strCheckInventory.text];
}

#pragma mark - GetVisitEnterShopServiceDelegate

- (void)successOfGetVisitCheckInventory:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    
    GetVisitRecommendedOrderViewController *vc = [[GetVisitRecommendedOrderViewController alloc] init];
    vc.pvItemM = _pvItemM;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)failureOfGetVisitCheckInventory:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}


#pragma mark - 键盘回收

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text {
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    if (![text isEqualToString:@""]) {
        _placeholderLabel.hidden = YES;
    }
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
        _placeholderLabel.hidden = NO;
    }
    
    return YES;
}

@end
