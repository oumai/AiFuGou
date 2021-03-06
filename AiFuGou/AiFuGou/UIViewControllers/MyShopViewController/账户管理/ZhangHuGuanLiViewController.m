//
//  ZhangHuGuanLiViewController.m
//  AIFUGOU
//
//  Created by Minghui Sun on 16/5/15.
//  Copyright © 2016年 Leaves. All rights reserved.
//



#import "MyShopViewController.h"
#import "Masonry.h"
#import "ZhangHuGuanLiViewController.h"
#import "ZhangHuGuanLiCustomCell.h"


@interface ZhangHuGuanLiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ZhangHuGuanLiViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ZhangHuGuanLiCustomCell";
    ZhangHuGuanLiCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ZhangHuGuanLiCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *imageArray = @[@"iconfont-yue30-25",@"iconfont-tixian30-30",@"iconfont-chongzhi30-30",@"xiaofei30-30"];
    NSArray *titleArray = @[@"账户余额:",@"提现",@"购买积分",@"积分余额"];
    cell.iconImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
    cell.titleLabel.text = titleArray[indexPath.row];
    
    if (indexPath.row == 0) {
        cell.detailLabel.text = @"查看明细";
        //        cell.titleLabel.text = [NSString stringWithFormat:@"账户余额:%@",@"0.00"];
        cell.priceLabel.text = @"0.00";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.pushBlock) {
        self.pushBlock(indexPath.row);
    }
}
@end
