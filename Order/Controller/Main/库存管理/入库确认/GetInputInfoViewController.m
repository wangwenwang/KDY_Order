//
//  GetInputInfoViewController.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetInputInfoViewController.h"
#import "Stock_GetInputInfoService.h"
#import "InPutWorkflowViewController.h"

@interface GetInputInfoViewController ()<GetInputInfoServiceDelegate>


@property (strong, nonatomic) Stock_GetInputInfoService *service;


@property (strong, nonatomic) InputInfoListModel *inputInfoListM;

@end

@implementation GetInputInfoViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[Stock_GetInputInfoService alloc] init];
        _service.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [_service GetInputInfo:_outputIdx];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)successOfGetInputInfo:(InputInfoListModel *)inputInfoListM {
    
    _inputInfoListM = inputInfoListM;
    
    InPutWorkflowViewController *vc = [[InPutWorkflowViewController alloc] init];
    vc.input_idx = _inputInfoListM.inputInfoModel.iDX;
    [self.navigationController pushViewController:vc animated:YES];
    
    NSLog(@"");
}

@end
