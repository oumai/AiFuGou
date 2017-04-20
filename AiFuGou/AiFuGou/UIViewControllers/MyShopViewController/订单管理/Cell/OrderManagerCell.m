//
//  OrderManagerCell.m
//  AiFuGou
//
//  Created by 刘祥 on 16/6/6.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "OrderManagerCell.h"

@interface OrderManagerCell()

@property (nonatomic, strong) TTTAttributedLabel *circleLabel;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel *statusLabel;
@property (nonatomic, strong) TTTAttributedLabel *priceLabel;
@property (nonatomic, strong) UIView *line;


@property (nonatomic, strong) UIView *cellView;


@end

@implementation OrderManagerCell

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
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = KHexColor(@"#ebebeb");
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.cellView = [UIView new];
        self.cellView.backgroundColor = KHexColor(@"#ffffff");
        [self.contentView addSubview:_cellView];
        
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(7);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-7);
            
        }];
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.contentView addSubview:_line];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-1);
            make.left.equalTo(self.cellView.mas_left).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];

        
        
        self.circleLabel = [TTTAttributedLabel new];
        self.circleLabel.layer.cornerRadius = 25;
        self.circleLabel.layer.masksToBounds = YES;
        self.circleLabel.layer.borderWidth = 0.5;
        self.circleLabel.layer.borderColor = LineColor.CGColor;
        self.circleLabel.backgroundColor = KHexColor(@"#ffffff");
        self.circleLabel.font = KFontSize(14);
        self.circleLabel.textAlignment = NSTextAlignmentCenter;
        self.circleLabel.text = @"09:30";
        [self.contentView addSubview:_circleLabel];
        
        
        [_circleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(7);
            make.width.equalTo(50);
            make.height.equalTo(50);
            
        }];
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(18);
        self.titleLabel.textColor = DeepColor;
        self.titleLabel.text = @"商品名称";
        [self.contentView addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.circleLabel.mas_top).offset(0);
            make.left.equalTo(self.circleLabel.mas_right).offset(10);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(18);
        }];
        
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.font = KFontSize(12);
        self.detailLabel.textColor = LightColor;
        self.detailLabel.text = [NSString stringWithFormat:@"订单号：%@",@"1388888888888"];
        [self.contentView addSubview:_detailLabel];
        
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.circleLabel.mas_bottom).offset(0);
            make.left.equalTo(self.circleLabel.mas_right).offset(10);
            make.width.equalTo(self.detailLabel.mas_width);
            make.height.equalTo(12);
        }];

        self.statusLabel = [TTTAttributedLabel new];
        self.statusLabel.font = KFontSize(14);
        self.statusLabel.textColor = LightColor;
        self.statusLabel.text = @"交易完成";
        [self.contentView addSubview:_statusLabel];
        
        
        [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.circleLabel.mas_top).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.width.equalTo(self.statusLabel.mas_width);
            make.height.equalTo(18);
        }];

        
        self.priceLabel = [TTTAttributedLabel new];
        self.priceLabel.font = KFontSize(14);
        self.priceLabel.textColor = BackgroundColor;
        self.priceLabel.text = @"100.00";
        [self.contentView addSubview:_priceLabel];
        
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.circleLabel.mas_bottom).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.width.equalTo(self.priceLabel.mas_width);
            make.height.equalTo(18);
        }];

      
    }
    return self;
}

@end
