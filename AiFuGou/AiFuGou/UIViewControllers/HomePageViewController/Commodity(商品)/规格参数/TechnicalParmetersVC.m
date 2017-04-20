//
//  TechnicalParmetersVC.m
//  AiFuGou
//
//  Created by Michael on 16/6/13.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "WYPopoverController.h"
#import "TechnicalParmetersVC.h"  ///
#import "TechnicalParmetersCustomCell.h"

@interface TechnicalParmetersVC ()<UITableViewDelegate,UITableViewDataSource,WYPopoverControllerDelegate>
@property (nonatomic, strong) WYPopoverController *simanPopoverController;
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) NSArray       *titleArray;
@property (nonatomic, strong) NSArray       *detailArray;
@property (nonatomic, strong) UIView        *footerTableView;
@property (nonatomic, strong) UIButton      *button;

@end

@implementation TechnicalParmetersVC


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    self.titleArray = @[@"商品名称:",@"生产厂家:",@"品牌:",@"保质期:",@"产品重量"];
    self.detailArray = @[@"oumaiko.yahoo.com",@"yahoo",@"11",@"2015-02-2016-02",@"100g"];
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
    [closeButton setImage:[UIImage imageNamed:@"iconfont-cha28-28"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeButtonTClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:closeButton];
    
    
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(20);
    titleLabel.textColor = DeepColor;
    titleLabel.text = @"产品规";
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
        make.right.equalTo(headerView.mas_right).offset(-10);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headerView.mas_centerY).offset(0);
        make.left.equalTo(headerView.mas_left).offset(10);
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
    static NSString *identifier = @"TechnicalParmetersCustomCell";
    TechnicalParmetersCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[TechnicalParmetersCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.titleLabel.text = self.titleArray[indexPath.row];
    cell.detailLabel.text = self.detailArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
}
- (void)closeButtonTClick:(UIButton *)button
{
    if (self.dismissSimanPopoverViewController) {
        self.dismissSimanPopoverViewController(self);
    }
}

#pragma mark - WYPopoverControllerDelegate

- (void)popoverControllerDidPresentPopover:(WYPopoverController *)controller
{
    NSLog(@"popoverControllerDidPresentPopover");
    
}

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller
{
    return NO;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller
{
    
    self.simanPopoverController.delegate = nil;
}

- (BOOL)popoverControllerShouldIgnoreKeyboardBounds:(WYPopoverController *)popoverController
{
    return NO;
}

- (void)popoverController:(WYPopoverController *)popoverController willTranslatePopoverWithYOffset:(float *)value
{
    // keyboard is shown and the popover will be moved up by 163 pixels for example ( *value = 163 )
    *value = 0; // set value to 0 if you want to avoid the popover to be moved
}
#pragma mark ------------------------------------------------------  popoverActionsEnd--------------------------
@end
