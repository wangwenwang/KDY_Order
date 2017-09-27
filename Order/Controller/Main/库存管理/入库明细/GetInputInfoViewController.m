//
//  GetInputInfoViewController.m
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetInputInfoViewController.h"
#import "Stock_GetInputInfoService.h"
#import "GetInputInfoTableViewCell.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import "AppDelegate.h"
#import "GetInputListViewController.h"
#import "Stock_InPutWorkflowService.h"
#import "UITableView+NoDataPrompt.h"

@interface GetInputInfoViewController ()<GetInputInfoServiceDelegate, InPutWorkflowServiceDelegate>

// 入库单号
@property (weak, nonatomic) IBOutlet UILabel *INPUT_NO;

// 原单出库单号
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_NO;

// 制单时间
@property (weak, nonatomic) IBOutlet UILabel *ADD_DATE;

// 供应商
@property (weak, nonatomic) IBOutlet UILabel *SUPPLIER_NAME;

// 供应商地址
@property (weak, nonatomic) IBOutlet UILabel *PARTY_INFO;

// 库存客户名称
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_NAME;

// 库存客户地址
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_INFO;

// 入库数量
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_QTY;

// 入库重量
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_WEIGHT;

// 入库体积
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_VOLUME;

// 入库产品列表
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// 网络层
@property (strong, nonatomic) Stock_GetInputInfoService *service;

// 确认入库
@property (strong, nonatomic) Stock_InPutWorkflowService *confirm_service;

// 出库信息
@property (strong, nonatomic) InputInfoListModel *inputInfoListM;

// 容器高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

// 顶部高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewHeight;

// 底部高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewHeight;

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

#define kCellName @"GetInputInfoTableViewCell"

