//
//  MonthlyPlanTableViewCell.m
//  Order
//
//  Created by 凯东源 on 2017/12/5.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "MonthlyPlanTableViewCell.h"

@interface MonthlyPlanTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *ORD_NO;

@property (weak, nonatomic) IBOutlet UILabel *ADD_DATE;

@property (weak, nonatomic) IBOutlet UILabel *TO_NAME;

@end

@implementation MonthlyPlanTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setMonthlyPlanM:(MonthlyPlanModel *)monthlyPlanM {
    
    _ORD_NO.text = monthlyPlanM.oRDNO;
    _ADD_DATE.text = monthlyPlanM.aDDDATE;
    _TO_NAME.text = monthlyPlanM.tONAME;
}

@end
