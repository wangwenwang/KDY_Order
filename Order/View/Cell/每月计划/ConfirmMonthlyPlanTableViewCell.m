//
//  ConfirmMonthlyPlanTableViewCell.m
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "ConfirmMonthlyPlanTableViewCell.h"

@interface ConfirmMonthlyPlanTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_NAME;

@property (weak, nonatomic) IBOutlet UILabel *ORG_PRICE;

@end

@implementation ConfirmMonthlyPlanTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}

- (void)setPromotionDetailM:(PromotionDetailModel *)promotionDetailM {
    
    _PRODUCT_NAME.text = promotionDetailM.PRODUCT_NAME;
    _ORG_PRICE.text = [NSString stringWithFormat:@"%.1f", promotionDetailM.ORG_PRICE];
}

@end
