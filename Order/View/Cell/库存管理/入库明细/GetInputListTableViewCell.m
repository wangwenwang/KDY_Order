//
//  GetInputListTableViewCell.m
//  Order
//
//  Created by 凯东源 on 2017/8/18.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetInputListTableViewCell.h"

@interface GetInputListTableViewCell ()

// 出库单号
@property (weak, nonatomic) IBOutlet UILabel *OUTPUT_NO;

// 制单时间
@property (weak, nonatomic) IBOutlet UILabel *ADD_DATE;

// 入库类型
@property (weak, nonatomic) IBOutlet UILabel *INPUT_TYPE;

// 取消提示
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;

@end

@implementation GetInputListTableViewCell


- (void)awakeFromNib {
    
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}


- (void)setInputM:(InputModel *)inputM {
    
    _OUTPUT_NO.text = inputM.iNPUTNO;
    _ADD_DATE.text = inputM.aDDDATE;
    _INPUT_TYPE.text = inputM.iNPUTTYPE;
    
    if([inputM.iNPUTSTATE isEqualToString:@"OPEN"]) {
        
        if([inputM.iNPUTWORKFLOW isEqualToString:@"已审核"]) {
            
            _promptLabel.textColor = RGB(64, 147, 45);
        } else {
            
            _promptLabel.textColor = [UIColor redColor];
        }
        _promptLabel.text = inputM.iNPUTWORKFLOW;
    } else if([inputM.iNPUTSTATE isEqualToString:@"CANCEL"]) {
        
        _promptLabel.textColor = RGB(121, 121, 124);
        _promptLabel.text = @"此入库单已取消";
    } else {
        
        _promptLabel.text = inputM.iNPUTSTATE;
    }
}

@end
