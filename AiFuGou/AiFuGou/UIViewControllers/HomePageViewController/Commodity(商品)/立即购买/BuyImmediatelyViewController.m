//
//  BuyImmediatelyViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/13.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "BuyImmediatelyViewController.h"
#import "Masonry.h"
@interface BuyImmediatelyViewController ()
@property (nonatomic, strong) UIView                *bgView;
@property (nonatomic, strong) UIImageView           *iconImage;
@property (nonatomic, strong) UIButton              *closeButton;
@property (nonatomic, strong) UILabel               *priceLabel;


@property (nonatomic, strong) UIView                *thirdView;
@property (nonatomic, strong) TTTAttributedLabel    *titleShuLiangLabelT;
@property (nonatomic, strong) TTTAttributedLabel    *shuLiangLabelT;
@property (nonatomic, strong) UIButton              *reduceButtonT;
@property (nonatomic, strong) UIButton              *addButtonT;
@property (nonatomic, strong) UIView                *LineT;
@property (nonatomic, strong) UIButton              *button;

@end

@implementation BuyImmediatelyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    
    
    self.bgView = [UIView new];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.frame = CGRectMake(0, 30, CoreWidth, 240-30);
    [self.view addSubview:_bgView];
    
    
    self.iconImage = [UIImageView new];
    self.iconImage.layer.cornerRadius = 5;
    self.iconImage.layer.masksToBounds = YES;
    self.iconImage.image = [UIImage imageNamed:@"iconImage"];
    self.iconImage.backgroundColor = [UIColor whiteColor];
    self.iconImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_iconImage];
    
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.width.equalTo(100);
        make.height.equalTo(100);
    }];
    
    self.priceLabel = [TTTAttributedLabel new];
    self.priceLabel.font = KFontSize(14);
    self.priceLabel.textColor = BackgroundColor;
    self.priceLabel.textAlignment = NSTextAlignmentCenter;
    self.priceLabel.text = @"¥ 125.0";
    [self.bgView addSubview:_priceLabel];
    
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImage.mas_centerY).offset(0);
        make.left.equalTo(self.iconImage.mas_right).offset(10);
        make.width.equalTo(60);
        make.height.equalTo(20);
    }];

    
    self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeButton setImage:[UIImage imageNamed:@"iconfont-cha28-28"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeButtonTClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:_closeButton];
    
    [_closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(5);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
    
    self.LineT = [UIView new];
    self.LineT.backgroundColor = LineColor;
    [self.bgView addSubview:_LineT];
    
    [_LineT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImage.mas_bottom).offset(10);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(0);
        make.height.equalTo(0.5);
    }];
    
    
    self.thirdView = [UIView new];
    self.thirdView.backgroundColor = KHexColor(@"#ffffff");
    [self.view addSubview:_thirdView];
    
    
    
    [_thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.LineT.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(7);
        make.right.equalTo(self.view.mas_right).offset(-7);
        make.height.equalTo(40);
        
    }];
    
    
    
    self.titleShuLiangLabelT = [TTTAttributedLabel new];
    self.titleShuLiangLabelT.font = KFontSize(14);
    self.titleShuLiangLabelT.textColor = DeepColor;
    self.titleShuLiangLabelT.text = @"购买数量";
    [self.thirdView addSubview:_titleShuLiangLabelT];
    
    
    [_titleShuLiangLabelT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdView.mas_centerY).offset(0);
        make.left.equalTo(self.thirdView.mas_left).offset(10);
        make.width.equalTo(self.titleShuLiangLabelT.mas_width);
        make.height.equalTo(14);
    }];
    
    
    
    self.addButtonT = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButtonT setImage:[UIImage imageNamed:@"shangpin_add"] forState:UIControlStateNormal];
    [self.addButtonT addTarget:self action:@selector(addButtonTClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdView addSubview:_addButtonT];
    
    [_addButtonT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdView.mas_centerY).offset(0);
        make.right.equalTo(self.thirdView.mas_right).offset(-10);
        make.width.equalTo(20);
        make.height.equalTo(20);
    }];
    
    
    
    self.shuLiangLabelT = [TTTAttributedLabel new];
    self.shuLiangLabelT.font = KFontSize(14);
    self.shuLiangLabelT.textColor = DeepColor;
    self.shuLiangLabelT.layer.cornerRadius = 10;
    self.shuLiangLabelT.layer.masksToBounds = YES;
    self.shuLiangLabelT.layer.borderWidth = 1;
    self.shuLiangLabelT.layer.borderColor = LightColor.CGColor;
    self.shuLiangLabelT.textAlignment = NSTextAlignmentCenter;
    self.shuLiangLabelT.text = @"10";
    [self.thirdView addSubview:_shuLiangLabelT];
    
    
    [_shuLiangLabelT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdView.mas_centerY).offset(0);
        make.right.equalTo(self.addButtonT.mas_left).offset(-8);
        make.width.equalTo(60);
        make.height.equalTo(20);
    }];
    
    
    self.reduceButtonT = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.reduceButtonT setImage:[UIImage imageNamed:@"shangPin_reduce"] forState:UIControlStateNormal];
    [self.reduceButtonT addTarget:self action:@selector(reduceButtonTClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdView addSubview:_reduceButtonT];
    
    
    [_reduceButtonT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdView.mas_centerY).offset(0);
        make.right.equalTo(self.shuLiangLabelT.mas_left).offset(-8);
        make.width.equalTo(20);
        make.height.equalTo(20);
    }];
    
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    self.button.layer.borderWidth = 1;
    self.button.layer.borderColor = BackgroundColor.CGColor;
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    [self.button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:_button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.thirdView.mas_bottom).offset(10);
        make.left.equalTo(self.thirdView.mas_left).offset(40);
        make.width.equalTo(CoreWidth-80);
        make.height.equalTo(40);
    }];
}
- (void)buttonClick:(UIButton *)button
{
    if (self.dismissSimanPopoverViewController) {
        self.dismissSimanPopoverViewController(self);
    }
    
    if (self.sureButtonClick) {
        self.sureButtonClick(self);
    }

}
- (void)reduceButtonTClick:(UIButton *)button
{
    
}
- (void)addButtonTClick:(UIButton *)button
{
    
}
- (void)closeButtonTClick:(UIButton *)button
{
 
    if (self.dismissSimanPopoverViewController) {
        self.dismissSimanPopoverViewController(self);
    }
}
@end
