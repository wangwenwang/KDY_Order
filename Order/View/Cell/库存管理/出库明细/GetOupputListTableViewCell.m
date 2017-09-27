//
//  GetOupputListTableViewCell.m
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetOupputListTableViewCell.h"
#import "Tools.h"

@interface GetOupputListTableViewCell ()

// 出库单号
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_NO;

// 出库客户名称
@property (weak, nonatomic) IBOutlet UILabel *PARTY_NAME;

// 制单时间
@property (weak, nonatomic) IBOutlet UILabel *ADD_DATE;

// 出库数量
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_QTY;

// 出库类型
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_TYPE;

// 取消提示
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;

@end

@implementation GetOupputListTableViewCell


- (void)awakeFromNib {
    
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}


- (void)setGetOupputM:(GetOupputModel *)getOupputM {
    
    _OUTPUT_NO.text = getOupputM.oUTPUTNO;
    _PARTY_NAME.text = [getOupputM.pARTYNAME isEqualToString:@""] ? @" " : getOupputM.pARTYNAME;
    _ADD_DATE.text = getOupputM.aDDDATE;
    _OUTPUT_QTY.text = [Tools OneDecimal:getOupputM.oUTPUTQTY];
    _OUTPUT_TYPE.text = getOupputM.oUTPUTTYPE;
    
    if([getOupputM.oUTPUTTYPE isEqualToString:@"销售出库"] || [getOupputM.oUTPUTTYPE isEqualToString:@"其它出库"]) {
        
        _OUTPUT_TYPE.textColor = RGB(64, 147, 45);
    } else if([getOupputM.oUTPUTTYPE isEqualToString:@"出库退库"]) {
        
        _OUTPUT_TYPE.textColor = [UIColor redColor];
    }
    
    if([getOupputM.oUTPUTSTATE isEqualToString:@"OPEN"]) {
        
        if([getOupputM.oUTPUTWORKFLOW isEqualToString:@"新建"]) {
            
            _promptLabel.text = @"未确认";
            _promptLabel.textColor = [UIColor redColor];
        } else {
            
            _promptLabel.text = @"已确认";
            _promptLabel.textColor = RGB(64, 147, 45);
        }
    } else if([getOupputM.oUTPUTSTATE isEqualToString:@"CANCEL"]) {
        
        _promptLabel.textColor = RGB(121, 121, 124);
        _promptLabel.text = @"此出库单已取消";
    } else {
        
        _promptLabel.text = getOupputM.oUTPUTSTATE;
    }
}

@end
