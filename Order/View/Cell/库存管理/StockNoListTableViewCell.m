//
//  StockNoListTableViewCell.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockNoListTableViewCell.h"

@interface StockNoListTableViewCell ()

// 库存批号
@property (weak, nonatomic) IBOutlet UILabel *BATCH_NUMBER;

// 生产日期
@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_STATE;

@end

@implementation StockNoListTableViewCell


- (void)awakeFromNib {
    
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setStockNoItemM:(StockNoItemModel *)stockNoItemM {
    
    _BATCH_NUMBER.text = stockNoItemM.bATCHNUMBER;
    _PRODUCT_STATE.text = stockNoItemM.pRODUCTSTATE;
}

@end
