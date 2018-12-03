//
//  GetPartyVisitListSearchResultsViewController.h
//  Order
//
//  Created by wenwang wang on 2018/10/31.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetPartyVisitListSearchResultsViewController : UIViewController

/// TableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/// 过滤后的TableView数据
@property (strong, nonatomic) NSMutableArray *visitsFilter;


@property (strong, nonatomic) UINavigationController *nav;

@end
