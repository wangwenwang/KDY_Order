//
//  GetPartyVisitListTableViewCell.m
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetPartyVisitListTableViewCell.h"
#import "Tools.h"

@interface GetPartyVisitListTableViewCell ()

// 联系人
@property (weak, nonatomic) IBOutlet UILabel *CONTACTS;

// 联系电话
@property (weak, nonatomic) IBOutlet UILabel *CONTACTS_TEL;

// 新建时间
@property (weak, nonatomic) IBOutlet UILabel *ADD_DATE;

// 客户名称
@property (weak, nonatomic) IBOutlet UILabel *PARTY_NAME;

// 客户地址
@property (weak, nonatomic) IBOutlet UILabel *PARTY_ADDRESS;

// 拜访状态
@property (weak, nonatomic) IBOutlet UILabel *VISIT_STATES;

// 编辑按钮宽
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *edit_width;

// 编辑按钮距左
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *edit_trailing;

// 查看拜访
@property (weak, nonatomic) IBOutlet UIView *checkView;

// 拜访
@property (weak, nonatomic) IBOutlet UIView *visitView;

@end

@implementation GetPartyVisitListTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


//- (IBAction)addStepOnclick {
//
//    if([_delegate respondsToSelector:@selector(addStepOnclick:)]) {
//
//        [_delegate addStepOnclick:self.tag];
//    }
//}


- (IBAction)showStepOnclick {
    
    if([_delegate respondsToSelector:@selector(showStepOnclick:)]) {
        
        [_delegate showStepOnclick:self.tag];
    }
}


- (IBAction)editOnclick {
    
    if([_delegate respondsToSelector:@selector(editOnclick:)]) {
        
        [_delegate editOnclick:self.tag];
    }
}


- (void)setGetPartyVisitItemM:(GetPartyVisitItemModel *)getPartyVisitItemM {
    
    _CONTACTS.text = getPartyVisitItemM.cONTACTS;
    _CONTACTS_TEL.text = getPartyVisitItemM.cONTACTSTEL;
    _PARTY_NAME.text = getPartyVisitItemM.pARTYNAME;
    _PARTY_ADDRESS.text = getPartyVisitItemM.pARTYADDRESS;
    _ADD_DATE.text = getPartyVisitItemM.aDDDATE;
    if([[Tools getVISIT_STATES:getPartyVisitItemM.vISITSTATES] isEqualToString:@"未拜访"]) {
     
        [_VISIT_STATES setText:@"未拜访"];
        [_VISIT_STATES setTextColor:[UIColor redColor]];
    }else if([[Tools getVISIT_STATES:getPartyVisitItemM.vISITSTATES] isEqualToString:@"拜访中"]) {
        
        [_VISIT_STATES setText:@"拜访中"];
        [_VISIT_STATES setTextColor:[UIColor orangeColor]];
    }else if([[Tools getVISIT_STATES:getPartyVisitItemM.vISITSTATES] isEqualToString:@"已拜访"]) {
        
        [_VISIT_STATES setText:@"已拜访"];
        [_VISIT_STATES setTextColor:RGB(35, 120, 58)];
    }
}


- (void)setIsDisplayCheckBtn:(BOOL)isDisplayCheckBtn {
    
    if(isDisplayCheckBtn) {
        
        [_checkView setHidden:NO];
    }else {
        
        [_checkView setHidden:YES];
    }
}


- (void)setIsDisplayVisitBtn:(BOOL)isDisplayVisitBtn {
    
    if(isDisplayVisitBtn) {
        
        _edit_width.constant = 68;
        _edit_trailing.constant = 20;
        [_visitView setHidden:NO];
    }else {
        
        _edit_width.constant = 0;
        _edit_trailing.constant = 0;
        [_visitView setHidden:YES];
    }
}


@end
