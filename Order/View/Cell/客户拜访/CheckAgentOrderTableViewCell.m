//
//  CheckAgentOrderTableViewCell.m
//  Order
//
//  Created by wenwang wang on 2019/1/25.
//  Copyright © 2019 凯东源. All rights reserved.
//

#import "CheckAgentOrderTableViewCell.h"
#import "Tools.h"

@interface CheckAgentOrderTableViewCell()

// 订单编号
@property (weak, nonatomic) IBOutlet UILabel *ORD_NO;

// 收货客户名称
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_NAME;

// 订单创建时间
@property (weak, nonatomic) IBOutlet UILabel *ORD_DATE_ADD;

// 货物数量
@property (weak, nonatomic) IBOutlet UILabel *ORD_QTY;

// 订单状态
@property (weak, nonatomic) IBOutlet UILabel *workFlowLabel;

@end

@implementation CheckAgentOrderTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}

- (void)setCheckOrderItemM:(CheckOrderItemModel *)CheckOrderItemM {
    
    _ORD_NO.text = CheckOrderItemM.oRDNO;
    _ORD_TO_NAME.text = CheckOrderItemM.oRDTONAME;
    _ORD_DATE_ADD.text = CheckOrderItemM.oRDDATEADD;
    _ORD_QTY.text = CheckOrderItemM.oRDQTY;
    _workFlowLabel.text = [Tools getOrderStatus:CheckOrderItemM.oRDSTATE];
    if([_workFlowLabel.text isEqualToString:@"待接收"] || [_workFlowLabel.text isEqualToString:@"已取消"]) {
        
        _workFlowLabel.textColor = [UIColor redColor];
    } else if ([_workFlowLabel.text isEqualToString:@"在途"] || [_workFlowLabel.text isEqualToString:@"已完成"]){
        
        _workFlowLabel.textColor = RGB(64, 147, 45);
    }
}

@end
