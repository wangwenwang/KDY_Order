//
//  CARTotalOrderDetailViewController.m
//  Order
//
//  Created by wenwang wang on 2019/1/22.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CARTotalOrderDetailViewController.h"
#import "ChartService.h"
#import "AppDelegate.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import "CARTotalOrderDetailTableViewCell.h"
#import "YCXMenu.h"

@interface CARTotalOrderDetailViewController ()<ChartServiceDelegate, UISearchBarDelegate>

@property ChartService *service;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) AppDelegate *app;

@property (strong, nonatomic) CARTotalOrderDetailListModel *CARTotalOrderDetailListM;

// 产品信息列表数据(搜索过滤后的)
@property (strong, nonatomic)NSMutableArray *productsFilter;

// 记住搜索结果，给『按默认排序』用
@property (strong, nonatomic)NSArray *productsFilter_bak;

@end

#define kCellName @"CARTotalOrderDetailTableViewCell"

@implementation CARTotalOrderDetailViewController

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
    
    self.title = [NSString stringWithFormat:@"%@%@详情", _DATE, _TYPE];
    
    [self addRightBtn];
    
    [self registerCell];
    
    [self requstData];
    
    [self addTableViewSearch];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - 事件

- (IBAction)screenOnclick {
    
    [self.view endEditing:YES];
}

- (void)rightBtnOnclick {
    
    NSArray *items = @[
                       [YCXMenuItem menuItem:@"按默认排序"
                                       image:nil
                                         tag:100
                                    userInfo:nil],
                       [YCXMenuItem menuItem:@"按数量降序"
                                       image:nil
                                         tag:101
                                    userInfo:nil],
                       [YCXMenuItem menuItem:@"按金额降序"
                                       image:nil
                                         tag:102
                                    userInfo:nil]
                       ];
    [YCXMenu showMenuInView:self.view fromRect:CGRectMake(self.view.frame.size.width - 50, 0, 50, 0) menuItems:items selected:^(NSInteger index, YCXMenuItem *item) {
        
        if(item.tag == 100) {
            
            // 默认排序 记住搜索结果，_productsFilter_bak有值取之
            _productsFilter = _productsFilter_bak ? [_productsFilter_bak mutableCopy] : [_CARTotalOrderDetailListM.cARTotalOrderDetailItemModel mutableCopy];
            [_tableView reloadData];
        }else if(item.tag == 101) {
            
            // 数量排序
            [_productsFilter sortUsingComparator:^NSComparisonResult(CARTotalOrderDetailItemModel *obj1, CARTotalOrderDetailItemModel *obj2) {
                return [obj2.nUMBER compare:obj1.nUMBER];
            }];
            [_tableView reloadData];
        }else if(item.tag == 102) {
            
            // 金额排序
            [_productsFilter sortUsingComparator:^NSComparisonResult(CARTotalOrderDetailItemModel *obj1, CARTotalOrderDetailItemModel *obj2) {
                return [obj2.aMOUNTMONEY compare:obj1.aMOUNTMONEY];
            }];
            [_tableView reloadData];
        }
    }];
}

#pragma mark - 功能函数

- (void)addRightBtn {
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"LM_sort"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnOnclick)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

// 注册Cell
- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)requstData {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if([_TYPE isEqualToString:kOUTName]) {
        
        [_service TotalOrderDetailStatement:_app.user.IDX andStrType:@"OUT" andStrTime:_DATE andStrBusinessIdx:_app.business.BUSINESS_IDX andStrPartyCode:_PARTY_CODE];
    }else if([_TYPE isEqualToString:kINPUTName]) {
        
        [_service TotalOrderDetailStatement:_app.user.IDX andStrType:@"INPUT" andStrTime:_DATE andStrBusinessIdx:_app.business.BUSINESS_IDX andStrPartyCode:_PARTY_CODE];
    }
}

- (void)addTableViewSearch {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
    searchBar.backgroundImage = [[UIImage alloc] init];
    searchBar.barTintColor = [UIColor clearColor];
    
    UITextField *searchField = [searchBar valueForKey:@"_searchField"];
    searchField.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [view addSubview:searchBar];
    _tableView.tableHeaderView = view;
    [searchBar setPlaceholder:@"按产品名称搜索"];
    searchBar.delegate = self;
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _productsFilter.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 125;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CARTotalOrderDetailItemModel *m = _productsFilter[indexPath.row];
    
    // 处理界面
    static NSString *cellId = kCellName;
    CARTotalOrderDetailTableViewCell *cell = (CARTotalOrderDetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.CARTotalOrderDetailItemM= m;
    
    return cell;
}


#pragma mark - ChartServiceDelegate

- (void)successOfCARTotalOrderDetailList:(CARTotalOrderDetailListModel *)CARTotalOrderDetailListM {
    
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    _CARTotalOrderDetailListM = CARTotalOrderDetailListM;
    _productsFilter = [CARTotalOrderDetailListM.cARTotalOrderDetailItemModel mutableCopy];
    [_tableView reloadData];
}

- (void)failureOfChartService:(NSString *)msg {
    
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    NSLog(@"当前方案：%@", searchText);
    [_productsFilter removeAllObjects];
    
    if([[searchText trim] isEqualToString:@""]) {
        
        _productsFilter = [_CARTotalOrderDetailListM.cARTotalOrderDetailItemModel mutableCopy];
    } else {
        
        for (int i = 0; i < _CARTotalOrderDetailListM.cARTotalOrderDetailItemModel.count; i++) {
            
            CARTotalOrderDetailItemModel *m = _CARTotalOrderDetailListM.cARTotalOrderDetailItemModel[i];
            
            if([m.pRODUCTNAME rangeOfString:searchText options:NSCaseInsensitiveSearch].length > 0) {
                
                [_productsFilter addObject:m];
            } else {
                
            }
        }
    }
    _productsFilter_bak = [_productsFilter copy];
    [_tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.view endEditing:YES];
}

@end
