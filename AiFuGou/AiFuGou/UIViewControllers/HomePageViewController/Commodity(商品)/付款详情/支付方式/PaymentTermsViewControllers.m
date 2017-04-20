//
//  PaymentTermsViewControllers.m
//  AiFuGou
//
//  Created by Michael on 16/6/13.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "PaymentTermsViewControllers.h"
#import "PaymentTermsCustomCell.h"

@interface PaymentTermsViewControllers ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger           _selectedRow;

}
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) NSArray       *titleArray;
@property (nonatomic, strong) NSArray       *detailArray;
@property (nonatomic, strong) UIView        *footerTableView;
@property (nonatomic, strong) UIButton      *button;

@end

@implementation PaymentTermsViewControllers


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    self.titleArray = @[@"账户余额",@"银联支付",@"支付宝支付",@"微信支付"];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeaderView = [UIView new];
    sectionHeaderView.backgroundColor = KHexColor(@"#ebebeb");
    
    
    UIView *headerView = [UIView new];
    headerView.backgroundColor = KHexColor(@"#ffffff");
    [sectionHeaderView addSubview:headerView];
    
    
    UIView *line= [UIView new];
    line.backgroundColor = LineColor;
    line.frame = CGRectMake(0, 45, CoreWidth, 0.5);
    [headerView addSubview:line];
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setImage:[UIImage imageNamed:@"back_hui"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeButtonTClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:closeButton];
    
    
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(20);
    titleLabel.textColor = DeepColor;
    titleLabel.text = @"支付方式";
    titleLabel.verticalAlignment = TTTAttributedLabelVerticalAlignmentCenter;
    [headerView addSubview:titleLabel];
    
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sectionHeaderView.mas_top).offset(0);
        make.left.equalTo(sectionHeaderView.mas_left).offset(0);
        make.bottom.equalTo(sectionHeaderView.mas_bottom).offset(0);
        make.right.equalTo(sectionHeaderView.mas_right).offset(0);
        
    }];
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headerView.mas_centerY).offset(0);
        make.left.equalTo(headerView.mas_left).offset(10);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headerView.mas_centerY).offset(0);
        make.centerX.equalTo(headerView.mas_centerX).offset(0);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(20);
    }];
    
    return sectionHeaderView;
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"PaymentTermsCustomCell";
    PaymentTermsCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[PaymentTermsCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.titleLabel.text = self.titleArray[indexPath.row];
    
    if (indexPath.row == _selectedRow)
    {
        cell.arrowImage.image = [UIImage imageNamed:@"zhifu_xuanzhong"];
    }else
    {
        cell.arrowImage.image = [UIImage imageNamed:@"zhifu_meixuanzhong"];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dismissSimanPopoverViewController) {
        self.dismissSimanPopoverViewController(self);
    }
    _selectedRow=indexPath.row;
    [tableView reloadData];
}
- (void)closeButtonTClick:(UIButton *)button
{
    if (self.dismissSimanPopoverViewController) {
        self.dismissSimanPopoverViewController(self);
    }
}
@end
