//
//  GetWmsProductZongTableViewCell.m
//  Order
//
//  Created by 凯东源 on 2018/1/12.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetWmsProductZongTableViewCell.h"

@interface GetWmsProductZongTableViewCell ()

// 商品代码
@property (weak, nonatomic) IBOutlet UILabel *sku;

// 商品名称
@property (weak, nonatomic) IBOutlet UILabel *descr;

// 可用数量
@property (weak, nonatomic) IBOutlet UILabel *kesum;

// 库存数
@property (weak, nonatomic) IBOutlet UILabel *QTY;

// 单位
@property (weak, nonatomic) IBOutlet UILabel *susr2;

// 已分配数量
@property (weak, nonatomic) IBOutlet UILabel *QTYALLOCATED;

// 未配货需求
@property (weak, nonatomic) IBOutlet UILabel *WeiQTYALLOCATED;

@end

@implementation GetWmsProductZongTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setCheckStockItemM:(CheckStockItemModel *)checkStockItemM {
    
    _sku.text = checkStockItemM.sku;
    _descr.text = checkStockItemM.descr;
    _kesum.text = checkStockItemM.kesum;
    _QTY.text = checkStockItemM.qTY;
    _susr2.text = checkStockItemM.susr2;
    _QTYALLOCATED.text = checkStockItemM.qTYALLOCATED;
    _WeiQTYALLOCATED.text = checkStockItemM.weiQTYALLOCATED;
}

@end
