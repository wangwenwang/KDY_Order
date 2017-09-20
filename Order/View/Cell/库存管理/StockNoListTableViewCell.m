//
//  StockNoListTableViewCell.m
//  Order
//
//  Created by 凯东源 on 2017/9/14.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "StockNoListTableViewCell.h"
#import "Tools.h"

@interface StockNoListTableViewCell ()

// 库存批号
@property (weak, nonatomic) IBOutlet UILabel *BATCH_NUMBER;

// 生产日期
@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_STATE;

// 库存数量
@property (weak, nonatomic) IBOutlet UILabel *STOCK_QTY;

// 物品单位
@property (weak, nonatomic) IBOutlet UILabel *STOCK_UOM;

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
    _STOCK_QTY.text = [Tools formatFloat:[stockNoItemM.sTOCKQTY floatValue]];
    _STOCK_UOM.text = stockNoItemM.sTOCKUOM;
}

@end
