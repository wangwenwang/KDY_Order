//
//  MainViewController.m
//  Order
//
//  Created by 凯东源 on 16/9/27.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import "MainViewController.h"
#import "SDCycleScrollView.h"
#import "MaincollectionViewCell.h"
#import "NewsViewController.h"
#import "HotProductViewController.h"
#import "ChartService.h"
#import "CARListViewController.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import "GetStockListViewController.h"
#import "AppDelegate.h"
#import "GetFeeListViewController.h"
#import "CustomerListViewController.h"
#import "MonthlyPlanViewController.h"
#import "GetTmsOrderByAddressViewController.h"
#import "GetWmsProductZongViewController.h"
#import "GetPartyVisitListViewController.h"

@interface MainViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ChartServiceDelegate>

/// Cell ID
@property (copy, nonatomic) NSString *cellID;

/// myCollectionView 数据
@property (strong, nonatomic) NSMutableArray *myCollectionDataArrM;

@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property (strong, nonatomic) ChartService *chartService;

@property (strong, nonatomic) AppDelegate *app;

@end

@implementation MainViewController

#pragma mark - 生命周期

- (instancetype)init {
    if(self = [super init]) {
        self.title = @"首页";
        self.tabBarItem.image = [UIImage imageNamed:@"menu_index_unselected"];
        _cellID = @"myCollectionViewCellID";
        _myCollectionDataArrM = [[NSMutableArray alloc] init];
        _chartService = [[ChartService alloc] init];
        _chartService.delegate = self;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //获取plist数据
    [self getPlistData];
    
    //注册Cell
    [self registerCell];
    
    // 注册通知
    [self addNotification];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    // 此类未初始化
    if([[[NSUserDefaults standardUserDefaults] objectForKey:kMainViewController_init] isEqualToString:@"NO"]) {
        if([[[NSUserDefaults standardUserDefaults] objectForKey:k3DTouchType] isEqualToString:k3DTouchTypeMakeOrder]) {
            
            self.tabBarController.selectedIndex = 1;
            self.navigationController.navigationBar.topItem.title = @"采购订单";
        } else if([[[NSUserDefaults standardUserDefaults] objectForKey:k3DTouchType] isEqualToString:k3DTouchTypeCheckOrder]) {
            
            self.tabBarController.selectedIndex = 2;
            self.navigationController.navigationBar.topItem.title = @"查单";
        }
        [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:kMainViewController_init];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    //添加广告轮播
    [self addCycleScrollView];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.topItem.title = @"首页";
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:k3DTouchType];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
    [self removeNotification];
}


#pragma mark - 通知

- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMsg:) name:kMainViewController_receiveMsg object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(forceTouch:) name:kMainViewController_3DTouch object:nil];
}

- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kMainViewController_receiveMsg object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kMainViewController_3DTouch object:nil];
}

- (void)receiveMsg:(NSNotification *)aNotify{
    
    NSString *msg = aNotify.userInfo[@"msg"];
    [Tools showAlert:self.view andTitle:msg andTime:2.5];
}

- (void)forceTouch:(NSNotification *)aNotify{
    
    NSString *type = aNotify.userInfo[@"type"];
    if([type isEqualToString:k3DTouchTypeMakeOrder]) {
        
        self.tabBarController.selectedIndex = 1;
        self.navigationController.navigationBar.topItem.title = @"采购订单";
    } else if([type isEqualToString:k3DTouchTypeCheckOrder]) {
        
        self.tabBarController.selectedIndex = 2;
        self.navigationController.navigationBar.topItem.title = @"查单";
    }
}


#pragma mark - 私有方法

- (void)addCycleScrollView {
    
    NSArray *images = nil;
    
    NSString *welcomeImageName = [[NSUserDefaults standardUserDefaults] objectForKey:kWelcomeImageName];
    if([welcomeImageName isEqualToString:@"YIB"] || [welcomeImageName isEqualToString:@"QH"]) {
        
        images = [NSArray arrayWithObjects:@"ad_pic_5.png", @"ad_pic_6.png", @"ad_pic_0.jpg", @"ad_pic_1.jpg", @"ad_pic_2.jpg", @"ad_pic_3.jpg", nil];
    } else if([welcomeImageName isEqualToString:@"DK"]) {
        
        images = [NSArray arrayWithObjects:@"ad_pic_20", @"ad_pic_21", @"ad_pic_22", @"ad_pic_23", nil];
    } else if([welcomeImageName isEqualToString:@"MY"]) {
        
        if([_app.business.BUSINESS_CODE rangeOfString:@"MYI02"].length > 0 ||
           [_app.business.BUSINESS_CODE rangeOfString:@"MYI03"].length > 0 ||
           [_app.business.BUSINESS_CODE rangeOfString:@"MYI04"].length > 0) {
            
            images = [NSArray arrayWithObjects:@"ad_pic_24", @"ad_pic_21", nil];
        }else {
            
            images = [NSArray arrayWithObjects:@"ad_pic_21", nil];
        }
    } else {
        
        images = [NSArray arrayWithObjects:@"ad_pic_5.png", @"ad_pic_6.png", @"ad_pic_1.jpg", @"ad_pic_2.jpg", @"ad_pic_3.jpg", nil];
    }
    
    // 本地加载图片的轮播器
    SDCycleScrollView *_cycleScrollView1 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, CGRectGetHeight(_cycleScrollView.frame)) imageNamesGroup:images];
    [self.view addSubview:_cycleScrollView1];
}

