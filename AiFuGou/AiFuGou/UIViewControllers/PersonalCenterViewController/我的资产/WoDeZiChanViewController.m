//
//  WoDeZiChanViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/23.
//  Copyright © 2016年 Leaves. All rights reserved.
//

#import "Masonry.h"
#import "WoDeZiChanViewController.h"
#import "MyPropertyCustomCell.h"
@interface WoDeZiChanViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end
@implementation WoDeZiChanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleString;
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStyleGrouped)];
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
}
#pragma mark  - UITableViewDataSource & UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionFooterView = [UIView new];
    sectionFooterView.backgroundColor = KHexColor(@"#ebebeb");
    
    
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(15);
    titleLabel.textColor = LightColor;
    titleLabel.text = @"2016-03";
    [sectionFooterView addSubview:titleLabel];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sectionFooterView.mas_centerY).offset(0);
        make.left.equalTo(sectionFooterView.mas_left).offset(10);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(15);
    }];
    
    
    return sectionFooterView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"MyPropertyCustomCell";
    MyPropertyCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[MyPropertyCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}
@end
