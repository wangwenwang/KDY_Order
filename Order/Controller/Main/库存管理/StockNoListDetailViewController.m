//
//  StockNoListDetailViewController.m
//  Order
//
//  Created by 凯东源 on 2017/11/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockNoListDetailViewController.h"
#import "Store_GetStockNoListService.h"
#import <MBProgressHUD.h>
#import "UITableView+NoDataPrompt.h"
#import "StockNoListTableViewCell.h"
#import "Tools.h"

@interface StockNoListDetailViewController ()<Store_GetStockNoListServiceDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;

// 网络层
@property (strong, nonatomic) Store_GetStockNoListService *service;

// scroll高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

// 批次信息
@property (strong, nonatomic) StockNoWaterListModel *stockNoListM;

@end


#define kCellHeight 79

#define kCellName @"StockNoListTableViewCell"

@implementation StockNoListDetailViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[Store_GetStockNoListService alloc] init];
        _service.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"出入详情";
    
    [self registerCell];
    
    [_service GetStockNoWaterList:_stock_idx andstrPage:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 注册Cell
- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _stockNoListM.stockNoWaterItemModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    StockNoListTableViewCell *cell = (StockNoListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    StockNoWaterItemModel *m = _stockNoListM.stockNoWaterItemModel[indexPath.row];
    
    cell.stockNoWaterItemM = m;
    
    return cell;
}


#pragma mark - Store_GetStockNoListServiceDelegate

- (void)successOfGetStockNoWaterList:(StockNoWaterListModel *)stockNoListM
{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _stockNoListM = stockNoListM;
    
    _scrollContentViewHeight.constant = _stockNoListM.stockNoWaterItemModel.count * kCellHeight;
    
    [_tableView removeNoOrderPrompt];
    
    [_tableView reloadData];
}


- (void)successOfGetStockNoWaterList_NoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [_tableView noData:@"没有数据" andImageName:LM_NoResult_noOrder];
}


- (void)failureOfGetStockNoWaterList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取库存批次失败"];
}

@end
