//
//  BaoBeiDiscribeVC.m
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "BaoBeiDiscribeVC.h"
#import "PlaceholderTextView.h"
@interface BaoBeiDiscribeVC ()
@property (nonatomic, strong) UITableView           *tableView;
@property (nonatomic, strong) UIView                *headerView;
@property (nonatomic, strong) UIButton              *button;
@end

@implementation BaoBeiDiscribeVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.title = @"宝贝描述";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.rowHeight = 45;
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    
    [self layoutHeaderViewUI];
}
- (void)layoutHeaderViewUI
{
    self.headerView = [UIView new];
    self.headerView.frame = CGRectMake(0, 0, CoreWidth, CoreHeight);
    self.headerView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.tableHeaderView = self.headerView;
    
    
    PlaceholderTextView *placeView = [[PlaceholderTextView alloc] initWithFrame: CGRectMake(5, 10, CoreWidth-10, 80)];
    placeView.placeholder = @"请输入商品标题";
    placeView.layer.cornerRadius = 5;
    placeView.layer.masksToBounds = YES;
    [self.headerView addSubview:placeView];
    
    
    
    UILabel *label = [UILabel new];
    label.textColor = LineColor;
    label.font = KFontSize(12);
    label.text = @"2/60";
    label.frame = CGRectMake(CoreWidth-60, 60, CoreWidth, 20);
    [placeView addSubview:label];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    self.button.layer.borderWidth = 1;
    self.button.layer.borderColor = BackgroundColor.CGColor;
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    [self.button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:_button];
    
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(placeView.mas_bottom).offset(30);
        make.left.equalTo(self.headerView.mas_left).offset(40);
        make.width.equalTo(CoreWidth-80);
        make.height.equalTo(40);
    }];

}
- (void)buttonClick
{
    
}
@end
