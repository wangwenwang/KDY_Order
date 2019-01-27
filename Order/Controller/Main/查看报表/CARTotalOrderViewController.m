//
//  CARTotalOrderViewController.m
//  Order
//
//  Created by wenwang wang on 2019/1/9.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CARTotalOrderViewController.h"
#import "ChartService.h"
#import "CARTotalOrderTableViewCell.h"
#import "AppDelegate.h"
#import "CARTotalOrderListModel.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import "LMTitleView.h"
#import "LM_alert.h"
#import "CARTotalOrderDetailViewController.h"

@interface CARTotalOrderViewController ()<ChartServiceDelegate, UITableViewDataSource, UITableViewDelegate>

@property ChartService *service;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) AppDelegate *app;

@property (strong, nonatomic) CARTotalOrderListModel *CARTotalOrderListM;

// 出库、入库
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (strong, nonatomic) NSArray *types;

// 日期    本周，本月，本季，本年，全部    5个选项
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) NSArray *dates;

@end

#define kCellName @"CARTotalOrderTableViewCell"

@implementation CARTotalOrderViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[ChartService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"客户订单总计";
    
    [self registerCell];
    
    _types = @[kOUTName, kINPUTName];
//    _dates = @[@"今天", @"本周", @"本月", @"本季", @"本年", @"全部"];
    _dates = @[@"全部", @"今天", @"本周", @"本月", @"本季", @"本年"];
    _typeLabel.text = [_types firstObject];
    _dateLabel.text = [_dates firstObject];
    
    [self requstData];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - 手势

// 类型，出库、入库
- (IBAction)typeOnclick {
    
    [self.view endEditing:YES];
    [LM_alert showLMAlertViewWithTitle:@"类型" message:@"" cancleButtonTitle:@"取消" okButtonTitle:nil otherButtonTitleArray:_types clickHandle:^(NSInteger index) {
        
        if(index >= 1) {
            
            _typeLabel.text = _types[index - 1];
            [self requstData];
        }
    }];
}

// 日期，本周、本月、本季、本年、全部
- (IBAction)dateOnclick {
    
    [self.view endEditing:YES];
    [LM_alert showLMAlertViewWithTitle:@"日期" message:@"" cancleButtonTitle:@"取消" okButtonTitle:nil otherButtonTitleArray:_dates clickHandle:^(NSInteger index) {
        
        if(index >= 1) {
            
            _dateLabel.text = _dates[index - 1];
            [self requstData];
        }
    }];
}

#pragma mark - 功能函数

// 注册Cell
- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)requstData {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if([_typeLabel.text isEqualToString:kOUTName]) {
        
        [_service TotalOrderStatement:_app.user.IDX andStrType:@"OUT" andStrTime:_dateLabel.text];
    }else if([_typeLabel.text isEqualToString:kINPUTName]) {
        
        [_service TotalOrderStatement:_app.user.IDX andStrType:@"INPUT" andStrTime:_dateLabel.text];
    }
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _CARTotalOrderListM.cARTotalOrderItemModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 125;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CARTotalOrderItemModel *m = _CARTotalOrderListM.cARTotalOrderItemModel[indexPath.row];
    
    // 处理界面
    static NSString *cellId = kCellName;
    CARTotalOrderTableViewCell *cell = (CARTotalOrderTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.CARTotalOrderItemM = m;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CARTotalOrderItemModel *m = _CARTotalOrderListM.cARTotalOrderItemModel[indexPath.row];
    
    CARTotalOrderDetailViewController *vc = [[CARTotalOrderDetailViewController alloc] init];
    vc.TYPE = _typeLabel.text;
    vc.DATE = _dateLabel.text;
    vc.PARTY_CODE = m.pARTYCODE;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - ChartServiceDelegate

- (void)successOfCARTotalOrderList:(CARTotalOrderListModel *)CARTotalOrderListM {

    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    _CARTotalOrderListM = CARTotalOrderListM;
    [_tableView reloadData];
}

- (void)failureOfChartService:(NSString *)msg {
    
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
