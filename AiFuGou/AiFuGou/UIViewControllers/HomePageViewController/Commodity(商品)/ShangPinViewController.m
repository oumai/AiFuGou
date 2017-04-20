//
//  ShangPinViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/22.
//  Copyright © 2016年 Leaves. All rights reserved.
//

#import "ShangPinViewController.h"  ///
#import "Masonry.h"
#import "ShangPinCustomCell.h"
#import "TuWenXiangQingViewController.h"
#import "QueRenOrderViewController.h"

#import "WYPopoverController.h"
#import "BuyImmediatelyViewController.h"    //立即购买
#import "BuyImmediatelyParametersColorVC.h" //参数

#import "TechnicalParmetersVC.h"          //查看规格参数
#import "DongaBaiHuoViewController.h"

@interface ShangPinViewController ()<UITableViewDelegate,UITableViewDataSource,WYPopoverControllerDelegate>
{
    UserInfoModel *user;
}
@property (nonatomic, strong) NSMutableArray    *dataArray;
@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) UIView    *bottomView;
@property (nonatomic, strong) UIButton  *shopCartButton;  //购物车
@property (nonatomic, strong) UILabel   *shopCartNumberLabel;  //购物车的小圈
@property (nonatomic, strong) UILabel   *shopCartLabel;
@property (nonatomic, strong) UIButton  *hiddenButton;    //收藏
@property (nonatomic, strong) UILabel   *hiddenLabel;
@property (nonatomic, strong) UIButton  *addShopCartButton;//加入购物车
@property (nonatomic, strong) UIButton  *buyButton;        //立即购买


@property (nonatomic , strong) WYPopoverController *simanPopoverController;//弹框

@end

@implementation ShangPinViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.title = @"商品";
    user = [[UserInfoModel alloc] init];
    self.dataArray = [NSMutableArray array];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
    }];
    
    [self layoutBottomViewUI];

    NSLog(@"%@",[user getUserID]);
}
#pragma mark ------------------------------------------------------------------ActionsButtonClick-------------------------------------------------
//分享
- (void)shareButtonClick:(UIButton *)button
{
    
}
//进入商家店铺
- (void)goToShopClick:(UIButton *)button
{
    DongaBaiHuoViewController *vc = [DongaBaiHuoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
//购物车
- (void)shopCartButtonClick:(UIButton *)button
{
}
//加入收藏车
- (void)hiddenButtonClick:(UIButton *)button
{
    [self requestHiddenCart];
}
- (void)requestHiddenCart
{
    //status =0 购物车   =1收藏车
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.car.add",
                           @"customerid":[user getUserID],
                           @"status":@"1",
                           @"shopid":self.shopID,
                           @"count":@"1",
                           @"productid":self.id,
                           @"id":@"1",
                           @"price":self.price};
    [OMURLConnection requestAFNJSon:dic method:RequestUrl view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            k_NSlogHUD(@"收藏成功");
            [self.hiddenButton setImage:[UIImage imageNamed:@"shangpin_shoucang"] forState:UIControlStateNormal];
        }
    } errorBlock:^(NSError *error) {
    }];
}
//加入购物车
- (void)addShopCartButtonClick:(UIButton *)button
{
    [self requestAddShopCart];
}
- (void)requestAddShopCart
{
    //status =0 购物车   =1收藏车
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.car.add",
                           @"customerid":[user getUserID],
                           @"status":@"0",
                           @"shopid":self.shopID,
                           @"count":@"1",
                           @"productid":self.id,
                           @"id":@"1",
                           @"price":self.price};
    [OMURLConnection requestAFNJSon:dic method:RequestUrl view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            
            k_yjHUD(@"添加购物车成功", self.view);
            NSLog(@"++++++++++++++++++++++");
            
        }
    } errorBlock:^(NSError *error) {
    }];
}

#pragma mark ------------------------------------------------------  popoverActions--------------------------

