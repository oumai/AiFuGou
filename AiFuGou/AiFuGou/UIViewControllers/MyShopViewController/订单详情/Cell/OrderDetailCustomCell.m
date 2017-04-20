//
//  OrderDetailCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "OrderDetailCustomCell.h"
@interface OrderDetailCustomCell()


@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *cellView;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel *titleBuyerMessageLabel;
@property (nonatomic, strong) TTTAttributedLabel *buyerMessageLabel;
@end


@implementation OrderDetailCustomCell
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
            make.bottom.equalTo(self.cellView.mas_bottom).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(0);
            make.height.equalTo(0.5);
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
        
        
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.font = KFontSize(14);
        self.detailLabel.textColor = LightColor;
        [self.contentView addSubview:_detailLabel];
        
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(-10);
            make.width.equalTo(self.detailLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.titleBuyerMessageLabel = [TTTAttributedLabel new];  //买家留言的 特殊的一行
        self.titleBuyerMessageLabel.font = KFontSize(14);
        self.titleBuyerMessageLabel.textColor = DeepColor;
        [self.cellView addSubview:_titleBuyerMessageLabel];
        
        
        [_titleBuyerMessageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.top.equalTo(self.cellView.mas_top).offset(10);
            make.width.equalTo(self.titleBuyerMessageLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        self.buyerMessageLabel = [TTTAttributedLabel new];
        self.buyerMessageLabel.font = KFontSize(14);
        self.buyerMessageLabel.textColor = LightColor;
        [self.cellView addSubview:_buyerMessageLabel];
        
        
        [_buyerMessageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cellView.mas_left).offset(30);
            make.bottom.equalTo(self.cellView.mas_bottom).offset(-5);
            make.width.equalTo(self.buyerMessageLabel.mas_width);
            make.height.equalTo(14);
        }];


       
    }
    return self;
}
- (void)setOrderModel:(OrderDetailModel *)orderModel
{
    if (nil == orderModel) {
        return;
    }
    
    self.titleLabel.text = orderModel.titleString;
    self.detailLabel.text = orderModel.detailString;
}
@end
