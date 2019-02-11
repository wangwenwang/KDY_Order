//
//  ShoppingCartTableViewCell.m
//  Order
//
//  Created by 凯东源 on 16/10/17.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import "ShoppingCartTableViewCell.h"
#import "Tools.h"

@implementation ShoppingCartTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)delOnlick:(UIButton *)sender {
    
    if([Tools hasBASE_RATE:_product.BASE_RATE]) {
        
        if(_product.CHOICED_SIZE >= _product.BASE_RATE) {
            _product.CHOICED_SIZE -= _product.BASE_RATE;
            NSString *productNumberStr = [NSString stringWithFormat:@"%lld", _product.CHOICED_SIZE];
            
            [_productNumberButton setTitle:productNumberStr forState:UIControlStateNormal];
            if([_delegate respondsToSelector:@selector(delOnclickOfShoppingCartTableViewCell:andIndexRow:andQty:)]) {
                [_delegate delOnclickOfShoppingCartTableViewCell:_product.PRODUCT_PRICE *_product.BASE_RATE andIndexRow:(int)self.tag andQty:_product.BASE_RATE];
            }
        }
    }else {
        
        if(_product.CHOICED_SIZE > 0) {
            _product.CHOICED_SIZE --;
            NSString *productNumberStr = [NSString stringWithFormat:@"%lld", _product.CHOICED_SIZE];
            
            [_productNumberButton setTitle:productNumberStr forState:UIControlStateNormal];
            if([_delegate respondsToSelector:@selector(delOnclickOfShoppingCartTableViewCell:andIndexRow:andQty:)]) {
                [_delegate delOnclickOfShoppingCartTableViewCell:_product.PRODUCT_PRICE andIndexRow:(int)self.tag andQty:1];
            }
        }
    }
}

- (IBAction)addOnclick:(UIButton *)sender {
    if([_product.ISINVENTORY isEqualToString:@"Y"]) {
        
        long long maxSize = _product.PRODUCT_INVENTORY;
        if(_product.CHOICED_SIZE < maxSize) {
            [self add];
        } else {
            if([_delegate respondsToSelector:@selector(noStockOfShoppingCartTableViewCell)]) {
                [_delegate noStockOfShoppingCartTableViewCell];
            }
        }
    } else {
        [self add];
    }
}

- (void)add {
    // 传出去的价格
    double price = 0;
    // 传出去的数量
    int qty = 0;
    if([Tools hasBASE_RATE:_product.BASE_RATE]) {
        _product.CHOICED_SIZE += _product.BASE_RATE;
        price = _product.PRODUCT_PRICE * _product.BASE_RATE;
        qty = _product.BASE_RATE;
    }else{
        _product.CHOICED_SIZE ++;
        price = _product.PRODUCT_PRICE;
        qty = 1;
    }
    NSString *productNumberStr = [NSString stringWithFormat:@"%lld", _product.CHOICED_SIZE];
    
    [_productNumberButton setTitle:productNumberStr forState:UIControlStateNormal];
    if([_delegate respondsToSelector:@selector(addOnclickShoppingCartTableViewCell:andIndexRow:andQty:)]) {
        [_delegate addOnclickShoppingCartTableViewCell:price andIndexRow:(int)self.tag andQty:qty];
    }
}

@end
