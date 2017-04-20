//
//  PaySuccessedCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/13.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "PaySuccessedCustomCell.h"


@interface PaySuccessedCustomCell()
@property (nonatomic, strong) UIView       *cellView;
@property (nonatomic, strong) UIView       *line;
@property (nonatomic, strong) UIButton     *lookOrderButton;
@property (nonatomic, strong) UIButton     *backHomePageButton;
@end
@implementation PaySuccessedCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)lookOrderButtonClick
{
    
}
- (void)backHomePageButtonClick
{
    if (self.backHomePageBlock) {
        self.backHomePageBlock();
    }
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor  = KHexColor(@"#ebebeb");
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
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
        

        
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.cellView addSubview:_line];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        
        
           
        self.shouHuoRenLabel = [TTTAttributedLabel new];
        self.shouHuoRenLabel.font = KFontSize(14);
        self.shouHuoRenLabel.textColor = DeepColor;
        [self.cellView addSubview:_shouHuoRenLabel];
        
        
        [_shouHuoRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellView.mas_top).offset(10);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(self.shouHuoRenLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [self.shouHuoRenLabel setText:@"收货人:" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            
            NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"戈壁"
                                                                       attributes:@{NSForegroundColorAttributeName : LightColor,
                                                                                    NSFontAttributeName:KFontSize(14)}];
            [mutableAttributedString appendAttributedString:yuan];
            return mutableAttributedString;
        }];
        
        
        self.addressLabel = [TTTAttributedLabel new];
        self.addressLabel.font = KFontSize(12);
        self.addressLabel.textColor = DeepColor;
        self.addressLabel.numberOfLines = 0;
        self.addressLabel.lineSpacing = 5;
        [self.cellView addSubview:_addressLabel];
        
        
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.shouHuoRenLabel.mas_bottom).offset(5);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.right.equalTo(self.cellView.mas_right).offset(-20);
            make.height.equalTo(40);
        }];

        [self.addressLabel setText:@"收货地址:" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            
            NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"池塘边的榕树上还有知了深深叫着 夏，啦啦啦啦啦了  安居客放假"
                                                                       attributes:@{NSForegroundColorAttributeName : LightColor,
                                                                                    NSFontAttributeName:KFontSize(12)}];
            [mutableAttributedString appendAttributedString:yuan];
            return mutableAttributedString;
        }];
        
        self.accountLabel = [TTTAttributedLabel new];
        self.accountLabel.font = KFontSize(14);
        self.accountLabel.textColor = LightColor;
        [self.cellView addSubview:_accountLabel];
        
        
        [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.line.mas_bottom).offset(10);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(self.accountLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [self.accountLabel setText:@"合计" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            
            NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"¥ 125.0"
                                                                       attributes:@{NSForegroundColorAttributeName : BackgroundColor,
                                                                                    NSFontAttributeName:KFontSize(12)}];
            [mutableAttributedString appendAttributedString:yuan];
            return mutableAttributedString;
        }];

        
        
        self.lookOrderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.lookOrderButton.layer.cornerRadius = 5;
        self.lookOrderButton.layer.masksToBounds = YES;
        self.lookOrderButton.layer.borderWidth = 1;
        self.lookOrderButton.layer.borderColor = LineColor.CGColor;
        self.lookOrderButton.titleLabel.font = KFontSize(14);
        [self.lookOrderButton setTitle:@"查看订单" forState:UIControlStateNormal];
        [self.lookOrderButton setTitleColor:LightColor forState:UIControlStateNormal];
        [self.lookOrderButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
        [self.lookOrderButton addTarget:self action:@selector(lookOrderButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.cellView addSubview:_lookOrderButton];
        
        [_lookOrderButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.cellView.mas_bottom).offset(-5);
            make.left.equalTo(self.cellView.mas_left).offset(40);
            make.width.equalTo(100);
            make.height.equalTo(30);
        }];
        
        
        self.backHomePageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.backHomePageButton.layer.cornerRadius = 5;
        self.backHomePageButton.layer.masksToBounds = YES;
        self.backHomePageButton.layer.borderWidth = 1;
        self.backHomePageButton.layer.borderColor = LineColor.CGColor;
        self.backHomePageButton.titleLabel.font = KFontSize(14);
        [self.backHomePageButton setTitle:@"返回首页" forState:UIControlStateNormal];
        [self.backHomePageButton setTitleColor:LightColor forState:UIControlStateNormal];
        [self.backHomePageButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
        [self.backHomePageButton addTarget:self action:@selector(backHomePageButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.cellView addSubview:_backHomePageButton];
        
        [_backHomePageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.cellView.mas_bottom).offset(-5);
            make.right.equalTo(self.cellView.mas_right).offset(-40);
            make.width.equalTo(100);
            make.height.equalTo(30);
        }];


        
    }
    return self;
}
@end
