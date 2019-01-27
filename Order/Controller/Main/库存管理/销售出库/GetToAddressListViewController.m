//
//  GetToAddressListViewController.m
//  Order
//
//  Created by 凯东源 on 2017/8/21.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetToAddressListViewController.h"
#import "Store_GetToAddressListService.h"
#import "GetToAddressListTableViewCell.h"
#import "UITableView+NoDataPrompt.h"
#import <MBProgressHUD.h>
#import "Tools.h"

@interface GetToAddressListViewController ()<Store_GetToAddressListServiceDelegate, UISearchBarDelegate>

// 收货人地址列表
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// 网络层
@property (strong, nonatomic) Store_GetToAddressListService *service;

// 收货人地址
@property (strong, nonatomic) GetToAddressListModel *getToAddressListM;

// 列表数据(搜索过滤后的)
@property (strong, nonatomic)NSMutableArray *ToAddressFilter;

@end


#define kCellHeight 68

#define kCellName @"GetToAddressListTableViewCell"


@implementation GetToAddressListViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[Store_GetToAddressListService alloc] init];
        _service.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"收货信息";
    
    // 注册Cell
    [self registerCell];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [_service GetToAddressList:[_address_idx integerValue]];
    
    [self addTableViewSearch];
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
    
    return _ToAddressFilter.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GetToAddressModel *getToAddressListM = _ToAddressFilter[indexPath.row];
    
    return getToAddressListM.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 处理界面
    static NSString *cellId = kCellName;
    GetToAddressListTableViewCell *cell = (GetToAddressListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    GetToAddressModel *getToAddressM = _ToAddressFilter[indexPath.row];
    
    cell.getToAddressM = getToAddressM;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GetToAddressModel *getToAddressListM = _ToAddressFilter[indexPath.row];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kStockOutViewController_receiveMsg object:nil userInfo:@{@"msg" : getToAddressListM}];
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Store_GetToAddressListService

- (void)successOfGetToAddressList:(GetToAddressListModel *)getToAddressListM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _getToAddressListM = getToAddressListM;
    
    _ToAddressFilter = [_getToAddressListM.getToAddressModel mutableCopy];
    
    CGFloat tableViewHeight = 0;
    for (GetToAddressModel *m in _getToAddressListM.getToAddressModel) {
        
        // 单行高度
        CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:ScreenWidth];
        
        CGFloat ADDRESS_INFO_height = [Tools getHeightOfString:m.aDDRESSINFO fontSize:14 andWidth:(ScreenWidth - 8 - 2)];
        
        CGFloat cellHeight = 0;
        if(ADDRESS_INFO_height > oneLine) {
            
            cellHeight = kCellHeight + ADDRESS_INFO_height - oneLine;
        } else {
            
            cellHeight = kCellHeight;
        }
        
        m.cellHeight = cellHeight;
        
        tableViewHeight += m.cellHeight;
    }
    
    [_tableView reloadData];
}


- (void)successOfGetToAddressList_NoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView noData:@"没有收货人信息哦" andImageName:LM_NoResult_noResult];
}


- (void)failureOfGetToAddressList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView noData:msg andImageName:LM_NoResult_noResult];
}


#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    NSLog(@"当前文字：%@", searchText);
    [_ToAddressFilter removeAllObjects];
    
    if([[searchText trim] isEqualToString:@""]) {
        
        _ToAddressFilter = [_getToAddressListM.getToAddressModel mutableCopy];
    } else {
        
        for (int i = 0; i < _getToAddressListM.getToAddressModel.count; i++) {
            
            GetToAddressModel *m =_getToAddressListM.getToAddressModel[i];
            
            if([m.pARTYNAME rangeOfString:searchText options:NSCaseInsensitiveSearch].length > 0) {
                
                [_ToAddressFilter addObject:m];
            } else {
                
            }
        }
    }
    [_tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.view endEditing:YES];
}

@end
