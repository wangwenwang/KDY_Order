//
//  MonthlyPlanInfoTableViewCell.m
//  Order
//
//  Created by 凯东源 on 16/10/8.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import "MonthlyPlanInfoTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MonthlyPlanInfoTableViewCell ()

// 产品图片
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;

// 产品编号
@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_NO;

// 产品名称
@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_NAME;

// 数量
@property (weak, nonatomic) IBOutlet UILabel *PO_QTY;

// 重量
@property (weak, nonatomic) IBOutlet UILabel *PO_WEIGHT;

// 体积
@property (weak, nonatomic) IBOutlet UILabel *PO_VOLUME;

// 原价
@property (weak, nonatomic) IBOutlet UILabel *ORG_PRICE;

// 付款价
@property (weak, nonatomic) IBOutlet UILabel *ACT_PRICE;

// 总价
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;

// 产品名称 距下
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *PRODUCT_NAME_bottom;

@end


@implementation MonthlyPlanInfoTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setMonthlyPlanItemM:(MonthlyPlanItemModel *)monthlyPlanItemM {
    
    double totalPrice = [monthlyPlanItemM.pOQTY floatValue] * [monthlyPlanItemM.aCTPRICE floatValue];
    
//    NSString *imageURL = [NSString stringWithFormat:@"%@/%@", API_ServerAddress, monthlyPlanItemM.PRODUCTURL];
    
    _PRODUCT_NO.text = monthlyPlanItemM.pRODUCTNO;
    _PRODUCT_NAME.text = monthlyPlanItemM.pRODUCTNAME;
    _PO_QTY.text = [NSString stringWithFormat:@"%@%@", monthlyPlanItemM.pOQTY, monthlyPlanItemM.pOUOM];
    _PO_WEIGHT.text = [NSString stringWithFormat:@"%@吨", monthlyPlanItemM.pOWEIGHT];
    _PO_VOLUME.text = [NSString stringWithFormat:@"%@m³", monthlyPlanItemM.pOVOLUME];
    _ORG_PRICE.text = monthlyPlanItemM.oRGPRICE ? [NSString stringWithFormat:@"￥%.1f", [monthlyPlanItemM.oRGPRICE floatValue]] : @"￥0.0";
    _ACT_PRICE.text = monthlyPlanItemM.aCTPRICE ? [NSString stringWithFormat:@"￥%.1f", [monthlyPlanItemM.aCTPRICE floatValue]] : @"￥0.0";
    _totalPriceLabel.text = totalPrice ? [NSString stringWithFormat:@"￥%.1f", totalPrice] : @"￥0.0";
//    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"ic_information_picture"]];
}

@end
