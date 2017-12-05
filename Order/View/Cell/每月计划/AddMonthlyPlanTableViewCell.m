//
//  AddMonthlyPlanTableViewCell.m
//  Order
//
//  Created by 凯东源 on 16/10/14.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import "AddMonthlyPlanTableViewCell.h"
#import "ProductPolicyTableViewCell.h"
#import "ProductPolicyModel.h"

@interface AddMonthlyPlanTableViewCell ()

@end


@implementation AddMonthlyPlanTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


#pragma mark - SET方法

- (IBAction)delNumberOnclick:(UIButton *)sender {
    
    if(_product.CHOICED_SIZE > 0) {
        _product.CHOICED_SIZE --;
        NSString *productNumberStr = [NSString stringWithFormat:@"%lld", _product.CHOICED_SIZE];
        
        [_productNumberButton setTitle:productNumberStr forState:UIControlStateNormal];
        if([_delegate respondsToSelector:@selector(delNumberOnclick:andIndexRow:andSection:)]) {
            [_delegate delNumberOnclick:_product.PRODUCT_PRICE andIndexRow:(int)self.tag andSection:self.section];
        }
    }
}

- (IBAction)addNumberOnclick:(UIButton *)sender {
    
    [self add];
}

- (void)add {
    _product.CHOICED_SIZE ++;
    NSString *productNumberStr = [NSString stringWithFormat:@"%lld", _product.CHOICED_SIZE];
    [_productNumberButton setTitle:productNumberStr forState:UIControlStateNormal];
    if([_delegate respondsToSelector:@selector(addNumberOnclick:andIndexRow:andSection:)]) {
        [_delegate addNumberOnclick:_product.PRODUCT_PRICE andIndexRow:(int)self.tag andSection:self.section];
    }
}

- (IBAction)productNumberOnclick:(UIButton *)sender {
    
    long long selectedNumber = [[_productNumberButton titleForState:UIControlStateNormal] longLongValue];
    [self customize:selectedNumber];
}

- (void)customize:(long long)selectedNumber {
    if([_delegate respondsToSelector:@selector(productNumberOnclick:andIndexRow:andSelectedNumber:andSection:)]) {
        [_delegate productNumberOnclick:_product.PRODUCT_PRICE andIndexRow:(int)self.tag andSelectedNumber:selectedNumber andSection:self.section];
    }
}

@end
