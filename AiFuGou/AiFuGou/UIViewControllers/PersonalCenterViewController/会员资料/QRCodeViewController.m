//
//  QRCodeViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/8.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "QRCodeViewController.h"
#import "Masonry.h"
@interface QRCodeViewController ()

@property (nonatomic, strong) UIView *whiteView;
@property (nonatomic, strong) UIImageView *erWeiMaBgImage;
@property (nonatomic, strong) UIImageView *erWeiMaImage;

@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) UIImageView *headerImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *huiYuanLabel;
@end

@implementation QRCodeViewController


- (void)rightImageClick
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"二维码名片";
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    
    [self setRightItemImage:@"iconfont-fenxiang"];
    self.whiteView = [UIView new];
    self.whiteView.backgroundColor = KHexColor(@"#ffffff");
    [self.view addSubview:_whiteView];
    
    
    [_whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(30);
        make.width.equalTo(CoreWidth);
        make.height.equalTo(CoreWidth);
    }];
    

    
    self.erWeiMaBgImage = [UIImageView new];
    self.erWeiMaBgImage.image = [UIImage imageNamed:@"erweima"];
    [self.whiteView addSubview:_erWeiMaBgImage];
    
    
    [_erWeiMaBgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.whiteView.mas_centerX).offset(0);
        make.centerY.equalTo(self.whiteView.mas_centerY).offset(0);
        make.width.equalTo(CoreWidth);
        make.height.equalTo(CoreWidth);
    }];
    
    self.erWeiMaImage = [UIImageView new];
    self.erWeiMaImage.image = [UIImage imageNamed:@""];
    self.erWeiMaImage.backgroundColor = [UIColor whiteColor];
    self.erWeiMaImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.whiteView addSubview:_erWeiMaImage];
    
    
    [_erWeiMaImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.whiteView.mas_centerX).offset(0);
        make.centerY.equalTo(self.whiteView.mas_centerY).offset(0);
        make.width.equalTo(CoreWidth/2);
        make.height.equalTo(CoreWidth/2);
    }];

    
    self.firstView = [UIView new];
    self.firstView.backgroundColor = KHexColor(@"#ebebeb");
    [self.view addSubview:_firstView];
    
    
    
    [_firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.bottom.equalTo(self.whiteView.mas_top).offset(0);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth);
    }];

    
    self.headerImage = [UIImageView new];
    self.headerImage.image = [UIImage imageNamed:@""];
    self.headerImage.contentMode = UIViewContentModeScaleAspectFit;
    self.headerImage.backgroundColor = [UIColor lightGrayColor];
    [self.firstView addSubview:_headerImage];
    
    
    [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.firstView.mas_centerX).offset(-40);
        make.centerY.equalTo(self.firstView.mas_centerY).offset(0);
        make.width.equalTo(60);
        make.height.equalTo(60);
    }];

    
    self.nameLabel = [TTTAttributedLabel new];
    self.nameLabel.font = KFontSize(14);
    self.nameLabel.textColor = DeepColor;
    self.nameLabel.text = @"王大锤";
    [self.firstView addSubview:_nameLabel];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerImage.mas_top).offset(10);
        make.left.equalTo(self.headerImage.mas_right).offset(10);
        make.width.equalTo(self.nameLabel.mas_width);
        make.height.equalTo(14);
    }];

    
    self.huiYuanLabel = [TTTAttributedLabel new];
    self.huiYuanLabel.font = KFontSize(14);
    self.huiYuanLabel.textColor = LightColor;
    self.huiYuanLabel.text = @"高级会员";
    [self.view addSubview:_huiYuanLabel];
    
    [_huiYuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headerImage.mas_bottom).offset(-10);
        make.left.equalTo(self.headerImage.mas_right).offset(10);
        make.width.equalTo(self.huiYuanLabel.mas_width);
        make.height.equalTo(14);
    }];
}
@end
