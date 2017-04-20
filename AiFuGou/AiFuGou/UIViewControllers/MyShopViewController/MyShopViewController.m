//
//  MyShopViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/1.
//  Copyright © 2016年 jumper. All rights reserved.
//


#import "Masonry.h"
#import "MyShopViewController.h"
//#import "DingDanxiangqingViewController.h"


#import "TixianViewController.h"
#import "GoumaijifenViewController.h"
#import "JifenyueViewController.h"



#import "OrderManagerViewController.h"  //订单管理
#import "OrderDetailViewController.h"

#import "ZhangHuGuanLiViewController.h" ///账户管理
#import "WoDeZiChanViewController.h"     //(账户余额)我的资产
#import "TiXianViewController.h"         //提现
#import "GoumaijifenViewController.h"    //购买积分
#import "JifenyueViewController.h"       //积分余额

#import "ShangpinguanliViewController.h" //商品管理
#import "UpdateCommoditiesViewController.h" //上传商品页面


#import "ShangjiaZiLiaoViewController.h"//账户资料管理
#import "ShangdianmingViewController.h"


@interface MyShopViewController ()
{
    OrderManagerViewController * vc;
    ZhangHuGuanLiViewController * vc2;
    ShangpinguanliViewController * vc3;
    ShangjiaZiLiaoViewController * vc4;

}
@property (nonatomic ,assign) int selected;
@property(nonatomic,strong) UIButton * selectedButton;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)ZhangHuGuanLiViewController * zhanghuVC;
@property(nonatomic,strong)ShangpinguanliViewController * VC;
@property(nonatomic,strong)ShangjiaZiLiaoViewController * ziliaoVc;


@property (nonatomic, strong) UISegmentedControl        *segmentControl;
@end

@implementation MyShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:DeepColor,UITextAttributeTextColor,  [UIFont fontWithName:nil size:10.f],UITextAttributeFont ,DeepColor,UITextAttributeTextShadowColor ,nil]; //字体边边颜色
    
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"订单管理",@"账户管理",@"商品管理",@"商户资料管理"]];
    self.segmentControl.segmentedControlStyle = UISegmentedControlStyleBordered;
    self.segmentControl.selectedSegmentIndex = 0;
    self.segmentControl.layer.cornerRadius = 10;
    self.segmentControl.layer.masksToBounds = YES;
    self.segmentControl.layer.borderWidth = 1;
    self.segmentControl.layer.borderColor = KHexColor(@"#f24818").CGColor;//边框的颜色
    self.segmentControl.tintColor = KHexColor(@"#f24818");  //选中后的背景颜色
    self.segmentControl.backgroundColor= KHexColor(@"#ebebeb"); //背景颜色
    [self.segmentControl setTitleTextAttributes:dic forState:UIControlStateNormal];
    [self.segmentControl addTarget:self action:@selector(segmentControlClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentControl];
    
    
    [_segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64+10);
        make.left.equalTo(self.view.mas_left).offset(5);
        make.right.equalTo(self.view.mas_right).offset(-5);
        make.height.equalTo(30);
    }];
    
    [self layoutUI];
    vc.view.hidden = NO;
    vc2.view.hidden = YES;
    vc3.view.hidden = YES;
    vc4.view.hidden = YES;
}
- (void)layoutUI
{
    //账户管理
    vc2 = [[ZhangHuGuanLiViewController alloc]init];
    vc2.view.frame = CGRectMake(0, 110, CoreWidth, CoreHeight-110-49);
    [self.view addSubview:vc2.view];
    __weak ZhangHuGuanLiViewController *safeVCZ = vc2;
   
    
    
    [safeVCZ setPushBlock:^(NSInteger index) {
        
        
        switch (index) {
            case 0:
            {
                WoDeZiChanViewController *wodeVC = [WoDeZiChanViewController new];
                wodeVC.titleString = @"我的资产";
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:wodeVC animated:YES];
                self.hidesBottomBarWhenPushed = NO;
            }
                break;
            case 1:
            {
                TiXianViewController *wodeVC = [TiXianViewController new];
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:wodeVC animated:YES];
                self.hidesBottomBarWhenPushed = NO;
            }
                break;
            case 2:
            {
                GoumaijifenViewController *wodeVC = [GoumaijifenViewController new];
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:wodeVC animated:YES];
                self.hidesBottomBarWhenPushed = NO;
            }
                break;
            case 3:
            {
                JifenyueViewController *wodeVC = [JifenyueViewController new];
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:wodeVC animated:YES];
                self.hidesBottomBarWhenPushed = NO;
            }
                break;
            default:
                break;
        }
    }];
    
    
    //商品管理
    vc3 = [[ShangpinguanliViewController alloc]init];
    vc3.view.frame = CGRectMake(0, 110, CoreWidth, CoreHeight-110-49);
    [self.view addSubview:vc3.view];
    __weak ShangpinguanliViewController *safeVCS = vc3;
    [safeVCS setPushBlock:^(NSInteger index) {
        
        UpdateCommoditiesViewController *vcshangHuMing = [UpdateCommoditiesViewController new];
        self.hidesBottomBarWhenPushed = YES;
        vcshangHuMing.index = index;
        [self.navigationController pushViewController:vcshangHuMing animated:YES];
    }];
    
    
    
    //商户资料管理
    vc4 = [[ShangjiaZiLiaoViewController alloc]init];
    vc4.view.frame = CGRectMake(0, 110, CoreWidth, CoreHeight-110-49);
    [self.view addSubview:vc4.view];
    __weak ShangjiaZiLiaoViewController *safeVC = vc4;
    [safeVC setPushBlock:^()
     {
         
         
         ShangdianmingViewController *vcshangHuMing = [ShangdianmingViewController new];
         self.hidesBottomBarWhenPushed = YES;
         [self.navigationController pushViewController:vcshangHuMing animated:YES];
     }];

    
    //订单管理
    vc = [[OrderManagerViewController alloc]init];
    vc.view.frame = CGRectMake(0, 110, CoreWidth, CoreHeight-110-49);
    [self.view addSubview:vc.view];
    __weak OrderManagerViewController *safeVCO = vc;
    [safeVCO setPushBlock:^(NSInteger index) {
        
        OrderDetailViewController *vcshangHuMing = [OrderDetailViewController new];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vcshangHuMing animated:YES];
    }];
    
}
- (void)segmentControlClick:(UISegmentedControl *)segmentControl
{
    NSInteger index = segmentControl.selectedSegmentIndex;
    switch (index) {
        case 0:
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
    }
    
    self.type = segmentControl.selectedSegmentIndex + 100;
    
    if (self.type == oneCell)
    {
        vc.view.hidden = NO;
        vc2.view.hidden = YES;
        vc3.view.hidden = YES;
        vc4.view.hidden = YES;
    }
    if (self.type == twoCell) {
        vc.view.hidden = YES;
        vc2.view.hidden = NO;
        vc3.view.hidden = YES;
        vc4.view.hidden = YES;
    }
    if (self.type == threeCell) {
        
        vc.view.hidden = YES;
        vc2.view.hidden = YES;
        vc3.view.hidden = NO;
        vc4.view.hidden = YES;
        
    }
    if (self.type == fourCell)
    {
        vc.view.hidden = YES;
        vc2.view.hidden = YES;
        vc3.view.hidden = YES;
        vc4.view.hidden = NO;
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
}
@end
