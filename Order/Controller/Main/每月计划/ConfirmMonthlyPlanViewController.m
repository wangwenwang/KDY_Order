//
//  ConfirmMonthlyPlanViewController.m
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "ConfirmMonthlyPlanViewController.h"
#import "ConfirmMonthlyPlanTableViewCell.h"
#import "Tools.h"
#import "ImportToOrderPlanListService.h"

@interface ConfirmMonthlyPlanViewController ()


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *customerViewHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addressViewHeight;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *productViewHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@end


#define kCellHeight 44

#define kCellName @"ConfirmMonthlyPlanTableViewCell"

@implementation ConfirmMonthlyPlanViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self registerCell];
    
    [self dealWithData];
}


- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
    _scrollContentViewHeight.constant = _customerViewHeight.constant +
    _addressViewHeight.constant +
    _productViewHeight.constant;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 功能函数

- (void)registerCell {
    
    // 注册Cell
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)dealWithData {
    
    CGFloat tableViewHeight = 0;
    for (int i = 0; i < _promotionDetailsOfServer.count; i++) {
        
        PromotionDetailModel *m = _promotionDetailsOfServer[i];
        CGFloat oneLineHeight = [Tools getHeightOfString:@"fds" fontSize:13 andWidth:999.9];
        
        m.cellHeight = kCellHeight;
        tableViewHeight += m.cellHeight;
    }
    
    // 设置产品信息高度
    _productViewHeight.constant = tableViewHeight;
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return _promotionDetailsOfServer.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        PromotionDetailModel *m = _promotionDetailsOfServer[indexPath.row];
        return m.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 界面处理
    static NSString *cellId = kCellName;
    ConfirmMonthlyPlanTableViewCell *cell = (ConfirmMonthlyPlanTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    // 获取数据
    PromotionDetailModel *m = _promotionDetailsOfServer[indexPath.row];
    cell.promotionDetailM = m;
    
    // 返回Cell
    return cell;
}

@end
