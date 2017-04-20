//
//  AboutUsCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/12.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "AboutUsCustomCell.h"
#import "Masonry.h"
@interface AboutUsCustomCell()

@property (nonatomic, strong) UIView        *cellView;
@property (nonatomic, strong) UIView        *line;
@property (nonatomic, strong) UILabel       *label;
@property (nonatomic, strong) UIButton      *firstButton;
@property (nonatomic, strong) UIButton      *secondButton;
@property (nonatomic, strong) UIButton      *thirdButton;
@property (nonatomic, strong) UIButton      *fouthButton;
@end

@implementation AboutUsCustomCell
- (void)awakeFromNib {
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = KHexColor(@"#ebebeb");
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        self.cellView = [UIView new];
        self.cellView.backgroundColor = KHexColor(@"#ffffff");
        [self.contentView addSubview:_cellView];
        
        
               
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.cellView addSubview:_line];
        
        
        self.label = [TTTAttributedLabel new];
        self.label.font = KFontSize(14);
        self.label.textColor = DeepColor;
        self.label.text = @"公司简介";
        [self.contentView addSubview:_label];
        
              
        
        self.firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.firstButton.titleLabel.font = KFontSize(12);
        [self.firstButton setTitle:@"2016-01-24" forState:UIControlStateNormal];
        [self.firstButton setTitleColor:LightColor forState:UIControlStateNormal];
        [self.firstButton setImage:[UIImage imageNamed:@"about_time"] forState:UIControlStateNormal];
        [self.firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
        [self.cellView addSubview:_firstButton];
        
        
        
              
        self.fouthButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.fouthButton.titleLabel.font = KFontSize(12);
        [self.fouthButton setTitle:@"233" forState:UIControlStateNormal];
        [self.fouthButton setTitleColor:LightColor forState:UIControlStateNormal];
        [self.fouthButton setImage:[UIImage imageNamed:@"about_time"] forState:UIControlStateNormal];
        [self.fouthButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
        [self.cellView addSubview:_fouthButton];
        
             
        
        self.secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.secondButton.titleLabel.font = KFontSize(12);
        [self.secondButton setTitle:@"帮助中心" forState:UIControlStateNormal];
        [self.secondButton setTitleColor:LightColor forState:UIControlStateNormal];
        [self.secondButton setImage:[UIImage imageNamed:@"about_time"] forState:UIControlStateNormal];
        [self.secondButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
        [self.cellView addSubview:_secondButton];
        
        
              
        
        self.thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.thirdButton.titleLabel.font = KFontSize(12);
        [self.thirdButton setTitle:@"299999" forState:UIControlStateNormal];
        [self.thirdButton setTitleColor:LightColor forState:UIControlStateNormal];
        [self.thirdButton setImage:[UIImage imageNamed:@"about_time"] forState:UIControlStateNormal];
        [self.thirdButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
        [self.cellView addSubview:_thirdButton];
        
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(7);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-7);
        }];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.cellView.mas_bottom).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellView.mas_top).offset(5);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(self.label.mas_width);
            make.height.equalTo(14);
        }];
        [_firstButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.cellView.mas_bottom).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(80);
            make.height.equalTo(20);
        }];
        
        [_fouthButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.cellView.mas_bottom).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(-5);
            make.width.equalTo(50);
            make.height.equalTo(20);
        }];
        [_secondButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.cellView.mas_bottom).offset(0);
            make.centerX.equalTo(self.cellView.mas_centerX).offset(-15);
            make.width.equalTo(70);
            make.height.equalTo(20);
        }];
        [_thirdButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.cellView.mas_bottom).offset(0);
            make.centerX.equalTo(self.cellView.mas_centerX).offset(60);
            make.width.equalTo(60);
            make.height.equalTo(20);
        }];

    }
    return self;
}
- (void)setAboutModel:(AboutUsModel *)aboutModel
{
    if (nil == aboutModel) {
        return;
    }
}
@end
