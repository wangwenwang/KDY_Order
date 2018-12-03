//
//  LMDropDownMenuTableViewCell.h
//  downDropMenu
//
//  Created by 凯东源 on 17/6/7.
//  Copyright © 2017年 xx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataItemModel.h"

@interface LMDropDownMenuTableViewCell : UITableViewCell

// 标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) DataItemModel *item;


@end