- (void)registerCell {
    
    [self.myCollectionView registerNib:[UINib nibWithNibName:@"MainCollectionViewCell"bundle:nil]forCellWithReuseIdentifier:_cellID];
}

- (void)getPlistData {
    
    NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"MainCollection.plist" ofType:nil];
    _myCollectionDataArrM = [NSMutableArray arrayWithContentsOfFile:dataPath];
    
    // 怡宝才有 "库存登记"、"费用帐单"、"库存管理" 功能
    if([_app.business.BUSINESS_CODE rangeOfString:@"YIB"].length == 0) {
        for (NSDictionary *dic in _myCollectionDataArrM) {
            if([dic[@"title"] isEqualToString:@"库存登记"]) {
                [_myCollectionDataArrM removeObject:dic];
                break;
            }
        }
        for (NSDictionary *dic in _myCollectionDataArrM) {
            if([dic[@"title"] isEqualToString:@"费用帐单"]) {
                [_myCollectionDataArrM removeObject:dic];
                break;
            }
        }
//        for (NSDictionary *dic in _myCollectionDataArrM) {
//            if([dic[@"title"] isEqualToString:@"库存管理"]) {
//                [_myCollectionDataArrM removeObject:dic];
//                break;
//            }
//        }
    }
    
    // 上海才有 "查看库存" 功能
    if([_app.business.BUSINESS_CODE rangeOfString:@"DK"].length == 0) {
        for (NSDictionary *dic in _myCollectionDataArrM) {
            if([dic[@"title"] isEqualToString:@"查看库存"]) {
                [_myCollectionDataArrM removeObject:dic];
                break;
            }
        }
    }
}


#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _myCollectionDataArrM.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellID forIndexPath:indexPath];
    
    cell.titleLabel.text = _myCollectionDataArrM[indexPath.row][@"title"];
    cell.imageView.image = [UIImage imageNamed:_myCollectionDataArrM[indexPath.row][@"imageName"]];
    
    return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat cellW = (ScreenWidth - 2) / 3;
    return CGSizeMake(cellW, cellW * 0.9);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld, %ld", (long)indexPath.section, (long)indexPath.row);
    
    NSString *title =  _myCollectionDataArrM[indexPath.row][@"title"];
    
    if([title isEqualToString:@"物流订单"]) {
        
        GetTmsOrderByAddressViewController *sopVC = [[GetTmsOrderByAddressViewController alloc] init];
        [self.navigationController pushViewController:sopVC animated:YES];
    } else if([title isEqualToString:@"最新资讯"]) {
        
        NewsViewController *newsVC = [[NewsViewController alloc] init];
        [self.navigationController pushViewController:newsVC animated:YES];
    } else if([title isEqualToString:@"热销产品"]) {
        
        HotProductViewController *hotVC = [[HotProductViewController alloc] init];
        [self.navigationController pushViewController:hotVC animated:YES];
    } else if([title isEqualToString:@"查看报表"]) {
        
        CARListViewController *vc = [[CARListViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if([title isEqualToString:@"查看订单"]) {
        
        self.tabBarController.selectedIndex = 2;
    } else if([title isEqualToString:@"库存登记"]) {
        
        GetStockListViewController *vc = [[GetStockListViewController alloc] init];
        vc.title = title;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([title isEqualToString:@"客户费用"]) {
        
        GetFeeListViewController *vc = [[GetFeeListViewController alloc] init];
        vc.title = title;
        
        //        [self presentViewController:vc animated:YES completion:nil];
        [self.navigationController pushViewController:vc animated:YES];
        
        //        CustomerListViewController *vc = [[CustomerListViewController alloc] init];
        //        vc.title = title;
        //        vc.vcClass = NSStringFromClass([self class]);
        //        [self.navigationController pushViewController:vc animated:YES];
    } else if([title isEqualToString:@"费用帐单"]) {
        
        CustomerListViewController *vc = [[CustomerListViewController alloc] init];
        vc.title = title;
        vc.vcClass = NSStringFromClass([self class]);
        vc.functionName = title;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([title isEqualToString:@"库存管理"]) {
        
        CustomerListViewController *vc = [[CustomerListViewController alloc] init];
        vc.title = title;
        vc.vcClass = NSStringFromClass([self class]);
        vc.functionName = title;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([title isEqualToString:@"每月计划"]) {
        
        MonthlyPlanViewController *vc = [[MonthlyPlanViewController alloc] init];
        vc.title = title;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([title isEqualToString:@"查看库存"]) {
        
        GetWmsProductZongViewController *vc = [[GetWmsProductZongViewController alloc] init];
        vc.title = title;
        [self.navigationController pushViewController:vc animated:YES];
    } else if([title isEqualToString:@"客户拜访"]) {
        
        GetPartyVisitListViewController *vc = [[GetPartyVisitListViewController alloc] init];
        vc.title = title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
