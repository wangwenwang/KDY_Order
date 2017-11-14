//
//  StockNoListTableViewCell.h
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StockNoWaterItemModel.h"
#import "StockNoItemModel.h"

@interface StockNoListTableViewCell : UITableViewCell


@property (strong, nonatomic) StockNoWaterItemModel *stockNoWaterItemM;

@property (strong, nonatomic) StockNoItemModel *stockNoItemM;

@end
