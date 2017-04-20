//
//  ShopCartCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/7.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "ShopCartCustomCell.h"
@interface ShopCartCustomCell()

@property (nonatomic, strong) UIView                *line;
@property (nonatomic, strong) TTTAttributedLabel    *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel    *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel    *priceLabel;
@property (nonatomic, strong) TTTAttributedLabel    *numberLabel;
@property (nonatomic, strong) UIImageView           *iconImage;
@property (nonatomic, strong) UIImageView           *circleImage;
@end
@implementation ShopCartCustomCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor  = [UIColor whiteColor];
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.contentView addSubview:_line];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        
        self.circleImage = [UIImageView new];
        self.circleImage.image = [UIImage imageNamed:@"huiyuanhou"];
        [self.contentView addSubview:_circleImage];
        
        [_circleImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(5);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.width.equalTo(9);
            make.height.equalTo(9);
        }];

        
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"iconImage"];
        self.iconImage.layer.cornerRadius = 5;
        self.iconImage.layer.masksToBounds = YES;
        self.iconImage.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_iconImage];
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.circleImage.mas_right).offset(5);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.width.equalTo(60);
            make.height.equalTo(60);
        }];
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = DeepColor;
        self.titleLabel.text = @"iphone 6s 手机壳";
        [self.contentView addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImage.mas_top).offset(0);
            make.left.equalTo(self.iconImage.mas_right).offset(15);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.font = KFontSize(14);
        self.detailLabel.textColor = LightColor;
        self.detailLabel.text = @"iphone 6s 手机壳保护外壳防摔";
        [self.contentView addSubview:_detailLabel];
        
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(7);
            make.left.equalTo(self.iconImage.mas_right).offset(15);
            make.width.equalTo(self.detailLabel.mas_width);
            make.height.equalTo(14);
        }];
        self.priceLabel = [TTTAttributedLabel new];
        self.priceLabel.font = KFontSize(14);
        self.priceLabel.textColor = BackgroundColor;
        self.priceLabel.text = @" 125.";
        [self.contentView addSubview:_priceLabel];
        
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconImage.mas_bottom).offset(-5);
            make.left.equalTo(self.iconImage.mas_right).offset(15);
            make.width.equalTo(self.priceLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.numberLabel = [TTTAttributedLabel new];
        self.numberLabel.font = KFontSize(14);
        self.numberLabel.textColor = BackgroundColor;
        self.numberLabel.text = @"x1";
        [self.contentView addSubview:_numberLabel];
        
        
        [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconImage.mas_bottom).offset(-5);
            make.right.equalTo(self.contentView.mas_right).offset(-15);
            make.width.equalTo(self.numberLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
    }
    return self;
}
- (void)setShopModel:(ShopCartModel *)shopModel
{
    self.titleLabel.text = shopModel.postTitle;
    self.detailLabel.text = shopModel.postContent;
    self.numberLabel.text = [NSString stringWithFormat:@"¥ %d",shopModel.num];
    self.priceLabel.text = [NSString stringWithFormat:@"%d",shopModel.price];
}
@end
