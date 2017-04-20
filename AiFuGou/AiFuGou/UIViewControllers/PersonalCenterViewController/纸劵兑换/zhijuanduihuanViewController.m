
//
//  zhijuanduihuanViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/23.
//  Copyright © 2016年 Leaves. All rights reserved.
//
#import "Masonry.h"
#import "zhijuanduihuanViewController.h"
#import "ZhiJuanDuiHuanCustomCell.h"
@interface zhijuanduihuanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView      *footerView;
@property (nonatomic, strong) UIButton    *button;
@end

@implementation zhijuanduihuanViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"纸券兑换";
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
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    [self.button setTitle:@"兑换" forState:UIControlStateNormal];
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
    
}
#pragma mark  - UITableViewDataSource & UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"HomePageCustomCell";
    ZhiJuanDuiHuanCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ZhiJuanDuiHuanCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray *imageArray = @[@"login_user",@"login_password"];
    NSArray *titleArray = @[@"号码:",@"密码:"];
    NSArray *textArray = @[@"请您输入积分卷账号",@"请您输入密码"];
    cell.iconImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
    cell.titleLabel.text = titleArray[indexPath.row];
    cell.textField.placeholder = textArray[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
@end