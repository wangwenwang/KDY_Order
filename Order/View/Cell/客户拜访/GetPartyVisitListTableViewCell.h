//
//  GetPartyVisitListTableViewCell.h
//  Order
//
//  Created by wenwang wang on 2018/10/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetPartyVisitItemModel.h"

@protocol GetPartyVisitListTableViewCellDelegate <NSObject>

///// 添加步骤
//- (void)addStepOnclick:(NSUInteger)row;

/// 查看步骤
- (void)showStepOnclick:(NSUInteger)row;

/// 拜访/编辑
- (void)editOnclick:(NSUInteger)row;

@end

@interface GetPartyVisitListTableViewCell : UITableViewCell


@property (weak, nonatomic) id <GetPartyVisitListTableViewCellDelegate> delegate;

@property (strong, nonatomic)GetPartyVisitItemModel *getPartyVisitItemM;

// 拜访/编辑按钮文字
@property (weak, nonatomic) IBOutlet UILabel *addOrEditLabel;

// 是否显示『查看拜访』按钮
@property (assign, nonatomic) BOOL isDisplayCheckBtn;

// 是否显示『拜访或继续拜访』按钮
@property (assign, nonatomic) BOOL isDisplayVisitBtn;

@end
