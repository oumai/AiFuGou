//
//  ChooseShoppingAddressCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "ChooseShoppingAddressCustomCell.h"
#import "Masonry.h"

@interface ChooseShoppingAddressCustomCell()




@property (nonatomic, strong) UIView                *cellView;  ///第一个view
@property (nonatomic, strong) UIView                *line;
@property (nonatomic, strong) TTTAttributedLabel    *shouHuoRenLabel;
@property (nonatomic, strong) TTTAttributedLabel    *phoneLabel;
@property (nonatomic, strong) TTTAttributedLabel    *addressLabel;
@end


@implementation ChooseShoppingAddressCustomCell


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
            make.left.equalTo(self.contentView.mas_left).offset(5);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-5);
            
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
        

        
        self.shouHuoRenLabel = [TTTAttributedLabel new];
        self.shouHuoRenLabel.font = KFontSize(14);
        self.shouHuoRenLabel.textColor = DeepColor;
        self.shouHuoRenLabel.text = @"收货人:";
        [self.cellView addSubview:_shouHuoRenLabel];
        
        
        [_shouHuoRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellView.mas_top).offset(10);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(self.shouHuoRenLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.nameLabel = [TTTAttributedLabel new];
        self.nameLabel.font = KFontSize(14);
        self.nameLabel.textColor = LightColor;
        [self.cellView addSubview:_nameLabel];
        
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellView.mas_top).offset(10);
            make.left.equalTo(self.shouHuoRenLabel.mas_right).offset(5);
            make.width.equalTo(self.nameLabel.mas_width);
            make.height.equalTo(14);
        }];

        
        
        self.phoneLabel = [TTTAttributedLabel new];
        self.phoneLabel.font = KFontSize(14);
        self.phoneLabel.textColor = LightColor;
        self.phoneLabel.text = @"13888888888";
        [self.cellView addSubview:_phoneLabel];
        
        
        [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellView.mas_top).offset(10);
            make.right.equalTo(self.cellView.mas_right).offset(-30);
            make.width.equalTo(self.phoneLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.addressLabel = [TTTAttributedLabel new];
        self.addressLabel.font = KFontSize(12);
        self.addressLabel.textColor = LightColor;
        self.addressLabel.numberOfLines = 0;
        self.addressLabel.lineSpacing = 5;
        self.addressLabel.text = @"池塘边的榕树上还有知了深深叫着 夏，啦啦啦啦啦了  安居客放假";
        [self.cellView addSubview:_addressLabel];
        
        
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.phoneLabel.mas_bottom).offset(5);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.right.equalTo(self.cellView.mas_right).offset(-30);
            make.height.equalTo(40);
        }];
        
        
        
        self.chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.chooseButton setImage:[UIImage imageNamed:@"address_meixuanzhong"] forState:UIControlStateNormal];
        [self.chooseButton addTarget:self action:@selector(chooseButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.cellView addSubview:_chooseButton];
        
        [_chooseButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.cellView.mas_right).offset(0);
            make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
            make.width.equalTo(30);
            make.height.equalTo(30);
        }];

    }
    return self;
}
- (void)setNameString:(NSString *)nameString
{
   
}
- (void)chooseButtonClick
{
    if (self.setDefaultAddressBlock) {
        self.setDefaultAddressBlock();
    }
}
- (void)setChooseModel:(ChooseShoppingAddressModel *)chooseModel
{
    if (nil == chooseModel) {
        return;
    }
    self.nameLabel.text = chooseModel.name;
    self.phoneLabel.text = chooseModel.phone;
    self.addressLabel.text = [NSString stringWithFormat:@"%@%@%@%@",chooseModel.province,chooseModel.city,chooseModel.area,chooseModel.street];
    
    
    if ([chooseModel.status integerValue] == 0) {
        [self.chooseButton setImage:[UIImage imageNamed:@"address_xuanzhong"] forState:UIControlStateNormal];
    }
    else
    {
        [self.chooseButton setImage:[UIImage imageNamed:@"address_meixuanzhong"] forState:UIControlStateNormal];
    }
}
@end
