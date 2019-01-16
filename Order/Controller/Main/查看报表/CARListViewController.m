//
//  CARListViewController.m
//  Order
//
//  Created by wenwang wang on 2019/1/9.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CARListViewController.h"
#import "CARListTableViewCell.h"
#import "ChartViewController.h"
#import "CARTotalOrderViewController.h"

@interface CARListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

#define kCellName @"CARListTableViewCell"

@implementation CARListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"报表中心";
    
    [self registerCell];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - 功能函数

// 注册Cell
- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    CARListTableViewCell *cell = (CARListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    if(indexPath.row == 0) {
        
        cell.titleLabel.text = @"客户与销量报表";
    }else if(indexPath.row == 1) {
        
        cell.titleLabel.text = @"客户订单汇总报表";
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row == 0) {
        
        ChartViewController *vc = [[ChartViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 1) {
        
        CARTotalOrderViewController *vc = [[CARTotalOrderViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
