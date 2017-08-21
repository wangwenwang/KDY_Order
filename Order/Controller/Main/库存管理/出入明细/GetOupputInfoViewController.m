//
//  GetOupputInfoViewController.m
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetOupputInfoViewController.h"
#import "Store_GetOupputInfoService.h"

@interface GetOupputInfoViewController ()<Store_GetOupputInfoServiceDelegate>


// 网络层
@property (strong, nonatomic) Store_GetOupputInfoService *service;

@end

@implementation GetOupputInfoViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[Store_GetOupputInfoService alloc] init];
        _service.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"出库详情";
    
    [_service GetOupputInfo:_storeIdx];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
