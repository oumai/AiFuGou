//
//  RegistVC.m
//  YiFu
//
//  Created by Michael on 16/3/16.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "FindPasswordVC.h"
#import "ResetPasswordVC.h"

#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/Extend/SMSSDKCountryAndAreaCode.h>
#import <SMS_SDK/Extend/SMSSDK+DeprecatedMethods.h>
#import <SMS_SDK/Extend/SMSSDK+ExtexdMethods.h>
#import <MOBFoundation/MOBFoundation.h>
@interface FindPasswordVC()
@property (nonatomic, strong) NSTimer               *timer;  /**倒计时timer**/
@property (nonatomic, assign) NSInteger             time;    //倒计时计数器
@property (nonatomic, strong) UIView                *whiteView;
@property (nonatomic, strong) UITextField           *numberTF1;
@property (nonatomic, strong) UITextField           *numberTF3;
@property (nonatomic, strong) UIButton              *nextButton;
@property (nonatomic, strong) UIButton              *getCodeButton;
@end@implementation FindPasswordVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"找回密码";
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
    [self makeUI];
}
- (void)getCodeButtonClick:(UIButton *)button
{
    
    [self getCode];
}
- (void)getCode
{
    
    if (self.numberTF1.text.length == 11) {
        [self getVerificationCodeByMethod:self.getCodeMethod phoneNumber:self.numberTF1.text zone:@"86"];
        self.time = 60;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeDown) userInfo:nil repeats:YES];
    }
    else
    {
        k_yjHUD(@"请输入11位手机号码", self.view);
    }
}
/**
 *  倒计时计数器
 */
-(void)timeDown{
    if (self.time == 0)
    {
        [self.timer invalidate];
        self.timer = nil;
        [self.getCodeButton addTarget:self action:@selector(getCodeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.getCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    else
    {
        self.time--;
        self.getCodeButton.enabled = NO;
        [self.getCodeButton setTitle:[NSString stringWithFormat:@"%lds",(long)self.time] forState:UIControlStateNormal] ;
    }
}
- (void)getVerificationCodeByMethod:(SMSGetCodeMethod)getCodeMethod phoneNumber:(NSString *)phoneNumber zone:(NSString *)zone
{
    __weak FindPasswordVC *regViewController = self;
    
    if (getCodeMethod == SMSGetCodeMethodSMS) {
        
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:phoneNumber
                                       zone:zone
                           customIdentifier:nil
                                     result:^(NSError *error)
         {
             [regViewController getVerificationCodeResultHandler:phoneNumber zone:zone error:error];
         }];
        
    }
    else if (getCodeMethod == SMSGetCodeMethodVoice)
    {
        
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodVoice phoneNumber:phoneNumber
                                       zone:zone
                           customIdentifier:nil
                                     result:^(NSError *error)
         {
             [regViewController getVerificationCodeResultHandler:phoneNumber zone:zone error:error];
         }];
    }
}
- (void)getVerificationCodeResultHandler:(NSString *)phoneNumber zone:(NSString *)zone error:(NSError *)error
{
    
    self.getCodeButton.enabled = YES;
    if (!error)
    {
        if (self.getCodeMethod == SMSGetCodeMethodSMS)
        {
            NSLog(@"文本短信验证码发送成功");
            k_yjHUD(@"验证码已发送", self.view);
          
        }
        else
        {
            NSLog(@"语音短信验证码发送成功");
        }
    }
    
}

- (void)nextButtonClick:(UIButton *)button
{
    
    
    if (self.numberTF1.text.length != 11){
        k_yjHUD(@"请输入正确的手机号码", self.view);
        return;
    }
    if ([self.numberTF3.text length]!= 4) {
        k_yjHUD(@"请输入验证码", self.view);
        return;
    }
      
    [SMSSDK commitVerificationCode:self.numberTF3.text phoneNumber:self.numberTF1.text zone:@"86" result:^(NSError *error)
     {
         
         if (!error) {
             NSLog(@"验证成功");
             ResetPasswordVC *vc = [ResetPasswordVC new];
             vc.phoneString = self.numberTF1.text;
             [self.navigationController pushViewController:vc animated:YES];
         }
         else
         {
             NSLog(@"验证失败");
             k_yjHUD(@"验证失败", self.view);
         }
     }];
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
    self.numberTF1.placeholder = @"请您输入手机号码";
    self.numberTF1.font = KFontSize(14);
    self.numberTF1.textColor = DeepColor;
    self.numberTF1.keyboardType = UIKeyboardTypePhonePad;
    [self.whiteView addSubview:_numberTF1];
    
    
    
    
    self.numberTF3 = [[UITextField alloc] init];
    self.numberTF3.placeholder = @"请您的短信验证码";
    self.numberTF3.font = KFontSize(14);
    self.numberTF3.textColor = DeepColor;
    self.numberTF3.keyboardType = UIKeyboardTypePhonePad;
    [self.whiteView addSubview:_numberTF3];
    
    
    
    self.getCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.getCodeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.getCodeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.getCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.getCodeButton setTitleColor:KHexColor(@"#f24818") forState:UIControlStateNormal];
    [self.getCodeButton addTarget:self action:@selector(getCodeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_getCodeButton];
    
    
    
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextButton.layer.cornerRadius = 5;
    self.nextButton.layer.masksToBounds = YES;
    self.nextButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nextButton setTitle:@"下一步" forState:UIControlStateNormal];
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
    
    [_getCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.whiteView.mas_bottom).offset(-25);
        make.right.equalTo(self.whiteView.mas_right).offset(-7);
        make.width.equalTo(80);
        make.height.equalTo(30);
    }];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.whiteView.mas_bottom).offset(40);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth-40);
        make.height.equalTo(40);
    }];
    
}
@end
