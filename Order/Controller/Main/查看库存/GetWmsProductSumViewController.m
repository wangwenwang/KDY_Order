//
//  GetWmsProductSumViewController.m
//  Order
//
//  Created by 凯东源 on 2018/1/11.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetWmsProductSumViewController.h"
#import "GetWmsProductSumService.h"
#import "CheckStockDetailListModel.h"
#import "AppDelegate.h"

@interface GetWmsProductSumViewController ()<GetWmsProductSumServiceDelegate>


// 商品代码
@property (weak, nonatomic) IBOutlet UILabel *sku;

// 商品名称
@property (weak, nonatomic) IBOutlet UILabel *descr;

// 可用数量
@property (weak, nonatomic) IBOutlet UILabel *kesum;

// 库存数
@property (weak, nonatomic) IBOutlet UILabel *QTY;

// 单位
@property (weak, nonatomic) IBOutlet UILabel *susr2;

// 已分配数量
@property (weak, nonatomic) IBOutlet UILabel *QTYALLOCATED;

// 未配货需求
@property (weak, nonatomic) IBOutlet UILabel *WeiQTYALLOCATED;

@property (strong, nonatomic) GetWmsProductSumService *service;

@property (strong, nonatomic) AppDelegate *app;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) CheckStockDetailListModel *checkStockDetailListM;

@end

#define kPageCount 20

#define kCellHeight 192

#define kCellName @"GetTmsOrderByAddressTableViewCell"

// 温馨提示
#define kPrompt @"您还没有物流订单哦"

@implementation GetWmsProductSumViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _service = [[GetWmsProductSumService alloc] init];
        _service.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self initUI];
    
    [_service GetWmsProductSum:_app.business.BUSINESS_CODE andProductNo:_checkStockItemM.sku andstrPage:1 andstrPageCount:20];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 功能函数

- (void)initUI {
    
    _sku.text = _checkStockItemM.sku;
    _descr.text = _checkStockItemM.descr;
    _kesum.text = _checkStockItemM.kesum;
    _QTY.text = [NSString stringWithFormat:@"%@%@", _checkStockItemM.qTY, _checkStockItemM.susr2];
    _QTYALLOCATED.text = _checkStockItemM.qTYALLOCATED;
    _WeiQTYALLOCATED.text = _checkStockItemM.weiQTYALLOCATED;
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _checkStockDetailListM.checkStockDetailItemModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return kCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // 处理界面
    static NSString *cellId = kCellName;
    GetTmsOrderByAddressTableViewCell *cell = (GetTmsOrderByAddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];

    TmsOrderItemModel *m = _tmsOrderListM.tmsOrderItemModel[indexPath.row];

    cell.tmsOrderItemM = m;

    return cell;
}


#pragma mark - GetWmsProductSumServiceDelegate

- (void)successOfGetWmsProductSumService:(CheckStockDetailListModel *)checkStockDetailListM {
    
    _checkStockDetailListM = checkStockDetailListM;
    
}


- (void)successOfGetWmsProductSumService_NoData {
    
    
}


- (void)failureOfGetWmsProductSumService:(NSString *)msg {
    
    
}


@end
