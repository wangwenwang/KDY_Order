//
//  CustomerListSearchResultsViewController.h
//  Order
//
//  Created by 凯东源 on 17/6/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartyModel.h"

@interface CustomerListSearchResultsViewController : UIViewController


@property (nonatomic, retain) NSMutableArray *searchDataArray;//盛放搜索的联系人数据


@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) UIViewController *superVC;


@property (copy, nonatomic) NSString *vcClass;


@property (copy, nonatomic) NSString *functionName;


@property (strong, nonatomic) PartyModel *currentParty;


@property (strong, nonatomic) UINavigationController *nav;

@end
