//
//  CARTotalOrderDetailTableViewCell.m
//  Order
//
//  Created by wenwang wang on 2019/1/22.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CARTotalOrderDetailTableViewCell.h"

@interface CARTotalOrderDetailTableViewCell()

/// 产品代码
@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_NO;

/// 产品名称
@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_NAME;

/// 产品数量
@property (weak, nonatomic) IBOutlet UILabel *NUMBER;

/// 产品金额
@property (weak, nonatomic) IBOutlet UILabel *AMOUNT_MONEY;

@end

@implementation CARTotalOrderDetailTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}

- (void)setCARTotalOrderDetailItemM:(CARTotalOrderDetailItemModel *)CARTotalOrderDetailItemM {
    
    _PRODUCT_NO.text = CARTotalOrderDetailItemM.pRODUCTNO;
    _PRODUCT_NAME.text = CARTotalOrderDetailItemM.pRODUCTNAME;
    _NUMBER.text = CARTotalOrderDetailItemM.nUMBER;
    _AMOUNT_MONEY.text = CARTotalOrderDetailItemM.aMOUNTMONEY;
}

@end
