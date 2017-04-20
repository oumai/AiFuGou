//
//  QueRenOrderViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/12.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "QueRenOrderViewController.h"
#import "PayDetailViewController.h"
#import "WYPopoverController.h"
#import "PayDetailViewController.h"

#import "PaySuccessedViewController.h"//支付成功
#import "ChooseShoppingAddressVC.h"
@interface QueRenOrderViewController ()<WYPopoverControllerDelegate>

@property (nonatomic , strong) WYPopoverController *simanPopoverController;

@property (nonatomic, strong) UIView                *firstView;  ///第一个view
@property (nonatomic, strong) TTTAttributedLabel    *shouHuoRenLabel;
@property (nonatomic, strong) TTTAttributedLabel    *phoneLabel;
@property (nonatomic, strong) TTTAttributedLabel    *addressLabel;
@property (nonatomic, strong) UIImageView           *iconImage;
@property (nonatomic, strong) UIImageView           *arrowImage;

@property (nonatomic, strong) UIView                *secondView;


@property (nonatomic, strong) UIView                *titleViewS;///第二个View
@property (nonatomic, strong) UIImageView           *titleImageS;
@property (nonatomic, strong) TTTAttributedLabel    *titleLabelS;
@property (nonatomic, strong) UIView                *titleLineS;

@property (nonatomic, strong) UIView                *cellViewS;
@property (nonatomic, strong) TTTAttributedLabel    *titleLabels;
@property (nonatomic, strong) TTTAttributedLabel    *detailLabelS;
@property (nonatomic, strong) TTTAttributedLabel    *priceLabelS;
@property (nonatomic, strong) TTTAttributedLabel    *numberLabelS;
@property (nonatomic, strong) UIImageView           *iconImageS;

@property (nonatomic, strong) UIView                *thirdView;  ///第三个View
@property (nonatomic, strong) TTTAttributedLabel    *titleShuLiangLabelT;
@property (nonatomic, strong) TTTAttributedLabel    *shuLiangLabelT;
@property (nonatomic, strong) TTTAttributedLabel    *titlePeiSongLabelT;
@property (nonatomic, strong) TTTAttributedLabel    *peiSongLabelT;
@property (nonatomic, strong) UIImageView           *arrowImageT;
@property (nonatomic, strong) UIButton              *reduceButtonT;
@property (nonatomic, strong) UIButton              *addButtonT;
@property (nonatomic, strong) UIView                *LineT;


@property (nonatomic, strong) UIView                *fouthView;///第四个View
@property (nonatomic, strong) TTTAttributedLabel    *titleLiuYanLabelF;
@property (nonatomic, strong) UITextField           *liuYanTextFieldF;
@property (nonatomic, strong) TTTAttributedLabel    *zongGongJiJianLabel;
@property (nonatomic, strong) UIView                *LineF;


@property (nonatomic, strong) UIView                *bottomView;///底部View
@property (nonatomic, strong) UIButton              *sureButtonB;
@property (nonatomic, strong) TTTAttributedLabel    *heJiLabelB;

@end

