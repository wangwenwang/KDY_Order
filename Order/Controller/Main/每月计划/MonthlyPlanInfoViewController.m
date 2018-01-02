//
//  MonthlyPlanInfoViewController.m
//  Order
//
//  Created by 凯东源 on 2017/12/6.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "MonthlyPlanInfoViewController.h"
#import "GetOrderPlanDetailService.h"
#import "MonthlyPlanInfoTableViewCell.h"
#import "Tools.h"
#import <MBProgressHUD.h>

@interface MonthlyPlanInfoViewController ()<GetOrderPlanDetailServiceDelegate>

// 订单编号
@property (weak, nonatomic) IBOutlet UILabel *ORD_NO;

// 创建时间
@property (weak, nonatomic) IBOutlet UILabel *ADD_DATE;

// 客户名称
@property (weak, nonatomic) IBOutlet UILabel *TO_NAME;

// 客户地址
@property (weak, nonatomic) IBOutlet UILabel *TO_ADDRESS;

// 下单数量
@property (weak, nonatomic) IBOutlet UILabel *ORD_QTY;

// 下单总量
@property (weak, nonatomic) IBOutlet UILabel *ORD_WEIGHT;

// 下单体积
@property (weak, nonatomic) IBOutlet UILabel *ORD_VOLUME;

// 订单日期
@property (weak, nonatomic) IBOutlet UILabel *REQUEST_ISSUE;

// 订单状态
@property (weak, nonatomic) IBOutlet UILabel *ORD_STATE;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) GetOrderPlanDetailService *service;

@property (strong, nonatomic) MonthlyPlanInfoModel *monthlyPlanInfoM;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *customerViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *productViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *summaryViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;


// 付款价
@property (weak, nonatomic) IBOutlet UILabel *ACT_PRICE;

// 备注
@property (weak, nonatomic) IBOutlet UILabel *CONSIGNEE_REMARK;

@end

#define kCellHeight 100

#define kCellName @"MonthlyPlanInfoTableViewCell"

@implementation MonthlyPlanInfoViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[GetOrderPlanDetailService alloc] init];
        _service.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"计划详情";
    
    [self initUI];
    
    [self registerCell];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_service GetOrderPlanDetail:_orderId];
}


- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
    _scrollContentViewHeight.constant = _customerViewHeight.constant + _productViewHeight.constant + _summaryViewHeight.constant;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 功能函数

- (void)initUI {
    
    _ORD_NO.text = @" ";
    _ADD_DATE.text = @" ";
    _TO_NAME.text = @" ";
    _TO_ADDRESS.text = @" ";
    _ORD_QTY.text = @" ";
    _ORD_WEIGHT.text = @" ";
    _ORD_VOLUME.text = @" ";
    _ORD_STATE.text = @" ";
    _REQUEST_ISSUE.text = @" ";
    
    _ACT_PRICE.text = @" ";
    _CONSIGNEE_REMARK.text = @" ";
}


// 注册Cell
- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _monthlyPlanInfoM.monthlyPlanItemModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MonthlyPlanItemModel *m = _monthlyPlanInfoM.monthlyPlanItemModel[indexPath.row];
    return m.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    MonthlyPlanInfoTableViewCell *cell = (MonthlyPlanInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    MonthlyPlanItemModel *m = _monthlyPlanInfoM.monthlyPlanItemModel[indexPath.row];
    
    cell.monthlyPlanItemM = m;
    
    return cell;
}


#pragma mark - GetOrderPlanDetailServiceDelegate

- (void)successOfGetOrderPlanDetail:(MonthlyPlanInfoModel *)monthlyPlanInfoM {
    
    _monthlyPlanInfoM = monthlyPlanInfoM;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _ORD_NO.text = _monthlyPlanInfoM.oRDNO;
    _ADD_DATE.text = _monthlyPlanInfoM.aDDDATE;
    _TO_NAME.text = _monthlyPlanInfoM.tONAME;
    _TO_ADDRESS.text = _monthlyPlanInfoM.tOADDRESS;
    _ORD_QTY.text = _monthlyPlanInfoM.oRDQTY;
    _ORD_WEIGHT.text = _monthlyPlanInfoM.oRDWEIGHT;
    _ORD_VOLUME.text = _monthlyPlanInfoM.oRDVOLUME;
    if([_monthlyPlanInfoM.oRDSTATE isEqualToString:@"OPEN"]) {
        _ORD_STATE.text = @"新建";
    } else if([_monthlyPlanInfoM.oRDSTATE isEqualToString:@"CANCEL"]) {
        _ORD_STATE.text = @"已取消";
    } else {
        _ORD_STATE.text = @"已审核";
    }
    if(_monthlyPlanInfoM.rEQUESTISSUE.length > 7) {
        _REQUEST_ISSUE.text = [_monthlyPlanInfoM.rEQUESTISSUE substringToIndex:7];
    } else {
        _REQUEST_ISSUE.text = @" ";
    }
    
    CGFloat tableViewHeight = 0;
    for (int i = 0; i < _monthlyPlanInfoM.monthlyPlanItemModel.count; i++) {
        
        MonthlyPlanItemModel *item = _monthlyPlanInfoM.monthlyPlanItemModel[i];
        CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:13 andWidth:MAXFLOAT];
        CGFloat mulLine = [Tools getHeightOfString:item.pRODUCTNAME fontSize:13 andWidth:ScreenWidth - 4 - 60 - 60 - 4];
        item.cellHeight = kCellHeight + (mulLine - oneLine);
        tableViewHeight += item.cellHeight;
    }
    _productViewHeight.constant = 30 + tableViewHeight;
    _scrollContentViewHeight.constant = _customerViewHeight.constant + _productViewHeight.constant + _summaryViewHeight.constant;
    
    [_tableView reloadData];
    
    _ACT_PRICE.text = _monthlyPlanInfoM.aCTPRICE;
    _CONSIGNEE_REMARK.text = _monthlyPlanInfoM.cONSIGNEEREMARK;
}


- (void)failureOfGetOrderPlanDetail:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
