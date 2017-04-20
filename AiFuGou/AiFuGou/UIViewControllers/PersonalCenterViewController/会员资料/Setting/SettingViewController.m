//
//  SettingViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/20.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingCustomCell.h"
#import "ModifyPasswordViewController.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) UIView        *headerView;
@property (nonatomic, strong) UIView        *footerView;
@property (nonatomic, strong) UIButton      *button;
@end

@implementation SettingViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置";
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layer.cornerRadius = 5;
    self.tableView.layer.masksToBounds = YES;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    
    self.footerView = [UIView new];
    self.footerView.backgroundColor = KHexColor(@"#ebebeb");
    self.footerView.frame = CGRectMake(0, 0, CoreWidth, 100);
    self.tableView.tableFooterView = self.footerView;
    
    
    self.headerView = [UIView new];
    self.headerView.backgroundColor = KHexColor(@"#ebebeb");
    self.headerView.frame = CGRectMake(0, 0, CoreWidth, 50);
    self.tableView.tableHeaderView = self.headerView;
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    [self.button setTitle:@"退出" forState:UIControlStateNormal];
    [self.button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.footerView addSubview:_button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.footerView.mas_centerY).offset(0);
        make.centerX.equalTo(self.footerView.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*2/3);
        make.height.equalTo(40);
    }];
    
}
- (void)buttonClick:(UIButton *)button
{
    [[NSNotificationCenter defaultCenter] postNotificationName:Exit object:nil userInfo:nil];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"SettingCustomCell";
    SettingCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[SettingCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray *imageArray = @[@"iconfont-xiugai26-30",@"iconfont-qingchuhuancun30-28"];// ,@"iconfont-chongzhi30-30",@"iconfont-tixian30-30"
    NSArray *titleArray = @[@"修改密码",@"清楚缓存"];
    cell.iconImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
    cell.titleLabel.text = titleArray[indexPath.row];
    
    
    if (indexPath.row == 1 ) {
        cell.priceLabel.text = @"13M";

    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    if (indexPath.row == 0) {
        ModifyPasswordViewController *vc = [ModifyPasswordViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
