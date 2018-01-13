//
//  GetWmsProductSumViewController.m
//  Order
//
//  Created by 凯东源 on 2018/1/11.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetWmsProductSumViewController.h"
#import "GetWmsProductSumTableViewCell.h"
#import "CheckStockDetailListModel.h"
#import "UITableView+NoDataPrompt.h"
#import "GetWmsProductSumService.h"
#import "AppDelegate.h"
#import "Tools.h"

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

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stockInfoViewHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@end

#define kPageCount 20

#define kCellHeight 101

#define kCellName @"GetWmsProductSumTableViewCell"

// 温馨提示
#define kPrompt @"您还没有库存明细哦"

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
    
    self.title = @"库存详情";
    
    [self registerCell];
    
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

// 注册Cell
- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    GetWmsProductSumTableViewCell *cell = (GetWmsProductSumTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];

    CheckStockDetailItemModel *m = _checkStockDetailListM.checkStockDetailItemModel[indexPath.row];

    cell.checkStockDetailItemM = m;

    return cell;
}


#pragma mark - GetWmsProductSumServiceDelegate

- (void)successOfGetWmsProductSumService:(CheckStockDetailListModel *)checkStockDetailListM {
    
    _checkStockDetailListM = checkStockDetailListM;
    
    // 产品名称换行
    CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:MAXFLOAT];
    CGFloat mulLine = [Tools getHeightOfString:_checkStockItemM.descr fontSize:14 andWidth:(ScreenWidth - 12 - 65 - 3)];
    mulLine = mulLine ? mulLine : oneLine;
    _stockInfoViewHeight.constant += (mulLine - oneLine);
    
    _scrollContentViewHeight.constant = 12 + _stockInfoViewHeight.constant + 12 + _checkStockDetailListM.checkStockDetailItemModel.count * kCellHeight;
    
    [_tableView reloadData];
}


- (void)successOfGetWmsProductSumService_NoData {
    
    _checkStockDetailListM = nil;
    
    [_tableView noData:kPrompt andImageName:LM_NoResult_noOrder];
    
    [_tableView reloadData];
}


- (void)failureOfGetWmsProductSumService:(NSString *)msg {
    
    [_tableView noData:kPrompt andImageName:LM_NoResult_noOrder];
    [Tools showAlert:self.view andTitle:msg ? msg : @"获取信息失败"];
}

@end
