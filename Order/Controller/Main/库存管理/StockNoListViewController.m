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
#import "StockNoListDetailViewController.h"

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



#define kCellHeight 79

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
    
    [self initUI];
    
    [self registerCell];
    
    [_service GetStockNoList:_stock_idx];
    
    [Tools addNavRightItemTypeText:self andAction:@selector(water) andTitle:@"流水"];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - function

- (void)water {
    
    StockNoListDetailViewController *vc = [[StockNoListDetailViewController alloc] init];
    vc.stock_idx = _stock_idx;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - 功能函数

// 初始化UI
- (void)initUI {
    
    _PRODUCT_NO.text = @"";
    _PRODUCT_NAME.text = @" ";
    _STOCK_QTY.text = @"";
    _EDIT_DATE.text = @"";
}


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
    
    // 产品名称换行
    CGFloat contentWidth = ScreenWidth - 15 - 65 + 3;
    // Label 单行高度
    CGFloat oneLineHeight = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:999.9];
    CGFloat overflowHeight = [Tools getHeightOfString:_stockNoListM.stockNoInfoModel.pRODUCTNAME fontSize:14 andWidth:contentWidth] - oneLineHeight;
    _infoViewHeight.constant = _infoViewHeight.constant + overflowHeight;
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
