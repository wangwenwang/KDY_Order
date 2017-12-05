//
//  MonthlyPlanTableViewCell.m
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "MonthlyPlanTableViewCell.h"

@interface MonthlyPlanTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_NAME;

@end

@implementation MonthlyPlanTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setPromotionDetailM:(PromotionDetailModel *)promotionDetailM {
    
    _PRODUCT_NAME.text = promotionDetailM.PRODUCT_NAME;
}

@end