@implementation QueRenOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"确认订单";
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    [self layoutFirstViewUI];
    [self layoutSecondViewUI];
    [self layoutFouthViewUI];
    [self layoutThirdViewUI];
    [self layoutBottomViewUI];
}
#pragma mark ------------------------------------------------------------------ActionsButtonClick-------------------------------------------------
- (void) reduceButtonTClick:(UIButton *)button
{
    
}
- (void) addButtonTClick:(UIButton *)button
{
    
}
//选择收货地址
- (void)tapClick
{
    ChooseShoppingAddressVC *vc = [ChooseShoppingAddressVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void) sureButtonB:(UIButton *)button
{
    PayDetailViewController *simanPopoverViewController = [PayDetailViewController new];//初始化弹框
    simanPopoverViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width ,self.view.frame.size.height);//设置弹框的大小
    
    //弹框消失。
    [simanPopoverViewController setDismissSimanPopoverViewController:^(PayDetailViewController *viewController) {
        [self.simanPopoverController dismissPopoverAnimated:YES completion:^{
            [self popoverControllerDidDismissPopover:_simanPopoverController];
        }];
    }];
    
    
    [simanPopoverViewController setPushPaySuccessedBlock:^{
        
        PaySuccessedViewController *add = [PaySuccessedViewController new];
        [self.navigationController pushViewController:add animated:YES];

    }];
    
    self.simanPopoverController = [[WYPopoverController alloc] initWithContentViewController:simanPopoverViewController];
    self.simanPopoverController.delegate = self;
    self.simanPopoverController.animationDuration = .5f;
    self.simanPopoverController.passthroughViews = @[button];
    self.simanPopoverController.popoverLayoutMargins = UIEdgeInsetsMake(CoreHeight-360, 0,0,0);
    self.simanPopoverController.wantsDefaultContentAppearance = NO;
    
    //设置弹框的主题风格
    WYPopoverTheme *result = [[WYPopoverTheme alloc] init];
    result.usesRoundedArrow = YES;
    result.dimsBackgroundViewsTintColor = YES;
    result.tintColor = nil;
    result.outerStrokeColor = [UIColor clearColor];
    result.innerStrokeColor = [UIColor clearColor];
    result.fillTopColor = nil;
    result.fillBottomColor = nil;
    result.glossShadowColor = nil;
    result.glossShadowOffset = CGSizeZero;
    result.glossShadowBlurRadius = 0;
    result.borderWidth = 0;
    result.arrowBase = 15;
    result.arrowHeight = 6;
    result.outerShadowColor = [UIColor clearColor];
    result.outerShadowBlurRadius = 0;
    result.outerShadowOffset = CGSizeZero;
    result.outerCornerRadius = 5;
    result.minOuterCornerRadius = 0;
    result.innerShadowColor = [UIColor clearColor];
    result.innerShadowBlurRadius = 0;
    result.innerShadowOffset = CGSizeZero;
    result.innerCornerRadius = 0;
    result.viewContentInsets = UIEdgeInsetsZero;
    result.overlayColor = [UIColor colorWithWhite:0 alpha:0.3];
    result.preferredAlpha = 1.0f;
    self.simanPopoverController.theme = result;
    
    //    [self.simanPopoverController presentPopoverFromRect:button.bounds
    //                                            inView:button
    //                          permittedArrowDirections:WYPopoverArrowDirectionNone//设置弹出的方式（枚举）
    //                                          animated:YES
    //                                           options:WYPopoverAnimationOptionFadeWithScale];
    
    [_simanPopoverController presentPopoverAsDialogAnimated:YES
                                                    options:WYPopoverAnimationOptionFadeWithScale];
}
- (void)layoutBottomViewUI
{
    self.bottomView = [UIView new];
    self.bottomView.backgroundColor = KHexColor(@"#ffffff");
    [self.view addSubview:_bottomView];
    
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.equalTo(40);
    }];
    
    self.sureButtonB = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sureButtonB setTitle:@"确认" forState:UIControlStateNormal];
    [self.sureButtonB setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.sureButtonB setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.sureButtonB addTarget:self action:@selector(sureButtonB:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:_sureButtonB];
    
    [_sureButtonB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomView.mas_top).offset(0);
        make.right.equalTo(self.bottomView.mas_right).offset(0);
        make.width.equalTo(80);
        make.height.equalTo(40);
    }];

    self.heJiLabelB = [TTTAttributedLabel new];
    self.heJiLabelB.font = KFontSize(14);
    self.heJiLabelB.textColor = DeepColor;
    [self.bottomView addSubview:_heJiLabelB];
    
    
    [_heJiLabelB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView.mas_centerY).offset(0);
        make.right.equalTo(self.sureButtonB.mas_left).offset(-10);
        make.width.equalTo(self.heJiLabelB.mas_width);
        make.height.equalTo(14);
    }];
    
    
    
    [self.heJiLabelB setText:[NSString stringWithFormat:@"合计:     "] afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"¥ 125.0"
                                                                   attributes:@{NSForegroundColorAttributeName : BackgroundColor,
                                                                                NSFontAttributeName:KFontSize(14)}];
        [mutableAttributedString appendAttributedString:yuan];
        return mutableAttributedString;
    }];
}
- (void)layoutSecondViewUI
{
    self.secondView = [UIView new];
    self.secondView.layer.cornerRadius = 5;
    self.secondView.layer.masksToBounds = YES;
    self.secondView.backgroundColor = KHexColor(@"#ffffff");
    [self.view addSubview:_secondView];
    
    
    [_secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstView.mas_bottom).offset(7);
        make.left.equalTo(self.view.mas_left).offset(7);
        make.right.equalTo(self.view.mas_right).offset(-7);
        make.height.equalTo(120);
    }];
    
    
    self.titleViewS = [UIView new];
    self.titleViewS.layer.cornerRadius = 5;
    self.titleViewS.layer.masksToBounds = YES;
    self.titleViewS.backgroundColor = KHexColor(@"#ffffff");
    self.titleViewS.frame = CGRectMake(0, 0, CoreWidth-14, 40);
    [self.secondView addSubview:_titleViewS];
    
    self.titleImageS = [UIImageView new];
    self.titleImageS.image = [UIImage imageNamed:@"ziliao_shanghuming"];
    [self.titleViewS addSubview:_titleImageS];
    
    
    [_titleImageS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleViewS.mas_centerY).offset(0);
        make.left.equalTo(self.titleViewS.mas_left).offset(10);
        make.width.equalTo(14);
        make.height.equalTo(14);
    }];
    
    
    
    self.titleLabelS = [TTTAttributedLabel new];
    self.titleLabelS.font = KFontSize(14);
    self.titleLabelS.textColor = LightColor;
    self.titleLabelS.text = @"时尚手机外壳超市";
    [self.titleViewS addSubview:_titleLabelS];
    
    
    [_titleLabelS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleViewS.mas_centerY).offset(0);
        make.left.equalTo(self.titleImageS.mas_right).offset(10);
        make.width.equalTo(self.titleLabelS.mas_width);
        make.height.equalTo(14);
    }];
    
    self.titleLineS = [UIView new];
    self.titleLineS.backgroundColor = LineColor;
    [self.titleViewS addSubview:_titleLineS];
    
    [_titleLineS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.titleViewS.mas_bottom).offset(0);
        make.left.equalTo(self.titleViewS.mas_left).offset(0);
        make.right.equalTo(self.titleViewS.mas_right).offset(0);
        make.height.equalTo(0.5);
    }];
    
    
    
    self.cellViewS = [UIView new];
    self.cellViewS.layer.cornerRadius = 8;
    self.cellViewS.layer.masksToBounds = YES;
    self.cellViewS.backgroundColor = KHexColor(@"#ffffff");
    [self.secondView addSubview:_cellViewS];
    
    
    [_cellViewS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleViewS.mas_bottom).offset(0);
        make.left.equalTo(self.secondView.mas_left).offset(7);
        make.bottom.equalTo(self.secondView.mas_bottom).offset(0);
        make.right.equalTo(self.secondView.mas_right).offset(-7);
    }];

    
    

    self.iconImageS = [UIImageView new];
    self.iconImageS.image = [UIImage imageNamed:@"iconImage"];
    self.iconImageS.layer.cornerRadius = 5;
    self.iconImageS.layer.masksToBounds = YES;
    self.iconImageS.backgroundColor = [UIColor lightGrayColor];
    [self.cellViewS addSubview:_iconImageS];
    
    [_iconImageS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cellViewS.mas_left).offset(10);
        make.centerY.equalTo(self.cellViewS.mas_centerY).offset(0);
        make.width.equalTo(60);
        make.height.equalTo(60);
    }];
    
    self.titleLabelS = [TTTAttributedLabel new];
    self.titleLabelS.font = KFontSize(14);
    self.titleLabelS.textColor = DeepColor;
    self.titleLabelS.text = @"iphone 6s 手机壳";
    [self.cellViewS addSubview:_titleLabelS];
    
    
    [_titleLabelS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageS.mas_top).offset(0);
        make.left.equalTo(self.iconImageS.mas_right).offset(15);
        make.width.equalTo(self.titleLabelS.mas_width);
        make.height.equalTo(14);
    }];
    
    
    self.detailLabelS = [TTTAttributedLabel new];
    self.detailLabelS.font = KFontSize(14);
    self.detailLabelS.textColor = LightColor;
    self.detailLabelS.text = @"iphone 6s 手机壳保护外壳防摔";
    [self.cellViewS addSubview:_detailLabelS];
    
    
    [_detailLabelS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabelS.mas_bottom).offset(7);
        make.left.equalTo(self.iconImageS.mas_right).offset(15);
        make.width.equalTo(self.detailLabelS.mas_width);
        make.height.equalTo(14);
    }];
    self.priceLabelS = [TTTAttributedLabel new];
    self.priceLabelS.font = KFontSize(14);
    self.priceLabelS.textColor = BackgroundColor;
    [self.cellViewS addSubview:_priceLabelS];
    
    
    [_priceLabelS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.iconImageS.mas_bottom).offset(-5);
        make.left.equalTo(self.iconImageS.mas_right).offset(15);
        make.width.equalTo(self.priceLabelS.mas_width);
        make.height.equalTo(14);
    }];
    
    
    self.numberLabelS = [TTTAttributedLabel new];
    self.numberLabelS.font = KFontSize(14);
    self.numberLabelS.textColor = BackgroundColor;
    self.numberLabelS.text = @"x1";
    [self.cellViewS addSubview:_numberLabelS];
    
    
    [_numberLabelS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.iconImageS.mas_bottom).offset(-5);
        make.right.equalTo(self.cellViewS.mas_right).offset(-15);
        make.width.equalTo(self.numberLabelS.mas_width);
        make.height.equalTo(14);
    }];
    
    
    
    [self.priceLabelS setText:@"¥" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"125."
                                                                   attributes:@{NSForegroundColorAttributeName : BackgroundColor,
                                                                                NSFontAttributeName:KFontSize(12)}];
        [mutableAttributedString appendAttributedString:yuan];
        return mutableAttributedString;
    }];
    
}
- (void)layoutThirdViewUI
{
    self.thirdView = [UIView new];
    self.thirdView.backgroundColor = KHexColor(@"#ffffff");
    [self.view addSubview:_thirdView];
    
    
    [_thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.secondView.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(7);
        make.right.equalTo(self.view.mas_right).offset(-7);
        make.height.equalTo(80);
        
    }];
    
    
    
    self.titleShuLiangLabelT = [TTTAttributedLabel new];
    self.titleShuLiangLabelT.font = KFontSize(14);
    self.titleShuLiangLabelT.textColor = DeepColor;
    self.titleShuLiangLabelT.text = @"购买数量";
    [self.thirdView addSubview:_titleShuLiangLabelT];

    [_titleShuLiangLabelT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdView.mas_centerY).offset(-20);
        make.left.equalTo(self.thirdView.mas_left).offset(10);
        make.width.equalTo(self.titleShuLiangLabelT.mas_width);
        make.height.equalTo(14);
    }];
    
    
    self.addButtonT = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButtonT setImage:[UIImage imageNamed:@"shangpin_add"] forState:UIControlStateNormal];
    [self.addButtonT addTarget:self action:@selector(addButtonTClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdView addSubview:_addButtonT];
    
    [_addButtonT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdView.mas_centerY).offset(-20);
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
        make.centerY.equalTo(self.thirdView.mas_centerY).offset(-20);
        make.right.equalTo(self.addButtonT.mas_left).offset(-8);
        make.width.equalTo(60);
        make.height.equalTo(20);
    }];


    self.reduceButtonT = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.reduceButtonT setImage:[UIImage imageNamed:@"shangPin_reduce"] forState:UIControlStateNormal];
    [self.reduceButtonT addTarget:self action:@selector(reduceButtonTClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdView addSubview:_reduceButtonT];
    
    
    [_reduceButtonT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdView.mas_centerY).offset(-20);
        make.right.equalTo(self.shuLiangLabelT.mas_left).offset(-8);
        make.width.equalTo(20);
        make.height.equalTo(20);
    }];

    
    self.titlePeiSongLabelT = [TTTAttributedLabel new];
    self.titlePeiSongLabelT.font = KFontSize(14);
    self.titlePeiSongLabelT.textColor = DeepColor;
    self.titlePeiSongLabelT.text = @"配送方式";
    [self.thirdView addSubview:_titlePeiSongLabelT];
    
    [_titlePeiSongLabelT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdView.mas_centerY).offset(20);
        make.left.equalTo(self.thirdView.mas_left).offset(10);
        make.width.equalTo(self.titlePeiSongLabelT.mas_width);
        make.height.equalTo(14);
    }];

    self.arrowImageT = [UIImageView new];
    self.arrowImageT.image = [UIImage imageNamed:@"arrow_right"];
    [self.thirdView addSubview:_arrowImageT];
    
    [_arrowImageT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.thirdView.mas_right).offset(-8);
        make.centerY.equalTo(self.thirdView.mas_centerY).offset(20);
        make.width.equalTo(7);
        make.height.equalTo(14);
    }];

    self.peiSongLabelT = [TTTAttributedLabel new];
    self.peiSongLabelT.font = KFontSize(14);
    self.peiSongLabelT.textColor = LightColor;
    self.peiSongLabelT.text = @"快递  免邮";
    [self.thirdView addSubview:_peiSongLabelT];
    
    [_peiSongLabelT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdView.mas_centerY).offset(20);
        make.right.equalTo(self.arrowImage.mas_left).offset(-8);
        make.width.equalTo(self.peiSongLabelT.mas_width);
        make.height.equalTo(14);
    }];

    self.LineT = [UIView new];
    self.LineT.backgroundColor = LineColor;
    [self.thirdView addSubview:_LineT];
    
    [_LineT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.thirdView.mas_bottom).offset(0);
        make.left.equalTo(self.thirdView.mas_left).offset(10);
        make.right.equalTo(self.thirdView.mas_right).offset(0);
        make.height.equalTo(0.5);
    }];


}
- (void)layoutFouthViewUI
{
    self.fouthView = [UIView new];
    self.fouthView.layer.cornerRadius = 5;
    self.fouthView.layer.masksToBounds = YES;
    self.fouthView.backgroundColor = KHexColor(@"#ffffff");
    [self.view addSubview:_fouthView];
    
    
    [_fouthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.secondView.mas_bottom).offset(70);
        make.left.equalTo(self.view.mas_left).offset(7);
        make.right.equalTo(self.view.mas_right).offset(-7);
        make.height.equalTo(100);
        
    }];
    
    
    
    self.LineF = [UIView new];
    self.LineF.backgroundColor = LineColor;
    [self.fouthView addSubview:_LineF];
    
    [_LineF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.fouthView.mas_bottom).offset(-45);
        make.left.equalTo(self.fouthView.mas_left).offset(10);
        make.right.equalTo(self.fouthView.mas_right).offset(0);
        make.height.equalTo(0.5);
    }];

    
    self.titleLiuYanLabelF = [TTTAttributedLabel new];
    self.titleLiuYanLabelF.font = KFontSize(14);
    self.titleLiuYanLabelF.textColor = DeepColor;
    self.titleLiuYanLabelF.verticalAlignment = TTTAttributedLabelVerticalAlignmentCenter;
    self.titleLiuYanLabelF.text = @"买家留言:";
    [self.fouthView addSubview:_titleLiuYanLabelF];
    
    
    [_titleLiuYanLabelF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.LineF.mas_top).offset(-10);
        make.left.equalTo(self.fouthView.mas_left).offset(10);
        make.width.equalTo(70);
        make.height.equalTo(20);
    }];

    self.liuYanTextFieldF = [UITextField new];
    self.liuYanTextFieldF.textColor = LightColor;
    self.liuYanTextFieldF.font = KFontSize(14);
    self.liuYanTextFieldF.textAlignment = NSTextAlignmentLeft;
    self.liuYanTextFieldF.placeholder = @"选填";
    [self.fouthView addSubview:_liuYanTextFieldF];
    
    
    [_liuYanTextFieldF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLiuYanLabelF.mas_centerY).offset(0);
        make.left.equalTo(self.titleLiuYanLabelF.mas_right).offset(10);
        make.right.equalTo(self.fouthView.mas_right).offset(-10);
        make.height.equalTo(20);
    }];
    
    self.zongGongJiJianLabel = [TTTAttributedLabel new];
    self.zongGongJiJianLabel.font = KFontSize(14);
    self.zongGongJiJianLabel.textColor = DeepColor;
    [self.fouthView addSubview:_zongGongJiJianLabel];
    
    
    [_zongGongJiJianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.fouthView.mas_bottom).offset(-22.5);
        make.right.equalTo(self.fouthView.mas_right).offset(-10);
        make.width.equalTo(self.zongGongJiJianLabel.mas_width);
        make.height.equalTo(14);
    }];


    
    [self.zongGongJiJianLabel setText:[NSString stringWithFormat:@"共%@商品          合计:",@"4"] afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"¥ 125.0"
                                                                   attributes:@{NSForegroundColorAttributeName : BackgroundColor,
                                                                                NSFontAttributeName:KFontSize(14)}];
        [mutableAttributedString appendAttributedString:yuan];
        return mutableAttributedString;
    }];

}

