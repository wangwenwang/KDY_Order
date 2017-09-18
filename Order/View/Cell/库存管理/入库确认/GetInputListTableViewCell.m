//
//  GetInputListTableViewCell.m
//  Order
//
//  Created by 凯东源 on 2017/9/16.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "GetInputListTableViewCell.h"

@implementation GetInputListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInputM:(InputModel *)inputM {
    
    self.textLabel.text = inputM.iNPUTNO;
}


@end
