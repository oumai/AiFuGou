//
//  TiXianViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/12.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "TiXianViewController.h"
#import "TiXianCustomCell.h"
@interface TiXianViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView      *footerView;
@property (nonatomic, strong) UIButton    *button;
@end

@implementation TiXianViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提现";
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
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
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
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 45;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIView *sectionFooterView = [UIView new];
    sectionFooterView.backgroundColor = KHexColor(@"#ebebeb");
    
    
    UIView *footerView = [UIView new];
    footerView.layer.cornerRadius = 5;
    footerView.layer.masksToBounds = YES;
    footerView.backgroundColor = KHexColor(@"#ffffff");
    [sectionFooterView addSubview:footerView];
    
    
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sectionFooterView.mas_top).offset(7);
        make.left.equalTo(sectionFooterView.mas_left).offset(7);
        make.bottom.equalTo(sectionFooterView.mas_bottom).offset(0);
        make.right.equalTo(sectionFooterView.mas_right).offset(-7);
        
    }];
    
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(14);
    titleLabel.textColor = DeepColor;
    titleLabel.text = @"金额";
    titleLabel.verticalAlignment = TTTAttributedLabelVerticalAlignmentCenter;
    [footerView addSubview:titleLabel];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(footerView.mas_centerY).offset(0);
        make.left.equalTo(footerView.mas_left).offset(10);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    UITextField *textField = [UITextField new];
    textField.textColor = BackgroundColor;
    textField.font = KFontSize(14);
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.placeholder = @"请输入金额";
    [footerView addSubview:textField];
    
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(footerView.mas_centerY).offset(0);
        make.left.equalTo(titleLabel.mas_right).offset(10);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
    return sectionFooterView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"HomePageCustomCell";
    TiXianCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[TiXianCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
   
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    KeduihuanjifenViewController * vc = [[KeduihuanjifenViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
}
@end