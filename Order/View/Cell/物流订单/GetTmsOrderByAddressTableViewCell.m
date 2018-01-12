//
//  GetTmsOrderByAddressTableViewCell.m
//  Order
//
//  Created by 凯东源 on 2018/1/3.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetTmsOrderByAddressTableViewCell.h"

@interface GetTmsOrderByAddressTableViewCell ()

// 下单编号
@property (weak, nonatomic) IBOutlet UILabel *ORD_No;

// 创建时间
@property (weak, nonatomic) IBOutlet UILabel *ORD_DATE_ADD;

// 下单总量
@property (weak, nonatomic) IBOutlet UILabel *ORD_QTY;

// 下单总重
@property (weak, nonatomic) IBOutlet UILabel *ORD_WEIGHT;

// 下单体积
@property (weak, nonatomic) IBOutlet UILabel *ORD_VOLUME;

// 物流总量
@property (weak, nonatomic) IBOutlet UILabel *TMS_QTY;

// 物流总重
@property (weak, nonatomic) IBOutlet UILabel *TMS_WEIGHT;

// 物流体积
@property (weak, nonatomic) IBOutlet UILabel *TMS_VOLUME;

// 客户名称
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_NAME;

// 目标地址
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_ADDRESS;

@end

@implementation GetTmsOrderByAddressTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setTmsOrderItemM:(TmsOrderItemModel *)tmsOrderItemM {
    
    _ORD_No.text = tmsOrderItemM.oRDNo;
    _ORD_DATE_ADD.text = tmsOrderItemM.oRDDATEADD;
    _ORD_QTY.text = tmsOrderItemM.oRDQTY;
    _ORD_WEIGHT.text = tmsOrderItemM.oRDWEIGHT;
    _ORD_VOLUME.text = tmsOrderItemM.oRDVOLUME;
    _TMS_QTY.text = tmsOrderItemM.tMSQTY;
    _TMS_WEIGHT.text = tmsOrderItemM.tMSWEIGHT;
    _TMS_VOLUME.text = tmsOrderItemM.tMSVOLUME;
    _ORD_TO_NAME.text = tmsOrderItemM.oRDTONAME;
    _ORD_TO_ADDRESS.text = tmsOrderItemM.oRDTOADDRESS;
}

@end
