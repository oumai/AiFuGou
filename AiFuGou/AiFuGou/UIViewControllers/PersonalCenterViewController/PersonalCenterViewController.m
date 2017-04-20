//
//  PersonalCenterViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/1.
//  Copyright © 2016年 jumper. All rights reserved.
//
static NSString *identifierItem = @"PersonalCenterCollectionItem";

#import "Masonry.h"
#import "PersonalCenterViewController.h"
#import "Wodetuiguang ViewController.h"
#import "XiaoFeiJiFenViewController.h"
#import "DuiHuanJiFenViewController.h"
#import "WodeDingdanViewController.h"
#import "memberInfoViewController.h"
#import "TixianViewController.h"
#import "WodeshoucangViewController.h"
#import "zhijuanduihuanViewController.h"
#import "guanyuwomenViewController.h"
#import "WoDeZiChanViewController.h"    //我的资产
#import "TiXianViewController.h"        //提现

#import "PersonalCenterCustomCell.h"        //cell
#import "PersonalCenterCollectionItem.h"    //item

#import "FDAlertView.h"
#import "UpVipView.h"           //升级会员
#import "UpVipViewController.h"

@interface PersonalCenterViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,FDAlertViewDelegate>
@property (nonatomic, strong) UITableView                   *headerTableView;
@property (nonatomic, strong) UIView                        *headerView;
@property (nonatomic, strong) UIView                        *firstView;
@property (nonatomic, strong) UICollectionViewFlowLayout    *layout;
@property (nonatomic, strong) UICollectionView              *collectionView;
@property (nonatomic, strong) UITableView                   *tableView;
@property (nonatomic, strong) UIButton                      *button;


@property (nonatomic, strong) UIImageView   *iconImage;
@property (nonatomic, strong) UILabel       *nameLabel;
@property (nonatomic, strong) UIButton      *vipGradeButton;                //会员等级
@property (nonatomic, strong) UIButton      *upVipButton;                   //升级会员
@property (nonatomic, strong) TTTAttributedLabel *kindlyRemindLabel;        //温馨提示

@property (nonatomic, strong) UpVipView        *upView;                     //弹会员升级的框
@end

@implementation PersonalCenterViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.headerTableView = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    self.headerTableView.backgroundColor = KHexColor(@"#ebebeb");
    self.headerTableView.showsVerticalScrollIndicator = NO;
    [self.headerTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_headerTableView];
    
   
    
    [self layoutHeaderViewUI]; //第一块
    [self layoutCollectionView];//第二块
    [self layoutTableViewUI];  //第三块
    
    [self layoutUpView];
}
- (void)layoutUpView
{
    self.upView = [UpVipView new];
    self.upView.frame = CGRectMake(0, CoreHeight, CoreWidth, CoreHeight-200);
    [self.view addSubview:self.upView];
    
    __weak __typeof(&*self)weakSelf = self;
    [self.upView setDismissKuangBlock:^{
        
        weakSelf.tabBarController.tabBar.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.upView.frame = CGRectMake(0, CoreHeight, CoreWidth, CoreHeight-200);

        } completion:^(BOOL finished) {
            
        }];
        
    }];
    
    
    [self.upView setSureKuangBlock:^{
        
        UpVipViewController *vc = [UpVipViewController new];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];

}
#pragma mark ------------------------------------------------------------------ActionsButtonClick-------------------------------------------------
- (void)upVipButtonClick
{
    self.tabBarController.tabBar.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        self.upView.frame = CGRectMake(0, 200, CoreWidth, CoreHeight-200);

    } completion:^(BOOL finished) {
    }];
    
    
    
}

