//
//  RegistVC.m
//  YiFu
//
//  Created by Michael on 16/3/16.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "RegistVC.h"

#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/Extend/SMSSDKCountryAndAreaCode.h>
#import <SMS_SDK/Extend/SMSSDK+DeprecatedMethods.h>
#import <SMS_SDK/Extend/SMSSDK+ExtexdMethods.h>
#import <MOBFoundation/MOBFoundation.h>
@interface RegistVC()
{
    BOOL yanZhengChengGong;  //验证码验证成功了只有一次
}
@property (nonatomic, strong) NSTimer               *timer;  /**倒计时timer**/
@property (nonatomic, assign) NSInteger             time;    //倒计时计数器
@property (nonatomic, strong) UIView                *whiteView;
@property (nonatomic, strong) UITextField           *numberTF1;
@property (nonatomic, strong) UITextField           *numberTF2;
@property (nonatomic, strong) UITextField           *numberTF3;
@property (nonatomic, strong) UIButton              *nextButton;
@property (nonatomic, strong) UIButton              *getCodeButton;
@property (nonatomic, strong) TTTAttributedLabel    *protocolLabel;
@property (nonatomic, strong) UIImageView           *checkImage;

@end
@implementation RegistVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"注册";
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
        k_yjHUD(@"请输入正确的手机号码", self.view);
    }
}
- (void)getVerificationCodeByMethod:(SMSGetCodeMethod)getCodeMethod phoneNumber:(NSString *)phoneNumber zone:(NSString *)zone
{
    
    __weak RegistVC *regViewController = self;
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
    if ([self.numberTF2.text length]!= 4) {
        k_yjHUD(@"请输入验证码", self.view);
        return;
    }
    if ([self.numberTF3.text length] <6) {
        k_yjHUD(@"请输入6位以上的密码", self.view);
        return;
    }
    yanZhengChengGong = NO;
    [SMSSDK commitVerificationCode:self.numberTF2.text phoneNumber:self.numberTF1.text zone:@"86" result:^(NSError *error)
     {
         
         if (!error) {
             
             NSLog(@"验证成功");
             yanZhengChengGong = YES;
         }
         else
         {
             if (yanZhengChengGong == NO) {
                 k_yjHUD(@"验证失败", self.view);
             }
         }
     }];
    if (yanZhengChengGong == YES) {
        [self requestData];
    }
   
}
- (void)requestData
{
    
       NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.user.add",
                           @"mobile":self.numberTF1.text,
                           @"userPass":self.numberTF3.text,
                           @"regist":self.numberTF3.text
                           };
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        
        NSLog(@"content = %@",content);
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            NSLog(@"++++++++++++++++++++++");
            
            if (self.popBlock) {
                self.popBlock(self.numberTF1.text);
            }
            [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            
            k_yjHUD([content objectForKey:@"msg"], self.view);
        }
        
    } errorBlock:^(NSError *error) {
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
    
    
     
    
    self.numberTF2 = [[UITextField alloc] init];
    self.numberTF2.placeholder = @"请您输入的验证码";
    self.numberTF2.font = KFontSize(14);
    self.numberTF2.textColor = DeepColor;
    self.numberTF2.keyboardType = UIKeyboardTypePhonePad;
    [self.whiteView addSubview:_numberTF2];
    
    
    
    self.numberTF1 = [[UITextField alloc] init];
    self.numberTF1.placeholder = @"请您输入手机号码";
    self.numberTF1.font = KFontSize(14);
    self.numberTF1.textColor = DeepColor;
    self.numberTF1.keyboardType = UIKeyboardTypePhonePad;
    [self.whiteView addSubview:_numberTF1];
    
    
  
    
    self.numberTF3 = [[UITextField alloc] init];
    self.numberTF3.placeholder = @"请您输入密码，至少6位数";
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
    
     
    self.protocolLabel = [TTTAttributedLabel new];
    self.protocolLabel.font = KFontSize(12);
    self.protocolLabel.textColor = DeepColor;
    [self.view addSubview:_protocolLabel];
    
  
     

    self.checkImage = [UIImageView new];
    self.checkImage.image = [UIImage imageNamed:@"register_check"];
    [self.view addSubview:_checkImage];
    
 
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextButton.layer.cornerRadius = 5;
    self.nextButton.layer.masksToBounds = YES;
    self.nextButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nextButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.nextButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#f24818")] forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextButton];
    
    
 
    [_whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(10+64);
        make.left.equalTo(self.view.mas_left).offset(5);
        make.right.equalTo(self.view.mas_right).offset(-5);
        make.height.equalTo(150);
    }];
    
    [_numberTF2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.whiteView.mas_centerY).offset(0);
        make.left.equalTo(self.whiteView.mas_left).offset(7);
        make.width.equalTo(CoreWidth-60);
        make.height.equalTo(30);
    }];
    
    
    [_numberTF1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.whiteView.mas_top).offset(25);
        make.left.equalTo(self.whiteView.mas_left).offset(7);
        make.width.equalTo(CoreWidth-60);
        make.height.equalTo(30);
    }];
    [_numberTF3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.whiteView.mas_bottom).offset(-25);
        make.left.equalTo(self.whiteView.mas_left).offset(7);
        make.width.equalTo(CoreWidth-60);
        make.height.equalTo(30);
    }];
    
    [_getCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.whiteView.mas_centerY).offset(0);
        make.right.equalTo(self.whiteView.mas_right).offset(-7);
        make.width.equalTo(80);
        make.height.equalTo(30);
    }];

    [_protocolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.whiteView.mas_bottom).offset(10);
        make.left.equalTo(self.whiteView.mas_left).offset(20);
        make.width.equalTo(100);
        make.height.equalTo(14);
    }];
    
    [self.protocolLabel setText:@"同意" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"《用户协议》"
                                                                   attributes:@{NSForegroundColorAttributeName : KHexColor(@"#f24818"),
                                                                                NSFontAttributeName:KFontSize(12)}];
        [mutableAttributedString appendAttributedString:yuan];
        return mutableAttributedString;
    }];
    [_checkImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.protocolLabel.mas_centerY).offset(0);
        make.right.equalTo(self.protocolLabel.mas_left).offset(-2);
        make.width.equalTo(10);
        make.height.equalTo(10);
    }];
    
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.whiteView.mas_bottom).offset(40);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth-40);
        make.height.equalTo(40);
    }];
}
/**
 *  倒计时计数器
 */
-(void)timeDown{
    if (self.time == 0)
    {
        [self.timer invalidate];
        self.timer = nil;
        self.getCodeButton.enabled = YES;
        [self.getCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    else
    {
        self.time--;
        self.getCodeButton.enabled = NO;
        [self.getCodeButton setTitle:[NSString stringWithFormat:@"%lds",(long)self.time] forState:UIControlStateNormal] ;
    }
}
@end
