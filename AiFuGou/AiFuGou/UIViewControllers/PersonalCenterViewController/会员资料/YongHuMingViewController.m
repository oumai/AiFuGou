//
//  YongHuMingViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/8.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "YongHuMingViewController.h"
#import "Masonry.h"
@interface YongHuMingViewController ()
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIView *cellView;
@property (nonatomic, strong) UIButton *button;
@end

@implementation YongHuMingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"用户名";
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.cellView = [UIView new];
    self.cellView.layer.cornerRadius = 5;
    self.cellView.layer.masksToBounds = YES;
    self.cellView.backgroundColor = KHexColor(@"#ffffff");
    [self.view addSubview:_cellView];
    
    
    [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64+10);
        make.left.equalTo(self.view.mas_left).offset(7);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.equalTo(50);
        
    }];
    self.titleLabel = [TTTAttributedLabel new];
    self.titleLabel.font = KFontSize(14);
    self.titleLabel.textColor = DeepColor;
    self.titleLabel.text = @"用户名:";
    [self.view addSubview:_titleLabel];
    
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
        make.left.equalTo(self.cellView.mas_left).offset(10);
        make.width.equalTo(self.titleLabel.mas_width);
        make.height.equalTo(18);
    }];
    
    
    self.textField = [UITextField new];
    self.textField.textColor = KHexColor(@"ff0000");
    self.textField.placeholder = @"请填写用户名";
    self.textField.textAlignment = NSTextAlignmentLeft;
    self.textField.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_textField];
    
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
        make.left.equalTo(self.titleLabel.mas_right).offset(10);
        make.width.equalTo(CoreWidth/2);
        make.height.equalTo(30);
    }];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    self.button.layer.borderWidth = 1;
    self.button.layer.borderColor = KHexColor(@"#ff8787").CGColor;
    [self.button setTitle:@"保存" forState:UIControlStateNormal];
    [self.button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellView.mas_bottom).offset(20);
        make.centerX.equalTo(self.cellView.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*2/3);
        make.height.equalTo(40);
    }];
}
- (void)buttonClick:(UIButton *)button
{
    
}@end
