//
//  ChooseLeiMuViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "ChooseLeiMuViewController.h"
#import "PaymentTermsCustomCell.h"
@interface ChooseLeiMuViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger           _selectedRow;
    
}
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) NSArray       *titleArray;
@property (nonatomic, strong) NSArray       *detailArray;
@property (nonatomic, strong) UIView        *footerTableView;
@property (nonatomic, strong) UIButton      *button;

@end

@implementation ChooseLeiMuViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = self.titleString;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    self.titleArray = @[@"衣服",@"鞋子",@"箱包配件",@"手机数码",@"妈咪宝贝",@"日用宝石",@"珠宝配饰",@"家电",@"护肤彩妆",@"家居建材",@"汽车车品"];
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
       _selectedRow=indexPath.row;
    [tableView reloadData];
}
@end
