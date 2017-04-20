//
//  ClassificationCustomCell.m
//  AiFuGou
//
//  Created by 刘祥 on 16/6/5.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "ClassificationCustomCell.h"
@interface ClassificationCustomCell()
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *verticalLine;
@end

@implementation ClassificationCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
  

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        self.backgroundColor = KHexColor(@"#ffffff");
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.contentView addSubview:_line];
        
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
            
        }];
        
        self.verticalLine = [UIView new];
        self.verticalLine.backgroundColor = LineColor;
        [self.contentView addSubview:_verticalLine];
        
        
        [_verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.width.equalTo(0.5);

        }];

        
        self.label = [UILabel new];
        self.label.font = KFontSize(14);
        self.label.textColor = LightColor;
        [self.contentView addSubview:_label];
        
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.width.equalTo(self.label.mas_width);
            make.height.equalTo(14);
        }];

    }
    return self;
}
- (void)setClassModel:(ClassificationModel *)classModel
{
    self.label.text = classModel.name;
}
@end
