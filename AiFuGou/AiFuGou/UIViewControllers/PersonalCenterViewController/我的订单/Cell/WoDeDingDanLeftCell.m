//
//  WoDeDingDanLeftCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/12.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "WoDeDingDanLeftCell.h"
#import "Masonry.h"


@interface WoDeDingDanLeftCell()

@property (nonatomic, strong) UIView                *cellView;
@property (nonatomic, strong) UIView                *titleView;
@property (nonatomic, strong) UIImageView           *titleImage;
@property (nonatomic, strong) UILabel               *titleViewLabel;
@property (nonatomic, strong) UIImageView           *titleArrowImage;
@property (nonatomic, strong) UILabel               *titleDetailLabel;
@property (nonatomic, strong) UIView                *titleLine;

@property (nonatomic, strong) UIView                *detailView;
@property (nonatomic, strong) UIView                *line;
@property (nonatomic, strong) TTTAttributedLabel    *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel    *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel    *priceLabel;
@property (nonatomic, strong) TTTAttributedLabel    *numberLabel;
@property (nonatomic, strong) UIImageView           *iconImage;



@property (nonatomic, strong) UIView                *bottomView;
@property (nonatomic, strong) TTTAttributedLabel    *accountLabel;
@property (nonatomic, strong) TTTAttributedLabel    *sendLabel;
@property (nonatomic, strong) UIButton              *shouHuoButton;
@end
@implementation WoDeDingDanLeftCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor  = KHexColor(@"#ebebeb");
        
        self.cellView = [UIView new];
        self.cellView.layer.cornerRadius = 8;
        self.cellView.layer.masksToBounds = YES;
        self.cellView.backgroundColor = KHexColor(@"#ffffff");
        [self.contentView addSubview:_cellView];
        
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(7);
            make.left.equalTo(self.contentView.mas_left).offset(7);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-7);
            
        }];
        
        self.titleView = [UIView new];
        self.titleView.backgroundColor = KHexColor(@"#ffffff");
        [self.cellView addSubview:_titleView];
        
        
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellView.mas_top).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(0);
            make.height.equalTo(30);
        }];


        
        self.titleImage = [UIImageView new];
        self.titleImage.image = [UIImage imageNamed:@"ziliao_shanghuming"];
        [self.cellView addSubview:_titleImage];
        
        
        [_titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleView.mas_centerY).offset(0);
            make.left.equalTo(self.titleView.mas_left).offset(10);
            make.width.equalTo(14);
            make.height.equalTo(14);
        }];
        
        
        self.titleViewLabel = [TTTAttributedLabel new];
        self.titleViewLabel.font = KFontSize(14);
        self.titleViewLabel.textColor = LightColor;
        self.titleViewLabel.text = @"时尚手机外壳超市";
        [self.titleView addSubview:_titleViewLabel];
        
        
        [_titleViewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleView.mas_centerY).offset(0);
            make.left.equalTo(self.titleImage.mas_right).offset(10);
            make.width.equalTo(self.titleViewLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        self.titleArrowImage = [UIImageView new];
        self.titleArrowImage.image = [UIImage imageNamed:@"arrow_right"];
        [self.titleView addSubview:_titleArrowImage];
        
        
        [_titleArrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleView.mas_centerY).offset(0);
            make.left.equalTo(self.titleViewLabel.mas_right).offset(10);
            make.width.equalTo(7);
            make.height.equalTo(14);
        }];
        
        
        self.titleDetailLabel = [TTTAttributedLabel new];
        self.titleDetailLabel.font = KFontSize(14);
        self.titleDetailLabel.textColor = BackgroundColor;
        self.titleDetailLabel.text = @"已付款";
        [self.titleView addSubview:_titleDetailLabel];
        
        
        [_titleDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleView.mas_centerY).offset(0);
            make.right.equalTo(self.titleView.mas_right).offset(-10);
            make.width.equalTo(self.titleDetailLabel.mas_width);
            make.height.equalTo(14);
        }];

        
        self.titleLine = [UIView new];
        self.titleLine.backgroundColor = LineColor;
        [self.titleView addSubview:_titleLine];
        
        
        [_titleLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.titleView.mas_bottom).offset(0);
            make.left.equalTo(self.titleView.mas_left).offset(10);
            make.right.equalTo(self.titleView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        

        
        
        self.detailView = [UIView new];
        self.detailView.backgroundColor = KHexColor(@"#ffffff");
        [self.cellView addSubview:_detailView];
        
        
        [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLine.mas_bottom).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(0);
            make.height.equalTo(80);
        }];

        
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.detailView addSubview:_line];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.detailView.mas_bottom).offset(0);
            make.left.equalTo(self.detailView.mas_left).offset(10);
            make.right.equalTo(self.detailView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        
        
        
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"iconImage"];
        self.iconImage.layer.cornerRadius = 5;
        self.iconImage.layer.masksToBounds = YES;
        self.iconImage.backgroundColor = [UIColor lightGrayColor];
        [self.detailView addSubview:_iconImage];
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.detailView.mas_left).offset(10);
            make.centerY.equalTo(self.detailView.mas_centerY).offset(0);
            make.width.equalTo(60);
            make.height.equalTo(60);
        }];
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = DeepColor;
        self.titleLabel.text = @"iphone 6s 手机壳";
        [self.detailView addSubview:_titleLabel];
        
        
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
        [self.detailView addSubview:_detailLabel];
        
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(7);
            make.left.equalTo(self.iconImage.mas_right).offset(15);
            make.width.equalTo(self.detailLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.priceLabel = [TTTAttributedLabel new];
        self.priceLabel.font = KFontSize(14);
        self.priceLabel.textColor = BackgroundColor;
        [self.detailView addSubview:_priceLabel];
        
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImage.mas_top).offset(0);
            make.right.equalTo(self.detailView.mas_right).offset(-10);
            make.width.equalTo(self.priceLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.numberLabel = [TTTAttributedLabel new];
        self.numberLabel.font = KFontSize(14);
        self.numberLabel.textColor = BackgroundColor;
        self.numberLabel.text = @"x1";
        [self.detailView addSubview:_numberLabel];
        
        
        [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconImage.mas_bottom).offset(-5);
            make.right.equalTo(self.detailView.mas_right).offset(-15);
            make.width.equalTo(self.numberLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        
        [self.priceLabel setText:@"¥" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            
            NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"125."
                                                                       attributes:@{NSForegroundColorAttributeName : BackgroundColor,
                                                                                    NSFontAttributeName:KFontSize(12)}];
            [mutableAttributedString appendAttributedString:yuan];
            return mutableAttributedString;
        }];
        
        self.bottomView = [UIView new];
        self.bottomView.backgroundColor = KHexColor(@"#ffffff");
        [self.cellView addSubview:_bottomView];
        
        
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.line.mas_bottom).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(0);
            make.bottom.equalTo(self.cellView.mas_bottom).offset(0);
        }];
        
        
        self.sendLabel = [TTTAttributedLabel new];
        self.sendLabel.font = KFontSize(14);
        self.sendLabel.textColor = LightColor;
        [self.bottomView addSubview:_sendLabel];
        
        
        [_sendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottomView.mas_top).offset(5);
            make.right.equalTo(self.detailView.mas_right).offset(-10);
            make.width.equalTo(self.sendLabel.mas_width);
            make.height.equalTo(14);
        }];
        [self.sendLabel setText:@"含运费" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            
            NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"(¥0.0)"
                                                                       attributes:@{NSForegroundColorAttributeName : BackgroundColor,
                                                                                    NSFontAttributeName:KFontSize(12)}];
            [mutableAttributedString appendAttributedString:yuan];
            return mutableAttributedString;
        }];

        
        self.accountLabel = [TTTAttributedLabel new];
        self.accountLabel.font = KFontSize(14);
        self.accountLabel.textColor = LightColor;
        [self.bottomView addSubview:_accountLabel];
        
        
        [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottomView.mas_top).offset(5);
            make.right.equalTo(self.sendLabel.mas_left).offset(-10);
            make.width.equalTo(self.accountLabel.mas_width);
            make.height.equalTo(14);
        }];
        [self.accountLabel setText:@"共一件商品: 合计" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            
            NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"¥ 125.0"
                                                                       attributes:@{NSForegroundColorAttributeName : BackgroundColor,
                                                                                    NSFontAttributeName:KFontSize(12)}];
            [mutableAttributedString appendAttributedString:yuan];
            return mutableAttributedString;
        }];


        self.shouHuoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.shouHuoButton.layer.cornerRadius = 5;
        self.shouHuoButton.layer.masksToBounds = YES;
        self.shouHuoButton.titleLabel.font = KFontSize(12);
        [self.shouHuoButton setTitle:@"已收货" forState:UIControlStateNormal];
        [self.shouHuoButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
        [self.shouHuoButton setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
//        [self.shouHuoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomView addSubview:_shouHuoButton];
        
        [_shouHuoButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bottomView.mas_bottom).offset(-5);
            make.right.equalTo(self.bottomView.mas_right).offset(-10);
            make.width.equalTo(50);
            make.height.equalTo(20);
        }];
        
    }
    return self;
}
@end
