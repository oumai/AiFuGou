//
//  ChooseShoppingAddressCustomCell.h
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseShoppingAddressModel.h"

@interface ChooseShoppingAddressCustomCell : UITableViewCell
@property (nonatomic, copy) void(^setDefaultAddressBlock)();


@property (nonatomic, strong) NSString *nameString;
@property (nonatomic, strong) UIButton *chooseButton;
@property (nonatomic, strong) ChooseShoppingAddressModel *chooseModel;
@property (nonatomic, strong) TTTAttributedLabel    *nameLabel;

@end
