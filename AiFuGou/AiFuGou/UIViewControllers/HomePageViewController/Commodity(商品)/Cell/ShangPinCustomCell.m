//
//  ShangPinCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/12.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "ShangPinCustomCell.h"
#import "Masonry.h"

@interface ShangPinCustomCell()


@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *cellView;
@property (nonatomic, strong) UIImageView  *arrowImage;

@end


@implementation ShangPinCustomCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = KHexColor(@"#ebebeb");
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.cellView = [UIView new];
        self.cellView.backgroundColor = KHexColor(@"#ffffff");
        [self.contentView addSubview:_cellView];
        
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            
        }];
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.contentView addSubview:_line];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        
        
        self.arrowImage = [UIImageView new];
        self.arrowImage.image = [UIImage imageNamed:@"arrow_right"];
        [self.contentView addSubview:_arrowImage];
        
        [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.cellView.mas_right).offset(-10);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.width.equalTo(7);
            make.height.equalTo(14);
        }];
        
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = DeepColor;
        [self.contentView addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(18);
        }];
        
        
        
        
    }
    return self;
}

@end