- (void) buyButtonClick:(UIButton *)button
{
    
    BaseViewController *pushViewController = nil;
    button.tag = 1001;
    
    
    if (button.tag == 1000) {
        BuyImmediatelyViewController *simanPopoverViewController = [BuyImmediatelyViewController new];//初始化弹框
        simanPopoverViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width ,self.view.frame.size.height);//设置弹框的大小
        pushViewController = simanPopoverViewController;
        //弹框消失。
        [simanPopoverViewController setDismissSimanPopoverViewController:^(BuyImmediatelyViewController *viewController) {
            [self.simanPopoverController dismissPopoverAnimated:YES completion:^{
                [self popoverControllerDidDismissPopover:_simanPopoverController];
            }];
        }];
        
        
        
        [simanPopoverViewController setSureButtonClick:^(BuyImmediatelyViewController *buyVC) {
            
            QueRenOrderViewController *vc = [QueRenOrderViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    //参数  尺码，颜色
    if (button.tag == 1001) {
        BuyImmediatelyParametersColorVC *simanPopoverViewController = [BuyImmediatelyParametersColorVC new];//初始化弹框
        simanPopoverViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width ,self.view.frame.size.height);//设置弹框的大小
        pushViewController = simanPopoverViewController;
        //弹框消失。
        [simanPopoverViewController setDismissSimanPopoverViewController:^(BuyImmediatelyParametersColorVC *viewController) {
            [self.simanPopoverController dismissPopoverAnimated:YES completion:^{
                [self popoverControllerDidDismissPopover:_simanPopoverController];
            }];
        }];
        
        
        
        [simanPopoverViewController setSureButtonClick:^(BuyImmediatelyParametersColorVC *buyVC) {
            
            QueRenOrderViewController *vc = [QueRenOrderViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        
    }

    
    self.simanPopoverController = [[WYPopoverController alloc] initWithContentViewController:pushViewController];
    self.simanPopoverController.delegate = self;
    self.simanPopoverController.animationDuration = .5f;
    self.simanPopoverController.popoverLayoutMargins =  button.tag == 1000 ? UIEdgeInsetsMake(CoreHeight-240, 0,0,0) : UIEdgeInsetsMake(CoreHeight-500,0,0,0);
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
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ShangPinCustomCell";
    ShangPinCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ShangPinCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray *titleArray = @[@"规则参数",@"图文详情"];
    cell.titleLabel.text = titleArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        TechnicalParmetersVC *simanPopoverViewController = [TechnicalParmetersVC new];//初始化弹框
        simanPopoverViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width ,self.view.frame.size.height);//设置弹框的大小
        
        //弹框消失。
        [simanPopoverViewController setDismissSimanPopoverViewController:^(TechnicalParmetersVC *viewController) {
            [self.simanPopoverController dismissPopoverAnimated:YES completion:^{
                [self popoverControllerDidDismissPopover:_simanPopoverController];
            }];
        }];
        
        
        self.simanPopoverController = [[WYPopoverController alloc] initWithContentViewController:simanPopoverViewController];
        self.simanPopoverController.delegate = self;
        self.simanPopoverController.animationDuration = .5f;
        self.simanPopoverController.popoverLayoutMargins = UIEdgeInsetsMake(CoreHeight-280, 0,0,0);
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
    
    if (indexPath.row == 1) {
        TuWenXiangQingViewController *vc = [TuWenXiangQingViewController new];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150+120;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [UIView new];
    sectionView.backgroundColor = KHexColor(@"#ebebeb");
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@""];
    imageView.backgroundColor = [UIColor lightGrayColor];
    imageView.frame = CGRectMake(0, 0, CoreWidth, 150);
    [sectionView addSubview:imageView];
    
    UIView *cellView = [UIView new];
    cellView.layer.cornerRadius = 5;
    cellView.layer.masksToBounds = YES;
    cellView.backgroundColor = [UIColor whiteColor];
    [sectionView addSubview:cellView];
    
    [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(10);
        make.left.equalTo(sectionView.mas_left).offset(10);
        make.bottom.equalTo(sectionView.mas_bottom).offset(-10);
        make.right.equalTo(sectionView.mas_right).offset(-10);
    }];
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(14);
    titleLabel.textColor = DeepColor;
    titleLabel.text = self.postTitle;
    [cellView addSubview:titleLabel];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cellView.mas_top).offset(10);
        make.left.equalTo(cellView.mas_left).offset(10);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    TTTAttributedLabel *detailLabel = [TTTAttributedLabel new];
    detailLabel.font = KFontSize(14);
    detailLabel.textColor = LightColor;
    detailLabel.text = self.postContent;
    [cellView addSubview:detailLabel];
    
    
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(cellView.mas_bottom).offset(-10);
        make.left.equalTo(cellView.mas_left).offset(10);
        make.width.equalTo(detailLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    TTTAttributedLabel *priceLabel = [TTTAttributedLabel new];
    priceLabel.font = KFontSize(18);
    priceLabel.textColor = BackgroundColor;
    priceLabel.text = [NSString stringWithFormat:@"¥ %@",self.price];
    [cellView addSubview:priceLabel];
    
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(detailLabel.mas_top).offset(-10);
        make.left.equalTo(cellView.mas_left).offset(10);
        make.width.equalTo(priceLabel.mas_width);
        make.height.equalTo(18);
    }];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
    [button setImage:[UIImage imageNamed:@"shangPin_fenxiang"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [cellView addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cellView.mas_top).offset(10);
        make.right.equalTo(cellView.mas_right).offset(-10);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];
    
    
    
    TTTAttributedLabel *fenxiang = [TTTAttributedLabel new];
    fenxiang.font = KFontSize(12);
    fenxiang.textColor = LightColor;
    fenxiang.text = @"分享";
    [button addSubview:fenxiang];
    
    
    [fenxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(button.mas_bottom).offset(-3);
        make.centerX.equalTo(button.mas_centerX).offset(0);
        make.width.equalTo(fenxiang.mas_width);
        make.height.equalTo(12);
    }];
    
    
    UIView *line = [UIView new];
    line.backgroundColor = LineColor;
    [cellView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.mas_top).offset(0);
        make.bottom.equalTo(button.mas_bottom).offset(0);
        make.width.equalTo(0.5);
        make.right.equalTo(button.mas_left).offset(-5);
    }];
    
    return sectionView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 150;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIView *sectionFooterView = [UIView new];
    sectionFooterView.backgroundColor = KHexColor(@"#ebebeb");
    
    
    UIView *cellView = [UIView new];
    cellView.layer.cornerRadius = 5;
    cellView.layer.masksToBounds = YES;
    cellView.backgroundColor = [UIColor whiteColor];
    [sectionFooterView addSubview:cellView];
    
    [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sectionFooterView.mas_top).offset(10);
        make.left.equalTo(sectionFooterView.mas_left).offset(10);
        make.bottom.equalTo(sectionFooterView.mas_bottom).offset(-10);
        make.right.equalTo(sectionFooterView.mas_right).offset(-10);
    }];
    
    UIImageView *iconImage = [UIImageView new];
    iconImage.image = [UIImage imageNamed:@"arrow_right"];
    iconImage.layer.cornerRadius = 5;
    iconImage.layer.masksToBounds = YES;
    iconImage.backgroundColor = [UIColor lightGrayColor];
    [cellView addSubview:iconImage];
    
    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cellView.mas_top).offset(10);
        make.left.equalTo(cellView.mas_left).offset(10);
        make.width.equalTo(120);
        make.height.equalTo(60);
    }];
    
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(14);
    titleLabel.textColor = DeepColor;
    titleLabel.text = self.shopname;
    [cellView addSubview:titleLabel];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImage.mas_top).offset(10);
        make.left.equalTo(iconImage.mas_right).offset(10);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    TTTAttributedLabel *detailLabel = [TTTAttributedLabel new];
    detailLabel.font = KFontSize(14);
    detailLabel.textColor = LightColor;
    detailLabel.text = [NSString stringWithFormat:@"卖家:%@",self.relname];
    [cellView addSubview:detailLabel];
    
    
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(iconImage.mas_bottom).offset(-10);
        make.left.equalTo(iconImage.mas_right).offset(10);
        make.width.equalTo(detailLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1;
    button.layer.borderColor = LineColor.CGColor;
    [button setTitle:@"进入店铺" forState:UIControlStateNormal];
    [button setTitleColor:LineColor forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"ziliao_shanghuming"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goToShopClick:) forControlEvents:UIControlEventTouchUpInside];
    [cellView addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(cellView.mas_bottom).offset(-5);
        make.left.equalTo(cellView.mas_left).offset(30);
        make.right.equalTo(cellView.mas_right).offset(-30);
        make.height.equalTo(40);
    }];
    return sectionFooterView;
}
- (void)layoutBottomViewUI
{
    self.bottomView = [UIView new];
    self.bottomView.backgroundColor = [UIColor whiteColor];
    self.bottomView.frame = CGRectMake(0, CoreHeight-50, CoreWidth, 50);
    [self.view addSubview:_bottomView];
    
    
    
    
    self.shopCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shopCartButton.layer.borderWidth = 0.5;
    self.shopCartButton.layer.borderColor = LineColor.CGColor;
    self.shopCartButton.titleLabel.font = KFontSize(14);
    [self.shopCartButton setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
    [self.shopCartButton setImage:[UIImage imageNamed:@"iconfont-gouwuche"] forState:UIControlStateNormal];
    [self.shopCartButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.shopCartButton addTarget:self action:@selector(shopCartButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:_shopCartButton];
    
    [_shopCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomView.mas_bottom).offset(0);
        make.left.equalTo(self.bottomView.mas_left).offset(0);
        make.width.equalTo(CoreWidth*2/10);
        make.height.equalTo(50);
    }];
    
    
    
    self.shopCartLabel = [TTTAttributedLabel new];
    self.shopCartLabel.font = KFontSize(14);
    self.shopCartLabel.textColor = LightColor;
    self.shopCartLabel.text = @"购物车";
    [self.shopCartButton addSubview:_shopCartLabel];
    
    
    [_shopCartLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.shopCartButton.mas_bottom).offset(-3);
        make.centerX.equalTo(self.shopCartButton.mas_centerX).offset(0);
        make.width.equalTo(self.shopCartLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    self.shopCartNumberLabel = [TTTAttributedLabel new];
    self.shopCartNumberLabel.font = KFontSize(10);
    self.shopCartNumberLabel.textColor = KHexColor(@"#ffffff");
    self.shopCartNumberLabel.layer.cornerRadius = 7;
    self.shopCartNumberLabel.layer.masksToBounds = YES;
    self.shopCartNumberLabel.backgroundColor = [UIColor redColor];
    self.shopCartNumberLabel.text = @"10";
    [self.shopCartLabel addSubview:_shopCartNumberLabel];
    
    
    
    
    [_shopCartNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.shopCartButton.mas_right).offset(-12);
        make.top.equalTo(self.shopCartButton.mas_top).offset(8);
        make.width.equalTo(14);
        make.height.equalTo(14);
    }];

    
    
    self.hiddenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.hiddenButton.layer.borderWidth = 0.5;
    self.hiddenButton.layer.borderColor = LineColor.CGColor;
    self.hiddenButton.titleLabel.font = KFontSize(14);
    [self.hiddenButton setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
    [self.hiddenButton setImage:[UIImage imageNamed:@"shangpin_meishoucang"] forState:UIControlStateNormal];
    [self.hiddenButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.hiddenButton addTarget:self action:@selector(hiddenButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:_hiddenButton];
    
    [_hiddenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomView.mas_bottom).offset(0);
        make.left.equalTo(self.shopCartButton.mas_right).offset(0);
        make.width.equalTo(CoreWidth*2/10);
        make.height.equalTo(50);
    }];
    
    
    
    self.hiddenLabel = [TTTAttributedLabel new];
    self.hiddenLabel.font = KFontSize(14);
    self.hiddenLabel.textColor = LightColor;
    self.hiddenLabel.text = @"收藏";
    [self.hiddenButton addSubview:_hiddenLabel];
    
    
    [_hiddenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.hiddenButton.mas_bottom).offset(-3);
        make.centerX.equalTo(self.hiddenButton.mas_centerX).offset(0);
        make.width.equalTo(self.hiddenLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    self.addShopCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addShopCartButton.titleLabel.font = KFontSize(17);
    [self.addShopCartButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    [self.addShopCartButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.addShopCartButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#eca50c")] forState:UIControlStateNormal];
    [self.addShopCartButton addTarget:self action:@selector(addShopCartButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:_addShopCartButton];
    
    [_addShopCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomView.mas_bottom).offset(0);
        make.left.equalTo(self.hiddenButton.mas_right).offset(0);
        make.width.equalTo(CoreWidth*3/10);
        make.height.equalTo(50);
    }];
    
    
    self.buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buyButton.titleLabel.font = KFontSize(17);
    [self.buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [self.buyButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.buyButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#f24818")] forState:UIControlStateNormal];
    [self.buyButton addTarget:self action:@selector(buyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:_buyButton];
    
    [_buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomView.mas_bottom).offset(0);
        make.right.equalTo(self.bottomView.mas_right).offset(0);
        make.width.equalTo(CoreWidth*3/10);
        make.height.equalTo(50);
    }];
}
@end
