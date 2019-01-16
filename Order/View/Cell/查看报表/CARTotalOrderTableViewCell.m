
//
//  CARTotalOrderTableViewCell.m
//  Order
//
//  Created by wenwang wang on 2019/1/9.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CARTotalOrderTableViewCell.h"

@interface CARTotalOrderTableViewCell()

// 客户名称
@property (weak, nonatomic) IBOutlet UILabel *PARTY_NAME;

// 订单总数（客户总共销售了多少个订单）
@property (weak, nonatomic) IBOutlet UILabel *ORDER_NUMBER;

// 产品总数（全部订单加起来的产品数量）
@property (weak, nonatomic) IBOutlet UILabel *NUMBER;

// 总金额（这个客户的销售总金额）
@property (weak, nonatomic) IBOutlet UILabel *AMOUNT_MONEY;

@end

@implementation CARTotalOrderTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setCARTotalOrderItemM:(CARTotalOrderItemModel *)CARTotalOrderItemM {
    
    _PARTY_NAME.text = CARTotalOrderItemM.pARTYNAME;
    _ORDER_NUMBER.text = CARTotalOrderItemM.oRDERNUMBER;
    _NUMBER.text = CARTotalOrderItemM.nUMBER;
    _AMOUNT_MONEY.text = CARTotalOrderItemM.aMOUNTMONEY;
}

@end
