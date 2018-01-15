//
//  GetWmsProductSumTableViewCell.m
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetWmsProductSumTableViewCell.h"

@interface GetWmsProductSumTableViewCell ()

// 库位
@property (weak, nonatomic) IBOutlet UILabel *Loc;

// 生产日期
@property (weak, nonatomic) IBOutlet UILabel *lottable04;

// 库存数
@property (weak, nonatomic) IBOutlet UILabel *QTY;

// 可用数量
@property (weak, nonatomic) IBOutlet UILabel *kesum;

// 已分配数量
@property (weak, nonatomic) IBOutlet UILabel *QTYALLOCATED;

// 未配货需求
@property (weak, nonatomic) IBOutlet UILabel *WeiQTYALLOCATED;

@end

@implementation GetWmsProductSumTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setCheckStockDetailItemM:(CheckStockDetailItemModel *)checkStockDetailItemM {
    
    _Loc.text = checkStockDetailItemM.loc;
    _lottable04.text = checkStockDetailItemM.lottable04;
    _QTY.text = checkStockDetailItemM.qTY;
    _kesum.text = checkStockDetailItemM.kesum;
    _QTYALLOCATED.text = checkStockDetailItemM.qTYALLOCATED;
    _WeiQTYALLOCATED.text = checkStockDetailItemM.weiQTYALLOCATED;
}

@end
