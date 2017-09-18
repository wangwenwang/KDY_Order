//
//  InPutWorkflowViewController.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "InPutWorkflowViewController.h"
#import "Stock_InPutWorkflowService.h"
#import "AppDelegate.h"

@interface InPutWorkflowViewController ()


@property (strong, nonatomic) Stock_InPutWorkflowService *service;


@property (strong, nonatomic) AppDelegate *app;

@end


@implementation InPutWorkflowViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[Stock_InPutWorkflowService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_service InPutWorkflow:_input_idx andADUT_USER:_app.user.USER_NAME];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
