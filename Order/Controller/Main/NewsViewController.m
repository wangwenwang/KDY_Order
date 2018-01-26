//
//  NewsViewController.m
//  Order
//
//  Created by 凯东源 on 16/10/8.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

// 内容高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"最新资讯";
    
}

- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    _scrollContentViewHeight.constant = CGRectGetHeight(self.view.frame);
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 功能方法

- (IBAction)tel {
    
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"13243863247"];
    UIWebView *callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

@end