@implementation GetInputInfoViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[Stock_GetInputInfoService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        _confirm_service = [[Stock_InPutWorkflowService alloc] init];
        _confirm_service.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"入库详情";
    
    [self registerCell];
    
    [self initUI];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [_service GetInputInfo:_inputM.iDX];
    
    // 已取消 或 已审核，不显示"确认入库"、"取消入库" 按钮
    if([_inputM.iNPUTSTATE isEqualToString:@"CANCEL"] || [_inputM.iNPUTWORKFLOW isEqualToString:@"已审核"]) {
        
        _bottomView.hidden = YES;
        _bottomViewHeight.constant = 0;
    }
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 事件

- (IBAction)confirmOnclick {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [_confirm_service InPutWorkflow:_inputM.iDX andADUT_USER:_app.user.USER_NAME];
}


#pragma mark - 功能函数

- (void)initUI {
    
    _INPUT_NO.text = @"";
    _OUTPUT_NO.text = @"";
    _ADD_DATE.text = @"";
    _ADDRESS_NAME.text = @"";
    _ADDRESS_INFO.text = @" ";
    _SUPPLIER_NAME.text = @"";
    _PARTY_INFO.text = @" ";
    _OUTPUT_QTY.text = @"";
    _OUTPUT_WEIGHT.text = @"";
    _OUTPUT_VOLUME.text = @"";
}


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
        if([vc isKindOfClass:[GetInputListViewController class]]) {
            
            GetInputListViewController *LMVC = (GetInputListViewController *)vc;
            LMVC.refreshList = YES;
        }
    }
    
    // 按钮不可点击
    _cancelBtn.enabled = NO;
    _confirmBtn.enabled = NO;
    
    // 通知库存列表更新
    [[NSNotificationCenter defaultCenter] postNotificationName:kStockManViewController_refreshList object:nil];
    
    // 延迟popk
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.navigationController popViewControllerAnimated:YES];
        });
    });
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _inputInfoListM.inputItemModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InputItemModel *inputItemM = _inputInfoListM.inputItemModel[indexPath.row];
    
    return inputItemM.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    GetInputInfoTableViewCell *cell = (GetInputInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    InputItemModel *inputItemM = _inputInfoListM.inputItemModel[indexPath.row];
    
    cell.inputItemM = inputItemM;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Store_GetOupputInfoServiceDelegate

- (void)successOfGetInputInfo:(InputInfoListModel *)inputInfoListM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _inputInfoListM = inputInfoListM;
    
    _INPUT_NO.text = _inputInfoListM.inputInfoModel.iNPUTNO;
    _OUTPUT_NO.text = _inputInfoListM.inputInfoModel.oUTPUTNO;
    _ADD_DATE.text = _inputInfoListM.inputInfoModel.aDDDATE;
    _ADDRESS_NAME.text = _inputInfoListM.inputInfoModel.aDDRESSNAME;
    _ADDRESS_INFO.text = _inputInfoListM.inputInfoModel.aDDRESSINFO;
    _SUPPLIER_NAME.text = _inputInfoListM.inputInfoModel.sUPPLIERNAME;
    _PARTY_INFO.text = [_inputInfoListM.inputInfoModel.sUPPLIERADDRESS isEqualToString:@""] ? @" " : _inputInfoListM.inputInfoModel.sUPPLIERADDRESS;
    _OUTPUT_QTY.text =  [Tools OneDecimal:_inputInfoListM.inputInfoModel.iNPUTQTY];
    _OUTPUT_WEIGHT.text = [Tools TwoDecimal:_inputInfoListM.inputInfoModel.iNPUTWEIGHT];
    _OUTPUT_VOLUME.text = [Tools TwoDecimal:_inputInfoListM.inputInfoModel.iNPUTVOLUME];
    
    CGFloat tableViewHeight = 0;
    for (InputItemModel *m in _inputInfoListM.inputItemModel) {
        
        // 单行高度
        CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:13 andWidth:ScreenWidth];
        
        CGFloat PRODUCT_NAME_height = [Tools getHeightOfString:m.pRODUCTNAME fontSize:13 andWidth:(ScreenWidth - 4 - 4 - 6 - 60 - 2 - 60 - 1)];
        
        CGFloat oneCellHeight = 0;
        if(PRODUCT_NAME_height > oneLine) {
            
            oneCellHeight = kCellHeight + PRODUCT_NAME_height - oneLine;
        } else {
            
            oneCellHeight = kCellHeight;
        }
        
        m.cellHeight = oneCellHeight;
        
        tableViewHeight += m.cellHeight;
    }
    
    [_tableView reloadData];
    
    // 起始地址 换行
    CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:ScreenWidth];
    CGFloat ADDRESS_INFO_height = [Tools getHeightOfString:_inputInfoListM.inputInfoModel.aDDRESSINFO fontSize:14 andWidth:(ScreenWidth - 12 - 65 - 3)];
    if(ADDRESS_INFO_height > oneLine) {
        
        _headerViewHeight.constant += (ADDRESS_INFO_height - oneLine);
    }
    
    // 目的地址 换行
    oneLine = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:ScreenWidth];
    CGFloat SUPPLIER_ADDRESS_height = [Tools getHeightOfString:_inputInfoListM.inputInfoModel.sUPPLIERADDRESS fontSize:14 andWidth:(ScreenWidth - 12 - 65 - 3)];
    if(SUPPLIER_ADDRESS_height > oneLine) {
        
        _headerViewHeight.constant += (SUPPLIER_ADDRESS_height - oneLine);
    }
    
    _scrollContentViewHeight.constant = _headerViewHeight.constant + 30 + tableViewHeight + _bottomViewHeight.constant;
}


- (void)successOfGetInputInfo_NoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [_tableView noData:@"没有货物信息" andImageName:LM_NoResult_noOrder];
}


- (void)failureOfGetInputInfo:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [_tableView noData:@"请求失败，请重试..." andImageName:LM_NoResult_noResult];
}


#pragma mark - InPutWorkflowServiceDelegate

- (void)successOfInPutWorkflow:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [self pop];
    
    [Tools showAlert:self.view andTitle:msg andTime:2.5];
}


- (void)failureOfInPutWorkflow:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
