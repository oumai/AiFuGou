//
//  xiangqingwomenViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/23.
//  Copyright © 2016年 Leaves. All rights reserved.
//
#import "Masonry.h"
#import "xiangqingwomenViewController.h"

@interface xiangqingwomenViewController ()<UITableViewDelegate>
{
    CGFloat bottomSpace;
    CGFloat detailHeight;
}
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) NSString      *datailString;
@end

@implementation xiangqingwomenViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"公司介绍";
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
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
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIView *sectionFooterView = [UIView new];
    sectionFooterView.backgroundColor = KHexColor(@"#ebebeb");
    
    
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = [UIColor lightGrayColor];
    [sectionFooterView addSubview:imageView];
    
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sectionFooterView.mas_top).offset(0);
        make.left.equalTo(sectionFooterView.mas_left).offset(0);
        make.right.equalTo(sectionFooterView.mas_right).offset(0);
        make.height.equalTo(150);
    }];
    
    
    UIView *footerView = [UIView new];
    footerView.layer.cornerRadius = 8;
    footerView.layer.masksToBounds = YES;
    footerView.backgroundColor = KHexColor(@"#ffffff");
    [sectionFooterView addSubview:footerView];
    
    
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(7);
        make.left.equalTo(sectionFooterView.mas_left).offset(7);
        make.bottom.equalTo(sectionFooterView.mas_bottom).offset(0);
        make.right.equalTo(sectionFooterView.mas_right).offset(-7);
        
    }];
    
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(16);
    titleLabel.textColor = DeepColor;
    titleLabel.text = @"公司介绍";
    [footerView addSubview:titleLabel];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footerView.mas_top).offset(0);
        make.left.equalTo(footerView.mas_left).offset(10);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(16);
    }];
    
    
    UIView *line = [UIView new];
    line.backgroundColor = LineColor;
    [footerView addSubview:line];
    
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(5);
        make.left.equalTo(footerView.mas_left).offset(0);
        make.right.equalTo(footerView.mas_right).offset(0);
        make.height.equalTo(0.5);
    }];
    
    
    TTTAttributedLabel *detailLabel = [TTTAttributedLabel new];
    detailLabel.font = KFontSize(14);
    detailLabel.textColor = DeepColor;
    detailLabel.numberOfLines = 0;
    detailLabel.lineSpacing = 5;
    detailLabel.text = self.datailString;
    [footerView addSubview:detailLabel];
    
    
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(5);
        make.left.equalTo(footerView.mas_left).offset(10);
        make.right.equalTo(footerView.mas_right).offset(-10);
        make.bottom.equalTo(footerView.mas_bottom).offset(0);
    }];
    return sectionFooterView;
}
@end
