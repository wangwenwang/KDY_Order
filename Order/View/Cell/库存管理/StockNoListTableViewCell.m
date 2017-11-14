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

// 操作日期
@property (weak, nonatomic) IBOutlet UILabel *CHANGE_DATE;

@end

@implementation StockNoListTableViewCell


- (void)awakeFromNib {
    
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setStockNoItemM:(StockNoItemModel *)stockNoItemM {
    
    _BATCH_NUMBER.text = stockNoItemM.sTOCKNO;
    _PRODUCT_STATE.text = stockNoItemM.pRODUCTSTATE;
    _STOCK_QTY.text = [Tools formatFloat:[stockNoItemM.sTOCKQTY floatValue]];
    _STOCK_UOM.text = stockNoItemM.sTOCKUOM;
    _CHANGE_DATE.text = stockNoItemM.eDITDATE;
}


- (void)setStockNoWaterItemM:(StockNoWaterItemModel *)stockNoWaterItemM {
    
    _BATCH_NUMBER.text = stockNoWaterItemM.sTOCKNO;
    _PRODUCT_STATE.text = stockNoWaterItemM.pRODUCTIONDATE;
    _STOCK_QTY.text = [Tools formatFloat:[stockNoWaterItemM.sTOCKQTY floatValue]];
    _STOCK_UOM.text = stockNoWaterItemM.sTOCKUOM;
    _CHANGE_DATE.text = stockNoWaterItemM.cHANGEDATE;
}

@end
