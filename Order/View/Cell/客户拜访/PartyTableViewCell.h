//
//  PartyTableViewCell.h
//  Order
//
//  Created by wenwang wang on 2018/11/30.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartyTableViewCell : UITableViewCell

/// 客户代码
@property (weak, nonatomic) IBOutlet UILabel *PARTY_CODE;

/// 客户名称
@property (weak, nonatomic) IBOutlet UILabel *PARTY_NAME;

/// 客户地址
@property (weak, nonatomic) IBOutlet UILabel *CONTACTS_ADDRESS;

/// 联系人
@property (weak, nonatomic) IBOutlet UILabel *CONTACTS_TEL;

@end
