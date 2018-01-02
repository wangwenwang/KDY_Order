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

@property (weak, nonatomic) IBOutlet UILabel *PO_QTY;

@property (weak, nonatomic) IBOutlet UILabel *TotalPrice;

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
    _PO_QTY.text = [NSString stringWithFormat:@"%lld", promotionDetailM.PO_QTY];
    _TotalPrice.text = [NSString stringWithFormat:@"%.1f", promotionDetailM.ORG_PRICE * promotionDetailM.PO_QTY];
}

@end
