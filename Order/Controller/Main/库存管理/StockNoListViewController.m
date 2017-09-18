//
//  StockNoListViewController.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockNoListViewController.h"
#import "Store_GetStockNoListService.h"
#import "UITableView+NoDataPrompt.h"
#import "StockNoListTableViewCell.h"
#import <MBProgressHUD.h>
#import "Tools.h"

@interface StockNoListViewController ()<Store_GetStockNoListServiceDelegate>

// 网络层，库存详情
@property (strong, nonatomic) Store_GetStockNoListService *service;

// 产品编号
@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_NO;

// 产品名称
@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_NAME;

// 库存数量
@property (weak, nonatomic) IBOutlet UILabel *STOCK_QTY;

// 编辑时间
@property (weak, nonatomic) IBOutlet UILabel *EDIT_DATE;

// 批次信息
@property (strong, nonatomic) StockNoListModel *stockNoListM;

// 批次列表
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// info信息高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoViewHeight;

// scroll高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@end

@implementation StockNoListViewController



#define kCellHeight 60

#define kCellName @"StockNoListTableViewCell"


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[Store_GetStockNoListService alloc] init];
        _service.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"库存详情";
    
    [self registerCell];
    
    [_service GetStockNoList:_stock_idx];
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



- (void)fullData {
    
    // 库存数量 保留6位小数，但会自动去掉小数点后的0
    CGFloat stockQTY = [_stockNoListM.stockNoInfoModel.sTOCKQTY floatValue];
    
    _PRODUCT_NO.text = _stockNoListM.stockNoInfoModel.pRODUCTNO;
    _PRODUCT_NAME.text = _stockNoListM.stockNoInfoModel.pRODUCTNAME;
    _STOCK_QTY.text = [NSString stringWithFormat:@"%@%@", [Tools formatFloat:stockQTY], _stockNoListM.stockNoInfoModel.sTOCKUOM];
    _EDIT_DATE.text = _stockNoListM.stockNoInfoModel.eDITDATE;
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _stockNoListM.stockNoItemModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    StockNoListTableViewCell *cell = (StockNoListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    StockNoItemModel *m = _stockNoListM.stockNoItemModel[indexPath.row];
    
    cell.stockNoItemM = m;
    
    return cell;
}


#pragma mark - Store_GetStockNoListServiceDelegate

- (void)successOfGetStockNoList:(StockNoListModel *)stockNoListM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _stockNoListM = stockNoListM;
    
    [self fullData];
    
    _scrollContentViewHeight.constant = 12 + _infoViewHeight.constant + 12 + _stockNoListM.stockNoItemModel.count * kCellHeight;
    
    [_tableView removeNoOrderPrompt];
    
    [_tableView reloadData];
}


- (void)successOfGetStockNoList_NoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [_tableView noData:@"没有数据" andImageName:LM_NoResult_noOrder];
}


- (void)failureOfGetStockNoList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取库存批次失败"];
}

@end
