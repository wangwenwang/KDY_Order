//
//  StockOutTableViewCell.m
//  Order
//
//  Created by 凯东源 on 16/10/14.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import "StockOutTableViewCell.h"
#import "ProductPolicyTableViewCell.h"
#import "ProductPolicyModel.h"

@interface StockOutTableViewCell ()<UITableViewDelegate, UITableViewDataSource>


// Cell本身高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *productViewHeight;

@end


@implementation StockOutTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    
    [_myTableView registerNib:[UINib nibWithNibName:@"ProductPolicyTableViewCell" bundle:nil] forCellReuseIdentifier:@"ProductPolicyTableViewCell"];
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _policys.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"ProductPolicyTableViewCell";
    ProductPolicyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    ProductPolicyModel *m = _policys[indexPath.row];
    
    cell.policyTextLabel.text = m.POLICY_NAME;
    
    return cell;
    
}


#pragma mark - SET方法

- (void)setPolicys:(NSMutableArray *)policys {
    
    _policys = policys;
    
    [_myTableView reloadData];
}


- (void)setSelfHeight:(float)selfHeight {
    
    _productViewHeight.constant = selfHeight;
}


- (IBAction)delNumberOnclick:(UIButton *)sender {
    
    if(_product.CHOICED_SIZE > 0) {
        _product.CHOICED_SIZE --;
        NSString *productNumberStr = [NSString stringWithFormat:@"%lld", _product.CHOICED_SIZE];
        
        [_productNumberButton setTitle:productNumberStr forState:UIControlStateNormal];
        if([_delegate respondsToSelector:@selector(delNumberOnclick:andIndexRow:andSection:)]) {
            [_delegate delNumberOnclick:_product.PRODUCT_PRICE andIndexRow:(int)self.tag andSection:self.section];
        }
    }
}

- (IBAction)addNumberOnclick:(UIButton *)sender {
    
    long long maxSize = [_product.PRODUCT_STOCK_QTY longLongValue];
    
    // didselectIndex == 1002,表示入库退货，需要考虑库存。1004为其它入库，不需要考虑库存
    if(_product.CHOICED_SIZE < maxSize || _didselectIndex == 1004) {
        [self add];
    } else {
        if([_delegate respondsToSelector:@selector(noStockOfStockOutTableViewCell)]) {
            [_delegate noStockOfStockOutTableViewCell];
        }
    }
}


- (void)add {
    
    _product.CHOICED_SIZE ++;
    
    NSString *productNumberStr = [NSString stringWithFormat:@"%lld", _product.CHOICED_SIZE];
    
    [_productNumberButton setTitle:productNumberStr forState:UIControlStateNormal];
    
    if([_delegate respondsToSelector:@selector(addNumberOnclick:andIndexRow:andSection:)]) {
        
        [_delegate addNumberOnclick:_product.PRODUCT_PRICE andIndexRow:(int)self.tag andSection:self.section];
    }
}


- (IBAction)productNumberOnclick:(UIButton *)sender {
    
    long long selectedNumber = [[_productNumberButton titleForState:UIControlStateNormal] longLongValue];
    
    [self customize:selectedNumber];
}


- (void)customize:(long long)selectedNumber {
    
    if([_delegate respondsToSelector:@selector(productNumberOnclick:andIndexRow:andSelectedNumber:andSection:)]) {
        
        [_delegate productNumberOnclick:_product.PRODUCT_PRICE andIndexRow:(int)self.tag andSelectedNumber:selectedNumber andSection:self.section];
    }
}

@end
