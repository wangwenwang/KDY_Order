//
//  GetOupputInfoViewController.m
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetOupputInfoViewController.h"
#import "Store_GetOupputInfoService.h"
#import "GetOupputInfoTableViewCell.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import "AppDelegate.h"
#import "GetOupputListViewController.h"

@interface GetOupputInfoViewController ()<Store_GetOupputInfoServiceDelegate>

// 出库单号
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_NO;

// 制单时间
@property (weak, nonatomic) IBOutlet UILabel *ADD_DATE;

// 库存客户地址
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_INFO;

// 出库客户地址
@property (weak, nonatomic) IBOutlet UILabel *PARTY_INFO;

// 出库数量
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_QTY;

// 出库重量
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_WEIGHT;

// 出库体积
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_VOLUME;

// 出库产品列表
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// 网络层
@property (strong, nonatomic) Store_GetOupputInfoService *service;

// 出库信息
@property (strong, nonatomic) GetOupputDetailModel *getOupputDetailM;

// 容器高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

// 顶部高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewHeight;

// 全局变量
@property (strong, nonatomic) AppDelegate *app;

// 底部视图
@property (weak, nonatomic) IBOutlet UIView *bottomView;

// 取消入库按钮
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

// 确认入库按钮
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@end

#define kCellHeight 99

#define kCellName @"GetOupputInfoTableViewCell"

@implementation GetOupputInfoViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[Store_GetOupputInfoService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"出库详情";
    
    [self registerCell];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [_service GetOupputInfo:_storeIdx];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 事件

- (IBAction)confirmOnclick {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [_service confirm:_storeIdx andADUT_USER:_app.user.USER_NAME];
}


- (IBAction)cancelOnclick {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [_service cancel:_storeIdx andOPER_USER:_app.user.IDX];
}


#pragma mark - 功能函数

// 注册Cell
- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


- (void)pop {
    
    // 告诉列表需要刷新
    NSArray *array = self.navigationController.viewControllers;
    for(int i = 0; i < array.count; i++) {
        
        UIViewController *vc = array[i];
        if([vc isKindOfClass:[GetOupputListViewController class]]) {
            
            GetOupputListViewController *LMVC = (GetOupputListViewController *)vc;
            LMVC.refreshList = YES;
        }
    }
    
    // 按钮不可点击
    _cancelBtn.enabled = NO;
    _confirmBtn.enabled = NO;
    
    // 延迟pop
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.navigationController popViewControllerAnimated:YES];
        });
    });
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _getOupputDetailM.getOupputItemModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GetOupputItemModel *getOupputItemM = _getOupputDetailM.getOupputItemModel[indexPath.row];
    
    return getOupputItemM.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    GetOupputInfoTableViewCell *cell = (GetOupputInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    GetOupputItemModel *getOupputItemM = _getOupputDetailM.getOupputItemModel[indexPath.row];
    
    cell.getOupputItemM = getOupputItemM;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - 功能函数

- (void)initUI {
    
    _OUTPUT_NO.text = @"";
    _ADD_DATE.text = @"";
    _ADDRESS_INFO.text = @"";
    _PARTY_INFO.text = @"";
    _OUTPUT_QTY.text = @"";
    _OUTPUT_WEIGHT.text = @"";
    _OUTPUT_VOLUME.text = @"";
}


#pragma mark - Store_GetOupputInfoServiceDelegate

- (void)successOfGetOupputInfo:(GetOupputDetailModel *)getOupputDetailM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _getOupputDetailM = getOupputDetailM;
    
    _OUTPUT_NO.text = _getOupputDetailM.getOupputInfoModel.oUTPUTNO;
    _ADD_DATE.text = _getOupputDetailM.getOupputInfoModel.aDDDATE;
    _ADDRESS_INFO.text = _getOupputDetailM.getOupputInfoModel.aDDRESSINFO;
    _PARTY_INFO.text = _getOupputDetailM.getOupputInfoModel.pARTYINFO;
    _OUTPUT_QTY.text =  [Tools OneDecimal:_getOupputDetailM.getOupputInfoModel.oUTPUTQTY];
    _OUTPUT_WEIGHT.text = [Tools TwoDecimal:_getOupputDetailM.getOupputInfoModel.oUTPUTWEIGHT];
    _OUTPUT_VOLUME.text = [Tools TwoDecimal:_getOupputDetailM.getOupputInfoModel.oUTPUTVOLUME];
    
    
    CGFloat tableViewHeight = 0;
    for (GetOupputItemModel *m in _getOupputDetailM.getOupputItemModel) {
        
        m.cellHeight = kCellHeight;
        
        tableViewHeight += m.cellHeight;
    }
    
    [_tableView reloadData];
    
    _scrollContentViewHeight.constant = _headerViewHeight.constant + 46 + tableViewHeight;
    
    if([_getOupputDetailM.getOupputInfoModel.oUTPUTSTATE isEqualToString:@"CANCEL"]) {
        
        _bottomView.hidden = YES;
    }
}


- (void)failureOfGetOupputInfo:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [Tools showAlert:self.view andTitle:msg];
}


- (void)successOfOutPutWorkflow:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [Tools showAlert:self.view andTitle:msg];
}


- (void)failureOfOutPutWorkflow:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [Tools showAlert:self.view andTitle:msg];
}


- (void)successOfOutPutCancel:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [self pop];
    
    [Tools showAlert:self.view andTitle:msg andTime:2.5];
}


- (void)failureOfOutPutCancel:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [self pop];
    
    [Tools showAlert:self.view andTitle:msg andTime:2.5];
}

@end
