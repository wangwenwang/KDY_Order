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

@interface GetInputInfoViewController ()<GetInputInfoServiceDelegate>

// 入库单号
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_NO;

// 制单时间
@property (weak, nonatomic) IBOutlet UILabel *ADD_DATE;

// 库存客户地址
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_INFO;

// 供应商地址
@property (weak, nonatomic) IBOutlet UILabel *PARTY_INFO;

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

// 出库信息
@property (strong, nonatomic) InputInfoListModel *inputInfoListM;

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

#define kCellName @"GetInputInfoTableViewCell"

@implementation GetInputInfoViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[Stock_GetInputInfoService alloc] init];
        _service.delegate = self;
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"入库详情";
    
    [self registerCell];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [_service GetInputInfo:_intputIdx];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 事件

- (IBAction)confirmOnclick {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
//    [_service confirm:_intputIdx andADUT_USER:_app.user.USER_NAME];
}


- (IBAction)cancelOnclick {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
//    [_service cancel:_intputIdx andOPER_USER:_app.user.IDX];
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
        if([vc isKindOfClass:[GetInputListViewController class]]) {
            
            GetInputListViewController *LMVC = (GetInputListViewController *)vc;
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

- (void)successOfGetInputInfo:(InputInfoListModel *)inputInfoListM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _inputInfoListM = inputInfoListM;

    _OUTPUT_NO.text = _inputInfoListM.inputInfoModel.iNPUTNO;
    _ADD_DATE.text = _inputInfoListM.inputInfoModel.aDDDATE;
    _ADDRESS_INFO.text = _inputInfoListM.inputInfoModel.aDDRESSINFO;
    _PARTY_INFO.text = _inputInfoListM.inputInfoModel.sUPPLIERADDRESS;
    _OUTPUT_QTY.text =  [Tools OneDecimal:_inputInfoListM.inputInfoModel.iNPUTQTY];
    _OUTPUT_WEIGHT.text = [Tools TwoDecimal:_inputInfoListM.inputInfoModel.iNPUTWEIGHT];
    _OUTPUT_VOLUME.text = [Tools TwoDecimal:_inputInfoListM.inputInfoModel.iNPUTVOLUME];
    
    CGFloat tableViewHeight = 0;
    for (InputItemModel *m in _inputInfoListM.inputItemModel) {
        
        m.cellHeight = kCellHeight;
        
        tableViewHeight += m.cellHeight;
    }

    [_tableView reloadData];

    _scrollContentViewHeight.constant = _headerViewHeight.constant + 46 + tableViewHeight;

    if([_inputInfoListM.inputInfoModel.iNPUTSTATE isEqualToString:@"CANCEL"]) {
        
        _bottomView.hidden = YES;
    }
}

//
//
//- (void)failureOfGetOupputInfo:(NSString *)msg {
//    
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//    
//    [Tools showAlert:self.view andTitle:msg];
//}
//
//
//- (void)successOfOutPutWorkflow:(NSString *)msg {
//    
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//    
//    [Tools showAlert:self.view andTitle:msg];
//}
//
//
//- (void)failureOfOutPutWorkflow:(NSString *)msg {
//    
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//    
//    [Tools showAlert:self.view andTitle:msg];
//}
//
//
//- (void)successOfOutPutCancel:(NSString *)msg {
//    
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//    
//    [self pop];
//    
//    [Tools showAlert:self.view andTitle:msg andTime:2.5];
//}
//
//
//- (void)failureOfOutPutCancel:(NSString *)msg {
//    
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//    
//    [self pop];
//    
//    [Tools showAlert:self.view andTitle:msg andTime:2.5];
//}

@end
