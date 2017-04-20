//
//  LoginViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/1.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "LoginViewController.h"
#import "Masonry.h"
#import "RegistVC.h"
#import "FindPasswordVC.h"

@interface LoginViewController()
{
    UserInfoModel *user;
}

@property (nonatomic, strong) UIImageView           *aiFuGouLogImage;
@property (nonatomic, strong) UIView                *line;
@property (nonatomic, strong) UIView                *line2;
@property (nonatomic, strong) UIImageView           *numberImage;
@property (nonatomic, strong) UIImageView           *passwordImage;
@property (nonatomic, strong) UITextField           *setUpNumberTF;
@property (nonatomic, strong) UITextField           *setUpPasswordTF;
@property (nonatomic, strong) UIButton              *nextButton;
@property (nonatomic, strong) UIButton              *registerButton;
@property (nonatomic, strong) UIButton              *findPassWordButton;
@property (nonatomic, strong) TTTAttributedLabel    *socialLabel;
//@property (nonatomic, strong) UIView                *leftLine;
//@property (nonatomic, strong) UIView                *rightLine;
@property (nonatomic, strong) UICollectionView      *collectionView;
@end
@implementation LoginViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark ------------------------------------------------------------------Actions Buttons-------------------------------------------------
- (void)nextButtonClick:(UIButton *)button
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:JumpWindow object:nil userInfo:nil];
    //[self requestData];

}
- (void)requestData
{
    
    if (self.setUpNumberTF.text.length != 11) {
        k_yjHUD(@"请输入正确的手机号码", self.view);
        return;
    }
    if ([self.setUpPasswordTF.text length] <6) {
        k_yjHUD(@"请输入6位以上的密码", self.view);
        return;
    }
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.user.login",
                           @"login":self.setUpNumberTF.text,
                           @"userPass":self.setUpPasswordTF.text};
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            
            NSArray *dataArr = [[content objectForKey:@"data"] objectForKey:@"info"];
            user = [[UserInfoModel alloc] initWithDictionary:dataArr[0]];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:loginUserDefault];
            [[NSNotificationCenter defaultCenter] postNotificationName:JumpWindow object:nil userInfo:nil];
        }
    } errorBlock:^(NSError *error) {
    }];
}
- (void)registerButtonClick:(UIButton *)button
{
    RegistVC *re = [RegistVC new];
    [re setPopBlock:^(NSString *phoneString) {
        
        self.setUpNumberTF.text = phoneString;
    }];
    [self.navigationController pushViewController:re animated:YES];
}
- (void)findPassWordButtonClick:(UIButton *)button
{
    FindPasswordVC *find = [FindPasswordVC new];
    [self.navigationController pushViewController:find animated:YES];
}
- (void)tapClick
{
    [self.view endEditing:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    user = [UserInfoModel new];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
    [self makeUI];
    
    
}
- (void)makeUI
{
    
    self.aiFuGouLogImage = [UIImageView new];
    self.aiFuGouLogImage.image = [UIImage imageNamed:@"login_phoneNumber"];
    self.aiFuGouLogImage.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_aiFuGouLogImage];
    
    self.socialLabel = [TTTAttributedLabel new];
    self.socialLabel.textColor = LightColor;
    self.socialLabel.font = KFontSize(14);
    self.socialLabel.text = @"爱福购商城";
    [self.view addSubview:_socialLabel];
    

    
    self.line = [UIView new];
    self.line.backgroundColor = KHexColor(@"#b3b3b3");
    self.line.frame = CGRectMake(CoreWidth/6, 210, CoreWidth*2/3, 0.5);
    [self.view addSubview:_line];
    
    self.line2 = [UIView new];
    self.line2.backgroundColor = KHexColor(@"#b3b3b3");
    self.line2.frame = CGRectMake(CoreWidth/6, 260, CoreWidth*2/3, 0.5);
    [self.view addSubview:_line2];
    
    
    
    self.setUpNumberTF = [[UITextField alloc] init];
    self.setUpNumberTF.placeholder = @"请输入您的手机号码";
    self.setUpNumberTF.font = KFontSize(14);
    self.setUpNumberTF.textColor = DeepColor;
    self.setUpNumberTF.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:_setUpNumberTF];
    
    self.setUpPasswordTF = [[UITextField alloc] init];
    self.setUpPasswordTF.placeholder = @"请输入您的密码";
    self.setUpPasswordTF.font = KFontSize(14);
    self.setUpPasswordTF.textColor = DeepColor;
    [self.view addSubview:_setUpPasswordTF];
    
    
    
    self.numberImage = [UIImageView new];
    self.numberImage.image = [UIImage imageNamed:@"login_user"];
    [self.view addSubview:_numberImage];
    
    
    
    self.passwordImage = [UIImageView new];
    self.passwordImage.image = [UIImage imageNamed:@"login_password"];
    [self.view addSubview:_passwordImage];
    
    
    
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registerButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.registerButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerButton setImage:[UIImage imageNamed:@"login_register"] forState:UIControlStateNormal];
    [self.registerButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [self.registerButton setTitleColor:LightColor forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextButton.layer.cornerRadius = 5;
    self.nextButton.layer.masksToBounds = YES;
    self.nextButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nextButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.nextButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#f24818")] forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextButton];
    
    
    
    self.findPassWordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.findPassWordButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.findPassWordButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.findPassWordButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [self.findPassWordButton setImage:[UIImage imageNamed:@"login_findpassword"] forState:UIControlStateNormal];
    [self.findPassWordButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [self.findPassWordButton setTitleColor:LightColor forState:UIControlStateNormal];
    [self.findPassWordButton addTarget:self action:@selector(findPassWordButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_findPassWordButton];
    
    
    
    
    [_aiFuGouLogImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(40);
        make.height.equalTo(40);
    }];
    
    
    [_socialLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.aiFuGouLogImage.mas_bottom).offset(5);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(self.socialLabel.mas_width);
        make.height.equalTo(14);
    }];

    
    
    [_setUpNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.line.mas_bottom).offset(-5);
        make.left.equalTo(self.line.mas_left).offset(20);
        make.right.equalTo(self.line.mas_right).offset(0);
        make.height.equalTo(30);
    }];
    
    
    [_setUpPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.line2.mas_bottom).offset(-5);
        make.left.equalTo(self.line2.mas_left).offset(20);
        make.right.equalTo(self.line2.mas_right).offset(0);
        make.height.equalTo(30);
    }];
    [_numberImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.setUpNumberTF.mas_centerY).offset(0);
        make.left.equalTo(self.line.mas_left).offset(0);
        make.width.equalTo(12);
        make.height.equalTo(15);
    }];
    [_passwordImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.setUpPasswordTF.mas_centerY).offset(0);
        make.left.equalTo(self.line2.mas_left).offset(0);
        make.width.equalTo(12);
        make.height.equalTo(15);
    }];
    
    
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line2.mas_bottom).offset(5);
        make.left.equalTo(self.nextButton.mas_left).offset(0);
        make.width.equalTo(40);
        make.height.equalTo(30);
    }];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.registerButton.mas_bottom).offset(20);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*2/3);
        make.height.equalTo(30);
    }];

    
    [_findPassWordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line2.mas_bottom).offset(5);
        make.right.equalTo(self.nextButton.mas_right).offset(5);
        make.width.equalTo(80);
        make.height.equalTo(30);
    }];
    
        
}
@end
