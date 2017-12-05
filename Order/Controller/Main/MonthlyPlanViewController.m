//
//  MonthlyPlanViewController.m
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "MonthlyPlanViewController.h"
#import "CustomerListViewController.h"
#import "UITableView+NoDataPrompt.h"
#import "AppDelegate.h"

@interface MonthlyPlanViewController ()

@property (strong, nonatomic) AppDelegate *app;

@end

@implementation MonthlyPlanViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        //        _service = [[GetStockListService alloc] init];
        //        _service.delegate = self;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"月计划列表";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addOnclick {
    
    CustomerListViewController *vc = [[CustomerListViewController alloc] init];
    vc.vcClass = NSStringFromClass([self class]);
    [self.navigationController pushViewController:vc animated:YES];
}

@end
