//
//  KeDuiHuanJiFenCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/8.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "KeDuiHuanJiFenCustomCell.h"
#import "Masonry.h"
@interface KeDuiHuanJiFenCustomCell()
@property (nonatomic, strong) UIView *line;
@end


@implementation KeDuiHuanJiFenCustomCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = KHexColor(@"#ffffff");
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.contentView addSubview:_line];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        
        
        
        self.fistLabel = [TTTAttributedLabel new];
        self.fistLabel.font = KFontSize(14);
        self.fistLabel.textColor = DeepColor;
        self.fistLabel.text = @"返还积分总额";
        [self.contentView addSubview:_fistLabel];
        
        
        [_fistLabel mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.top.equalTo(self.contentView.mas_top).offset(7);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.width.equalTo(self.fistLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.secondLabel = [TTTAttributedLabel new];
        self.secondLabel.font = KFontSize(14);
        self.secondLabel.textColor = LightColor;
        self.secondLabel.text = @"消费积分转换成兑换积分";
        [self.contentView addSubview:_secondLabel];
        
        
        [_secondLabel mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.top.equalTo(self.contentView.mas_top).offset(7);
             make.right.equalTo(self.contentView.mas_right).offset(-10);
             make.width.equalTo(self.secondLabel.mas_width);
             make.height.equalTo(14);
         }];
        
        self.thirdLabel = [TTTAttributedLabel new];
        self.thirdLabel.font = KFontSize(14);
        self.thirdLabel.textColor = LightColor;
        self.thirdLabel.text = @"2016-06-06";
        [self.contentView addSubview:_thirdLabel];
        
        
        [_thirdLabel mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.bottom.equalTo(self.contentView.mas_bottom).offset(-7);
             make.left.equalTo(self.contentView.mas_left).offset(10);
             make.width.equalTo(self.thirdLabel.mas_width);
             make.height.equalTo(14);
         }];

        
        self.fouthLabel = [TTTAttributedLabel new];
        self.fouthLabel.font = KFontSize(14);
        self.fouthLabel.textColor = BackgroundColor;
        self.fouthLabel.text = @"+200";
        [self.contentView addSubview:_fouthLabel];
        
        
        [_fouthLabel mas_makeConstraints:^(MASConstraintMaker *make)
        {
             make.bottom.equalTo(self.contentView.mas_bottom).offset(-7);
             make.right.equalTo(self.contentView.mas_right).offset(-10);
             make.width.equalTo(self.fouthLabel.mas_width);
             make.height.equalTo(14);
         }];
        
        
    }
    return self;
}

@end
