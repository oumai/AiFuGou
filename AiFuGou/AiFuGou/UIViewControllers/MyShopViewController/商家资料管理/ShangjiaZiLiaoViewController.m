//
//  ShangjiaZiLiaoViewController.m
//  AIFUGOU
//
//  Created by Minghui Sun on 16/5/19.
//  Copyright © 2016年 Leaves. All rights reserved.
//
#import "Masonry.h"
#import "ZhangHuGuanLiViewController.h"
#import "ZhangHuGuanLiCustomCell.h"
#import "ShangjiaZiLiaoViewController.h"
#import "ShangjiaziliaoTableViewCell.h"
#import "ShangdianmingViewController.h"

@interface ShangjiaZiLiaoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat bottomSpace;
    CGFloat detailHeight;
}
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) NSString      *datailString;
@property (nonatomic, strong) UINavigationController *navigationVC;
@end

@implementation ShangjiaZiLiaoViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    self.datailString = @"我就是爱赢还是分开的精神科来房间卡德罗斯交罚款了绝对是开发就考虑到是减肥快乐健康柯玛妮克聊什么呢付款了加拿大克里斯发生过德罗斯交罚款了绝对是开发就考虑到是减肥快乐健康柯玛妮克聊什么呢付款了加拿大克里斯发生";
    bottomSpace = 16;
    detailHeight = [NSAttributedString contentHeightWithText:self.datailString width:CoreWidth - 10 - 14 fontSize:12.0f lineSpacing:5.0f];
    NSLog(@"detailHeight = %f",detailHeight);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [UIView new];
    sectionView.backgroundColor = [UIColor lightGrayColor];

    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@""];
    [sectionView addSubview:imageView];
    
    return sectionView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    NSLog(@"bottomSpace+detailHeight+150 = %f",bottomSpace+detailHeight+150);
    return bottomSpace+detailHeight+150;
    
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ShangjiaziliaoTableViewCell";
    ShangjiaziliaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ShangjiaziliaoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *imageArray = @[@"ziliao_shanghuming",@"ziliao_fuzeren",@"ziliao_shenfenzhenghao",@"ziliao_yinhangka",@"ziliao_lianxifangshi",@"ziliao_dizhi"];
    NSArray *titleArray = @[@"商户名:",@"负责人:",@"身份证号码:",@"银行卡号:",@"联系方式:",@"地址:"];
    NSArray *textFieldArray = @[@"商店名称",@"王小明",@"请您填写身份证号码",@"8888888888888888",@"1583698888:",@"深圳市"];

    cell.iconImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
    cell.titleLabel.text = titleArray[indexPath.row];
    cell.textField.placeholder = textFieldArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.pushBlock) {
        self.pushBlock();
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIView *sectionFooterView = [UIView new];
    sectionFooterView.backgroundColor = KHexColor(@"#ebebeb");
    
    
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = [UIColor lightGrayColor];
    [sectionFooterView addSubview:imageView];
    
    
    
    
    UIView *footerView = [UIView new];
    footerView.layer.cornerRadius = 8;
    footerView.layer.masksToBounds = YES;
    footerView.backgroundColor = KHexColor(@"#ffffff");
    [sectionFooterView addSubview:footerView];
    
    
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(16);
    titleLabel.textColor = DeepColor;
    titleLabel.text = @"商家介绍";
    [footerView addSubview:titleLabel];
    
    
    UIView *line = [UIView new];
    line.backgroundColor = LineColor;
    [footerView addSubview:line];
    
    
    TTTAttributedLabel *detailLabel = [TTTAttributedLabel new];
    detailLabel.font = KFontSize(14);
    detailLabel.textColor = DeepColor;
    detailLabel.numberOfLines = 0;
    detailLabel.lineSpacing = 5;
    detailLabel.text = self.datailString;
    [footerView addSubview:detailLabel];
    
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sectionFooterView.mas_top).offset(0);
        make.left.equalTo(sectionFooterView.mas_left).offset(0);
        make.right.equalTo(sectionFooterView.mas_right).offset(0);
        make.height.equalTo(150);
    }];
    
    
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(7);
        make.left.equalTo(sectionFooterView.mas_left).offset(7);
        make.bottom.equalTo(sectionFooterView.mas_bottom).offset(0);
        make.right.equalTo(sectionFooterView.mas_right).offset(-7);
    }];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footerView.mas_top).offset(0);
        make.left.equalTo(footerView.mas_left).offset(10);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(16);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(5);
        make.left.equalTo(footerView.mas_left).offset(0);
        make.right.equalTo(footerView.mas_right).offset(0);
        make.height.equalTo(0.5);
    }];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(5);
        make.left.equalTo(footerView.mas_left).offset(10);
        make.right.equalTo(footerView.mas_right).offset(-10);
        make.bottom.equalTo(footerView.mas_bottom).offset(0);
    }];
    return sectionFooterView;
}
@end