- (void)buttonClick
{
    
    FDAlertView *alertView = [[FDAlertView alloc] initWithTitle:@"提示" icon:nil message:[NSString stringWithFormat:@"是否拨打电话%@",@"400800234"] delegate:self buttonTitles:@"取消",@"确定", nil];
    [alertView setTitleColor:DeepColor fontSize:14];
    [alertView setButtonTitleColor:BackgroundColor fontSize:14 atIndex:0];
    [alertView setButtonTitleColor:BackgroundColor fontSize:14 atIndex:1];
    [alertView show];
}
- (void)alertView:(FDAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
    }
    if (buttonIndex == 1) {
        
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"1897267368"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        
    }
}
- (void)layoutHeaderViewUI
{
    self.headerView = [UIView new];
    self.headerView.backgroundColor = KHexColor(@"#ebebeb");
    self.headerView.frame = CGRectMake(0, 0, CoreWidth, CoreHeight-64);  //firstView 的高度加CollectionView的高度
    self.headerTableView.tableHeaderView = self.headerView;
    
    
    self.firstView = [UIView new];
    self.firstView.layer.cornerRadius = 8;
    self.firstView.layer.masksToBounds = YES;
    self.firstView.backgroundColor = KHexColor(@"#ffffff");
    [self.headerView addSubview:_firstView];
    
    
    [_firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(7);
        make.left.equalTo(self.headerView.mas_left).offset(7);
        make.right.equalTo(self.headerView.mas_right).offset(-7);
        make.height.equalTo(100);

    }];
    
    self.iconImage = [UIImageView new];
    self.iconImage.layer.cornerRadius = 30;
    self.iconImage.layer.masksToBounds = YES;
    self.iconImage.image = [UIImage imageNamed:@"iconImage"];
    self.iconImage.backgroundColor = [UIColor lightGrayColor];
    [self.firstView addSubview:_iconImage];
    
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstView.mas_top).offset(10);
        make.left.equalTo(self.firstView.mas_left).offset(10);
        make.width.equalTo(60);
        make.height.equalTo(60);
    }];
    
    

    self.nameLabel = [TTTAttributedLabel new];
    self.nameLabel.font = KFontSize(14);
    self.nameLabel.textColor = DeepColor;
    self.nameLabel.text = @"王大锤";
    [self.firstView addSubview:_nameLabel];
    
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImage.mas_top).offset(0);
        make.left.equalTo(self.iconImage.mas_right).offset(10);
        make.width.equalTo(self.nameLabel.mas_width);
        make.height.equalTo(14);
    }];

    
    self.vipGradeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.vipGradeButton.titleLabel.font = KFontSize(14);
    [self.vipGradeButton setImageEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 0)];
    [self.vipGradeButton setImage:[UIImage imageNamed:@"gerenzhongxin_huiyuan"] forState:UIControlStateNormal];
    [self.vipGradeButton setTitle:@"普通会员" forState:UIControlStateNormal];
    [self.vipGradeButton setTitleColor:DeepColor forState:UIControlStateNormal];
    [self.firstView addSubview:_vipGradeButton];
    
    [_vipGradeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.iconImage.mas_bottom).offset(-5);
        make.left.equalTo(self.iconImage.mas_right).offset(10);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];

    
    self.kindlyRemindLabel = [TTTAttributedLabel new];
    self.kindlyRemindLabel.font = KFontSize(14);
    self.kindlyRemindLabel.textColor = BackgroundColor;
    [self.firstView addSubview:_kindlyRemindLabel];
    
    
    [_kindlyRemindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.firstView.mas_bottom).offset(-5);
        make.left.equalTo(self.iconImage.mas_left).offset(0);
        make.width.equalTo(self.kindlyRemindLabel.mas_width);
        make.height.equalTo(14);
    }];

    
    self.upVipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.upVipButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.upVipButton addTarget:self action:@selector(upVipButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.upVipButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ebebeb")] forState:UIControlStateNormal];
    [self.firstView addSubview:_upVipButton];
    
    [_upVipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.firstView.mas_centerY).offset(0);
        make.right.equalTo(self.firstView.mas_right).offset(-10);
        make.width.equalTo(80);
        make.height.equalTo(80);
    }];

    
    [self.kindlyRemindLabel setText:@"温馨提示:" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"会员升级只有一次机会"
                                                                   attributes:@{NSForegroundColorAttributeName : LightColor,
                                                                                NSFontAttributeName:KFontSize(12)}];
        [mutableAttributedString appendAttributedString:yuan];
        return mutableAttributedString;
    }];
}
- (void)layoutCollectionView
{
    
    
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.itemSize = CGSizeMake((CoreWidth-10)/4, CoreWidth/4);
    self.layout.minimumLineSpacing = 10;  //垂直的
    self.layout.minimumInteritemSpacing = 0;
    self.layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);  //定义每个的边距
    [self.layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.layer.cornerRadius = 5;
    self.collectionView.layer.masksToBounds = YES;
    self.collectionView.backgroundColor = KHexColor(@"#ffffff");
    [self.headerView addSubview:_collectionView];
    [self.collectionView registerClass:[PersonalCenterCollectionItem class] forCellWithReuseIdentifier:identifierItem];
    
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstView.mas_bottom).offset(10);
        make.left.equalTo(self.headerView.mas_left).offset(5);
        make.right.equalTo(self.headerView.mas_right).offset(-5);
        make.height.equalTo(CoreWidth/2+10);
    }];
    
}
- (void)layoutTableViewUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor lightGrayColor];KHexColor(@"#ebebeb");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layer.cornerRadius = 5;
    self.tableView.layer.masksToBounds = YES;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.headerView addSubview:_tableView];
    
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).offset(10);
        make.left.equalTo(self.collectionView.mas_left).offset(0);
        make.right.equalTo(self.collectionView.mas_right).offset(0);
        make.height.equalTo(90);
    }];
    
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    [self.button setTitle:@"客服电话" forState:UIControlStateNormal];
    [self.button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:_button];
    
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom).offset(20);
        make.centerX.equalTo(self.headerView.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*3/4);
        make.height.equalTo(40);
    }];
}
#pragma mark  - UITableViewDataSource & UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"HomePageCustomCell";
    PersonalCenterCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[PersonalCenterCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *imageArray = @[@"iconfont-yue30-25",@"iconfont-tixian30-30"];//@[@"zhanghuguanli_zhanghuyue",@"zhanghuguanli_tixian",@"zhanghuguanli_goumaijifen",@"zhanghuguanli_jifenyue"];
    NSArray *titleArray = @[@"我的资产:",@"提现"];
    cell.iconImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
    cell.titleLabel.text = titleArray[indexPath.row];
    
    if (indexPath.row == 0) {
        cell.detailLabel.text = @"查看明细";
        cell.priceLabel.text = @"0.00";
    }
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0)
    {
        self.hidesBottomBarWhenPushed = YES;
        WoDeZiChanViewController * vc = [[WoDeZiChanViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        vc.titleString = @"我的资产";
        self.hidesBottomBarWhenPushed = NO;
    }
    else if (indexPath.row == 1)
    {
        self.hidesBottomBarWhenPushed = YES;
        TiXianViewController * vc = [[TiXianViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
}

#pragma mark ------------------------------------------------------------------UICollectionViewDelegateFlowLayout-------------------------------------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalCenterCollectionItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierItem forIndexPath:indexPath];
    NSArray * imageArray = @[@"huiyuanziliao",@"wodetuiguang",@"xiaofijifen",@"duihuanjifen",@"wodedingdan",@"wodeshoucang",@"zhiquanduihuan",@"guanyuwomen"];
    cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.item == 0) {
        self.hidesBottomBarWhenPushed = YES;
        memberInfoViewController * vc= [[memberInfoViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    else if (indexPath.item == 1) {
        self.hidesBottomBarWhenPushed = YES;
        Wodetuiguang_ViewController * vc = [[Wodetuiguang_ViewController alloc]init];
        [self.navigationController pushViewController: vc  animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    else if (indexPath.item == 2) {
        self.hidesBottomBarWhenPushed = YES;
        XiaoFeiJiFenViewController *vc =[[XiaoFeiJiFenViewController alloc]init];
        [self.navigationController pushViewController: vc  animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    else if (indexPath.item == 3) {
        self.hidesBottomBarWhenPushed = YES;
        DuiHuanJiFenViewController*vc =[[DuiHuanJiFenViewController alloc]init];
        [self.navigationController pushViewController: vc  animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    else if (indexPath.item == 4) {
        self.hidesBottomBarWhenPushed = YES;
        WodeDingdanViewController * vc = [[WodeDingdanViewController  alloc]init];
        [self.navigationController pushViewController: vc  animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    else if (indexPath.item == 5) {
        self.hidesBottomBarWhenPushed = YES;
        WodeshoucangViewController  * vc = [[WodeshoucangViewController  alloc]init];
        [self.navigationController pushViewController: vc  animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    else if (indexPath.item == 6) {
        self.hidesBottomBarWhenPushed = YES;
        zhijuanduihuanViewController * vc =[[zhijuanduihuanViewController alloc]init];
        [self.navigationController pushViewController: vc  animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    else if (indexPath.item == 7) {
        self.hidesBottomBarWhenPushed = YES;
        guanyuwomenViewController * vc =[[guanyuwomenViewController alloc]init];
        [self.navigationController pushViewController: vc  animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    
}
@end
