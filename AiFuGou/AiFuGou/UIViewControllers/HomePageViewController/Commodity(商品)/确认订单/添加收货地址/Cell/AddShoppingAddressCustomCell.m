//
//  AddShoppingAddressCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "AddShoppingAddressCustomCell.h"

@interface AddShoppingAddressCustomCell()


@property (nonatomic, strong) UIView            *line;
@property (nonatomic, strong) UIView            *cellView;
@property (nonatomic, strong) UIImageView       *arrowImage;

@end


@implementation AddShoppingAddressCustomCell
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
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"iconImage"];
        [self.contentView addSubview:_iconImage];
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.width.equalTo(15);
            make.height.equalTo(12.5);
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
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(50);
            make.height.equalTo(18);
        }];
        
        
        
//        self.detailTextField = [UITextField new];
//        self.detailTextField.font = KFontSize(14);
//        self.detailTextField.textColor = LightColor;
//        self.detailTextField.tag = 100;
//        [self.contentView addSubview:_detailTextField];
//        
//        
//        [_detailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
//            make.left.equalTo(self.titleLabel.mas_right).offset(10);
//            make.right.equalTo(self.arrowImage.mas_left).offset(-10);
//            make.height.equalTo(14);
//        }];
        
        
      
             
    }
    return self;
}
@end
