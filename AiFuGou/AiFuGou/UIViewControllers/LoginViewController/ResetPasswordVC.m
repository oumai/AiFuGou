//
//  RegistVC.m
//  YiFu
//
//  Created by Michael on 16/3/16.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "ResetPasswordVC.h"
@interface ResetPasswordVC()
@property (nonatomic, strong) UIView                *whiteView;
@property (nonatomic, strong) UITextField           *numberTF1;
@property (nonatomic, strong) UITextField           *numberTF3;
@property (nonatomic, strong) UIButton              *nextButton;
@end@implementation ResetPasswordVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"重置密码";
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
    [self makeUI];
}
- (void)nextButtonClick:(UIButton *)button
{
    [self requestData];
}
- (void)requestData
{
    
    if ([self.numberTF1.text isEqualToString:self.numberTF3.text]) {
        NSDictionary * dic = @{@"appKey":@"00001",
                               @"v":@"1.0",
                               @"format": @"json",
                               @"method":@"rop.user.resetpassword",
                               @"mobile":self.phoneString,
                               @"userPass":self.numberTF3.text};
        [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
            
            NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
            
            if ([[content objectForKey:@"result"] integerValue] == 1) {
                NSLog(@"++++++++++++++++++++++");
                
            }
        } errorBlock:^(NSError *error) {
        }];
    }
    else
    {
        k_yjHUD(@"两次密码不一致", self.view);
    }
  
}

- (void)tapClick
{
    [self.view endEditing:YES];
}
- (void)makeUI
{
    self.whiteView = [UIView new];
    self.whiteView.backgroundColor = [UIColor whiteColor];
    self.whiteView.layer.cornerRadius = 5;
    self.whiteView.layer.masksToBounds = YES;
    [self.view addSubview:_whiteView];
    
    
    
    self.numberTF1 = [[UITextField alloc] init];
    self.numberTF1.placeholder = @"输入新密码";
    self.numberTF1.font = KFontSize(14);
    self.numberTF1.textColor = DeepColor;
    self.numberTF1.keyboardType = UIKeyboardTypePhonePad;
    [self.whiteView addSubview:_numberTF1];
    
    
    
    self.numberTF3 = [[UITextField alloc] init];
    self.numberTF3.placeholder = @"请再次输入新密码";
    self.numberTF3.font = KFontSize(14);
    self.numberTF3.textColor = DeepColor;
    self.numberTF3.keyboardType = UIKeyboardTypePhonePad;
    [self.whiteView addSubview:_numberTF3];
    
    
    
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextButton.layer.cornerRadius = 5;
    self.nextButton.layer.masksToBounds = YES;
    self.nextButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nextButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.nextButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#f24818")] forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextButton];
    
    
    
    [_whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(10+64);
        make.left.equalTo(self.view.mas_left).offset(5);
        make.right.equalTo(self.view.mas_right).offset(-5);
        make.height.equalTo(100);
    }];
    
    
    
    [_numberTF1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.whiteView.mas_top).offset(25);
        make.left.equalTo(self.whiteView.mas_left).offset(7);
        make.width.equalTo(CoreWidth-60);
        make.height.equalTo(15);
    }];
    [_numberTF3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.whiteView.mas_bottom).offset(-25);
        make.left.equalTo(self.whiteView.mas_left).offset(7);
        make.width.equalTo(CoreWidth-60);
        make.height.equalTo(15);
    }];
    
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.whiteView.mas_bottom).offset(40);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth-40);
        make.height.equalTo(40);
    }];
    
}
@end
