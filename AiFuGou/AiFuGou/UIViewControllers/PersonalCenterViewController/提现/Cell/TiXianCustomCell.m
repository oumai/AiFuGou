//
//  TiXianCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/12.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "TiXianCustomCell.h"
#import "Masonry.h"
@interface  TiXianCustomCell()

@property (nonatomic, strong) UIImageView  *iconImage;
@property (nonatomic, strong) UIView *cellView;
@property (nonatomic, strong) UIImageView  *arrowImage;

@end


@implementation TiXianCustomCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = KHexColor(@"#ebebeb");
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.cellView = [UIView new];
        self.cellView.layer.cornerRadius = 5;
        self.cellView.layer.masksToBounds = YES;
        self.cellView.backgroundColor = KHexColor(@"#ffffff");
        [self.contentView addSubview:_cellView];
        
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(7);
            make.left.equalTo(self.contentView.mas_left).offset(7);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-7);
            make.right.equalTo(self.contentView.mas_right).offset(-7);
            
        }];
        
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"iconImage"];
        [self.cellView addSubview:_iconImage];
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
            make.width.equalTo(50);
            make.height.equalTo(50);
        }];
        
        
        self.arrowImage = [UIImageView new];
        self.arrowImage.image = [UIImage imageNamed:@"arrow_right"];
        [self.cellView addSubview:_arrowImage];
        
        [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.cellView.mas_right).offset(-10);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.width.equalTo(7);
            make.height.equalTo(14);
        }];
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = DeepColor;
        self.titleLabel.text = @"农商银行";
        [self.cellView addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImage.mas_top).offset(0);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(18);
        }];
        
        self.priceLabel = [TTTAttributedLabel new];
        self.priceLabel.font = KFontSize(14);
        self.priceLabel.textColor = LightColor;
        self.priceLabel.text = [NSString stringWithFormat:@"尾号%@  快捷",@"3213"];
        [self.cellView addSubview:_priceLabel];
        
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconImage.mas_bottom).offset(0);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(self.priceLabel.mas_width);
            make.height.equalTo(18);
        }];
        
    }
    return self;
}

@end
