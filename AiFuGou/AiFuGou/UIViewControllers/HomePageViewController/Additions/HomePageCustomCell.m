//
//  HomePageCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/4.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*------------------------------------------------------------------------------V----------------------------------------------------------------------------*/
#import "HomePageCustomCell.h"
@interface HomePageCustomCell()

@property (nonatomic, strong) UIView                *line;
@property (nonatomic, strong) TTTAttributedLabel    *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel    *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel    *priceLabel;
@property (nonatomic, strong) UIImageView           *iconImage;
@end
@implementation HomePageCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
   
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor  = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.contentView addSubview:_line];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-1);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        
        
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"iconImage"];
        self.iconImage.layer.cornerRadius = 5;
        self.iconImage.layer.masksToBounds = YES;
        self.iconImage.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_iconImage];
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(00);
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
        [self.contentView addSubview:_priceLabel];
        
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconImage.mas_bottom).offset(-5);
            make.left.equalTo(self.iconImage.mas_right).offset(15);
            make.width.equalTo(self.priceLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        [self.priceLabel setText:@"¥" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            
            NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"125."
                                                                       attributes:@{NSForegroundColorAttributeName : BackgroundColor,
                                                                                    NSFontAttributeName:KFontSize(12)}];
            [mutableAttributedString appendAttributedString:yuan];
            return mutableAttributedString;
        }];
        
    }
    return self;
}
@end
