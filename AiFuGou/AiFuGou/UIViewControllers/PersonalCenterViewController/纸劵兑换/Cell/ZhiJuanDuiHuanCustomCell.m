//
//  ZhiJuanDuiHuanCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/12.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "ZhiJuanDuiHuanCustomCell.h"
@interface  ZhiJuanDuiHuanCustomCell()

@property (nonatomic, strong) UIView *cellView;
@end


@implementation ZhiJuanDuiHuanCustomCell


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
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-7);
            
        }];
        
        self.iconImage = [UIImageView new];
        [self.cellView addSubview:_iconImage];
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
            make.width.equalTo(15);
            make.height.equalTo(12.5);
        }];
        
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = DeepColor;
        [self.cellView addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(18);
        }];
        
        
        
        self.textField = [UITextField new];
        self.textField.textColor = BackgroundColor;
        self.textField.font = KFontSize(14);
        [self.cellView addSubview:self.textField];
        
        
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
            make.left.equalTo(self.titleLabel.mas_right).offset(10);
            make.width.equalTo(200);
            make.height.equalTo(30);
        }];
        
        
    }
    return self;
}

@end