- (void)layoutFirstViewUI
{
    self.firstView = [UIView new];
    self.firstView.layer.cornerRadius = 5;
    self.firstView.layer.masksToBounds = YES;
    self.firstView.backgroundColor = KHexColor(@"#ffffff");
    [self.firstView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)]];
    [self.view addSubview:_firstView];
    
    
    [_firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(7+64);
        make.left.equalTo(self.view.mas_left).offset(7);
        make.right.equalTo(self.view.mas_right).offset(-7);
        make.height.equalTo(80);
        
    }];
    
    
    self.shouHuoRenLabel = [TTTAttributedLabel new];
    self.shouHuoRenLabel.font = KFontSize(14);
    self.shouHuoRenLabel.textColor = DeepColor;
    [self.firstView addSubview:_shouHuoRenLabel];
    
    
    [_shouHuoRenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstView.mas_top).offset(10);
        make.left.equalTo(self.firstView.mas_left).offset(30);
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
    
    
    self.phoneLabel = [TTTAttributedLabel new];
    self.phoneLabel.font = KFontSize(14);
    self.phoneLabel.textColor = LightColor;
    self.phoneLabel.text = @"13888888888";
    [self.firstView addSubview:_phoneLabel];
    
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstView.mas_top).offset(10);
        make.right.equalTo(self.firstView.mas_right).offset(-20);
        make.width.equalTo(self.phoneLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    self.addressLabel = [TTTAttributedLabel new];
    self.addressLabel.font = KFontSize(12);
    self.addressLabel.textColor = LightColor;
    self.addressLabel.numberOfLines = 0;
    self.addressLabel.lineSpacing = 5;
    self.addressLabel.text = @"池塘边的榕树上还有知了深深叫着 夏，啦啦啦啦啦了  安居客放假";
    [self.firstView addSubview:_addressLabel];
    
    
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneLabel.mas_bottom).offset(5);
        make.left.equalTo(self.firstView.mas_left).offset(30);
        make.right.equalTo(self.firstView.mas_right).offset(-20);
        make.height.equalTo(40);
    }];
    
    
    self.iconImage = [UIImageView new];
    self.iconImage.image = [UIImage imageNamed:@"ziliao_dizhi"];
    [self.firstView addSubview:_iconImage];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.firstView.mas_left).offset(7);
        make.centerY.equalTo(self.firstView.mas_centerY).offset(0);
        make.width.equalTo(15);
        make.height.equalTo(12.5);
    }];
    
    
    self.arrowImage = [UIImageView new];
    self.arrowImage.image = [UIImage imageNamed:@"arrow_right"];
    [self.firstView addSubview:_arrowImage];
    
    [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.firstView.mas_right).offset(-8);
        make.centerY.equalTo(self.firstView.mas_centerY).offset(0);
        make.width.equalTo(7);
        make.height.equalTo(14);
    }];
}
#pragma mark - WYPopoverControllerDelegate
- (void)popoverControllerDidPresentPopover:(WYPopoverController *)controller
{
    NSLog(@"popoverControllerDidPresentPopover");
    
}

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller
{
    return NO;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller
{
    self.simanPopoverController.delegate = nil;
}

- (BOOL)popoverControllerShouldIgnoreKeyboardBounds:(WYPopoverController *)popoverController
{
    return NO;
}

- (void)popoverController:(WYPopoverController *)popoverController willTranslatePopoverWithYOffset:(float *)value
{
    // keyboard is shown and the popover will be moved up by 163 pixels for example ( *value = 163 )
    *value = 0; // set value to 0 if you want to avoid the popover to be moved
}
#pragma mark ------------------------------------------------------  popoverActionsEnd--------------------------

@end
