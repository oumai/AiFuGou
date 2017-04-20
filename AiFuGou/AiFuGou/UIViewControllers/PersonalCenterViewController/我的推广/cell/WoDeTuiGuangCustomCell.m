//
//  WoDeTuiGuangCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/8.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "WoDeTuiGuangCustomCell.h"

@interface WoDeTuiGuangCustomCell ()
@property (nonatomic, strong) TTTAttributedLabel *yongHuMingLabel;
@property (nonatomic, strong) TTTAttributedLabel *jiBiewLabel;
@property (nonatomic, strong) TTTAttributedLabel *timeLabel;
@property (nonatomic, strong) TTTAttributedLabel *shouJiHaoLabel;

@end
@implementation WoDeTuiGuangCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.yongHuMingLabel = [TTTAttributedLabel new];
        self.yongHuMingLabel.textColor = DeepColor;
        self.yongHuMingLabel.font = KFontSize(14);
        self.yongHuMingLabel.text = @"习近平";
        [self.contentView addSubview:_yongHuMingLabel];
        
        
        [_yongHuMingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(15);
            make.width.equalTo(60);
            make.height.equalTo(14);
        }];
        
        
        self.jiBiewLabel = [TTTAttributedLabel new];
        self.jiBiewLabel.textColor = BackgroundColor;
        self.jiBiewLabel.font = KFontSize(14);
        self.jiBiewLabel.text = @"终极会员";
        [self.contentView addSubview:_jiBiewLabel];
        
        
        [_jiBiewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(-50);
            make.width.equalTo(self.jiBiewLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.timeLabel = [TTTAttributedLabel new];
        self.timeLabel.textColor = DeepColor;
        self.timeLabel.font = KFontSize(12);
        self.timeLabel.text = @"2015-05-05";
        [self.contentView addSubview:_timeLabel];
        
        
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(30);
            make.width.equalTo(self.timeLabel.mas_width);
            make.height.equalTo(12);
        }];
        
        
        self.shouJiHaoLabel = [TTTAttributedLabel new];
        self.shouJiHaoLabel.textColor = DeepColor;
        self.shouJiHaoLabel.font = KFontSize(12);
        self.shouJiHaoLabel.text = @"13971355748";
        [self.contentView addSubview:_shouJiHaoLabel];
        
        
        [_shouJiHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_right).offset(-40);
            make.width.equalTo(self.shouJiHaoLabel.mas_width);
            make.height.equalTo(12);
        }];

    }
    return self;
}
- (void)setTuiGuangModel:(WoDeTuiGuangModel *)tuiGuangModel
{
    if (nil == tuiGuangModel) {
        return;
    }
    self.yongHuMingLabel.text = tuiGuangModel.user_nicename;
    self.jiBiewLabel.text = tuiGuangModel.type;
    self.timeLabel.text = tuiGuangModel.create_time;
    self.shouJiHaoLabel.text = tuiGuangModel.mobile;
}
@end
