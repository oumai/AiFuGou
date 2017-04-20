//
//  TuWenXiangQingViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/22.
//  Copyright © 2016年 Leaves. All rights reserved.
//
#import "Masonry.h"
#import "TuWenXiangQingViewController.h"
#import "TechnicalParmetersCustomCell.h"
#import "ImagesCustomCell.h"

@interface TuWenXiangQingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) NSArray       *titleArray;
@property (nonatomic, strong) NSArray       *detailArray;
@property (nonatomic, strong) UIView        *footerTableView;
@property (nonatomic, strong) UIButton      *button;

@end

@implementation TuWenXiangQingViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"图文详情";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    self.titleArray = @[@"商品名称:",@"生产厂家:",@"品牌:",@"保质期:",@"产品重量"];
    self.detailArray = @[@"oumaiko.yahoo.com",@"yahoo",@"11",@"2015-02-2016-02",@"100g"];
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  section == 0 ? _titleArray.count : 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  indexPath.section == 0 ? 45 : 240;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        static NSString *identifier = @"TechnicalParmetersCustomCell";
        TechnicalParmetersCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (nil == cell) {
            cell = [[TechnicalParmetersCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.titleLabel.text = self.titleArray[indexPath.row];
        cell.detailLabel.text = self.detailArray[indexPath.row];
        return cell;

    }
    else
    {
        static NSString *identifier = @"ImagesCustomCell";
        ImagesCustomCell *cellI = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (nil == cellI) {
            cellI = [[ImagesCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cellI.iconImage.image = [UIImage imageNamed:@""];
        return cellI;
    }
   
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
