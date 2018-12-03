//
//  LMDropDownMenuTableViewCell.m
//  downDropMenu
//
//  Created by 凯东源 on 17/6/7.
//  Copyright © 2017年 xx. All rights reserved.
//

#import "LMDropDownMenuTableViewCell.h"

@interface LMDropDownMenuTableViewCell ()


// 是否已选
@property (weak, nonatomic) IBOutlet UIImageView *select_status_ImageView;

@end


@implementation LMDropDownMenuTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setItem:(DataItemModel *)item {
    
    _item = item;
    
    _titleLabel.text = _item.title;
    
    _select_status_ImageView.image = [UIImage imageNamed:_item.selected ? @"selected" : @"unselect"];
    NSLog(@"");
}

@end
