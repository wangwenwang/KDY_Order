//
//  AddMonthlyPlanTableViewCell.h
//  Order
//
//  Created by 凯东源 on 16/10/14.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@protocol AddMonthlyPlanTableViewCellDelegate <NSObject>

@optional
- (void)delNumberOnclick:(double)price andIndexRow:(int)indexRow andSection:(NSInteger)section;

@optional
- (void)addNumberOnclick:(double)price andIndexRow:(int)indexRow andSection:(NSInteger)section;

@optional
- (void)productNumberOnclick:(double)price andIndexRow:(int)indexRow andSelectedNumber:(long long)selectedNumber andSection:(NSInteger)section;

@end

@interface AddMonthlyPlanTableViewCell : UITableViewCell

@property (weak, nonatomic) id<AddMonthlyPlanTableViewCellDelegate> delegate;

/// 产品图片
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;

/// 产品名称
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;

/// 产品规格
@property (weak, nonatomic) IBOutlet UILabel *productFormatLabel;

/// 产品价格
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;

/// 减少产品数量
- (IBAction)delNumberOnclick:(UIButton *)sender;

/// 将要下单的产品数量
@property (weak, nonatomic) IBOutlet UIButton *productNumberButton;

/// 增加产品数量
- (IBAction)addNumberOnclick:(UIButton *)sender;

/// 自定义输入数量
- (IBAction)productNumberOnclick:(UIButton *)sender;

/// 产品模型
@property (strong, nonatomic) ProductModel *product;

// 产品规格距下
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *productFormatLabel_bottom;

@property (assign, nonatomic) NSInteger section;

@end
