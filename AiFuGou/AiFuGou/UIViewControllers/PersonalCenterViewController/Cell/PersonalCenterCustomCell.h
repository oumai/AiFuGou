//
//  PersonalCenterCustomCell.h
//  AiFuGou
//
//  Created by Michael on 16/6/7.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalCenterCustomCell : UITableViewCell
@property (nonatomic, strong) UIImageView  *iconImage;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel *priceLabel;

@end
