//
//  PayDetailViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/13.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "PayDetailViewController.h"
#import "PayDetailCustomCell.h"
#import "DCPaymentView.h"           //支付弹框
#import "PaymentTermsViewControllers.h"//支付方式
#import "WYPopoverController.h"


@interface PayDetailViewController ()<UITableViewDelegate,UITableViewDataSource,WYPopoverControllerDelegate>
@property (nonatomic, strong) WYPopoverController *simanPopoverController;
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) NSArray       *titleArray;
@property (nonatomic, strong) NSArray       *detailArray;
@property (nonatomic, strong) UIView        *footerTableView;
@property (nonatomic, strong) UIButton      *button;

@end

@implementation PayDetailViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    self.titleArray = @[@"支付宝账户:",@"付款方式:",@"订单金额:"];
    self.detailArray = @[@"oumaiko.yahoo.com",@"账户余额",@"125.0"];
    
    
    [self layoutBottomUI];
    
}
- (void)sureButtonClick:(UIButton *)button
{
    
    if (self.dismissSimanPopoverViewController) {
        self.dismissSimanPopoverViewController(self);
    }

    
    DCPaymentView *payAlert = [[DCPaymentView alloc]init];
    payAlert.title = @"请输入支付密码,以验证身份";
    payAlert.detail = @"提现";
    payAlert.amount= 10;
    [payAlert show];
    payAlert.completeHandle = ^(NSString *inputPwd) {
        NSLog(@"密码是%@",inputPwd);
        
        
        
        if (self.pushPaySuccessedBlock) {
            self.pushPaySuccessedBlock();
        }
       
    };
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeaderView = [UIView new];
    sectionHeaderView.backgroundColor = KHexColor(@"#ebebeb");
    
    
    UIView *headerView = [UIView new];
    headerView.backgroundColor = KHexColor(@"#ffffff");
    [sectionHeaderView addSubview:headerView];
    
      
    UIView *line= [UIView new];
    line.backgroundColor = LineColor;
    line.frame = CGRectMake(0, 45, CoreWidth, 0.5);
    [headerView addSubview:line];
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setImage:[UIImage imageNamed:@"iconfont-cha28-28"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeButtonTClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:closeButton];
    
       
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(20);
    titleLabel.textColor = DeepColor;
    titleLabel.text = @"付款";
    titleLabel.verticalAlignment = TTTAttributedLabelVerticalAlignmentCenter;
    [headerView addSubview:titleLabel];
    
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sectionHeaderView.mas_top).offset(0);
        make.left.equalTo(sectionHeaderView.mas_left).offset(0);
        make.bottom.equalTo(sectionHeaderView.mas_bottom).offset(0);
        make.right.equalTo(sectionHeaderView.mas_right).offset(0);
        
    }];
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headerView.mas_centerY).offset(0);
        make.left.equalTo(headerView.mas_left).offset(10);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headerView.mas_centerY).offset(0);
        make.centerX.equalTo(headerView.mas_centerX).offset(0);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(20);
    }];
    
    return sectionHeaderView;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return  60;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *sectionFooterView = [UIView new];
    sectionFooterView.backgroundColor = KHexColor(@"#ebebeb");
    
    
    UIView *footerView = [UIView new];
    footerView.backgroundColor = KHexColor(@"#ffffff");
    [sectionFooterView addSubview:footerView];
    
    
      
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(20);
    titleLabel.textColor = DeepColor;
    titleLabel.text = @"需付款";
    titleLabel.verticalAlignment = TTTAttributedLabelVerticalAlignmentCenter;
    [footerView addSubview:titleLabel];
    
    
      
    
    TTTAttributedLabel *priceLabel = [TTTAttributedLabel new];
    priceLabel.font = KFontSize(20);
    priceLabel.textColor = BackgroundColor;
    priceLabel.verticalAlignment = TTTAttributedLabelVerticalAlignmentCenter;
    [footerView addSubview:priceLabel];
    
    
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sectionFooterView.mas_top).offset(0);
        make.left.equalTo(sectionFooterView.mas_left).offset(0);
        make.bottom.equalTo(sectionFooterView.mas_bottom).offset(0);
        make.right.equalTo(sectionFooterView.mas_right).offset(0);
        
    }];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(footerView.mas_centerY).offset(0);
        make.left.equalTo(footerView.mas_left).offset(10);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(20);
    }];
    
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(footerView.mas_centerY).offset(0);
        make.right.equalTo(footerView.mas_right).offset(-20);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(20);
    }];

    
    [priceLabel setText:@"135" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"元"
                                                                   attributes:@{NSForegroundColorAttributeName : DeepColor,
                                                                                NSFontAttributeName:KFontSize(14)}];
        [mutableAttributedString appendAttributedString:yuan];
        return mutableAttributedString;
    }];
    
   
    return sectionFooterView;
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"PayDetailCustomCell";
    PayDetailCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[PayDetailCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 1) {
        cell.arrowImage.hidden = NO;
        cell.detailLabel.textColor = DeepColor;
    }
    else{
        cell.detailLabel.textColor = LightColor;
    }
    cell.titleLabel.text = self.titleArray[indexPath.row];
    cell.detailLabel.text = self.detailArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1)
    {
        PaymentTermsViewControllers *simanPopoverViewController = [PaymentTermsViewControllers new];//初始化弹框
        simanPopoverViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width ,self.view.frame.size.height);//设置弹框的大小
        
        //弹框消失。
        [simanPopoverViewController setDismissSimanPopoverViewController:^(PaymentTermsViewControllers *viewController) {
            
            
            [self.simanPopoverController dismissPopoverAnimated:YES completion:^{
                [self popoverControllerDidDismissPopover:_simanPopoverController];
            }];
        }];
        
        self.simanPopoverController = [[WYPopoverController alloc] initWithContentViewController:simanPopoverViewController];
        self.simanPopoverController.delegate = self;
        self.simanPopoverController.animationDuration = .5f;
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
}
- (void)closeButtonTClick:(UIButton *)button
{
    if (self.dismissSimanPopoverViewController) {
        self.dismissSimanPopoverViewController(self);
    }
}
- (void)layoutBottomUI
{
    self.footerTableView = [UIView new];
    self.footerTableView.backgroundColor = [UIColor whiteColor];
    self.footerTableView.frame = CGRectMake(0, 0, CoreWidth, 80);
    self.tableView.tableFooterView = self.footerTableView;
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    self.button.layer.borderWidth = 1;
    self.button.layer.borderColor = BackgroundColor.CGColor;
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    [self.button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.footerTableView addSubview:_button];
    
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.footerTableView.mas_centerY).offset(0);
        make.centerX.equalTo(self.footerTableView.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth-80);
        make.height.equalTo(40);
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
