//
//  WodeshoucangViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/23.
//  Copyright © 2016年 Leaves. All rights reserved.
//
#import "Masonry.h"
#import "WodeshoucangViewController.h"
#import "MyHiddenCustomCell.h"
#import "UIImageView+WebCache.h"
@interface WodeshoucangViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UserInfoModel *user;
}

@property (nonatomic, strong) UITableView *tableView;

@end
@implementation WodeshoucangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的收藏";
    user = [[UserInfoModel alloc] init];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStyleGrouped)];
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    [self requestQueryShopHidden];
    
}
//查询购物车
- (void)requestQueryShopHidden
{
    //status =0 购物车   =1收藏车
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.car.show",
                           @"customerid":[user getUserID],
                           @"status":@"1",
                           };
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            
            k_yjHUD(@"查询收藏车成功", self.view);
            NSLog(@"++++++++++++++++++++++");
        }
    } errorBlock:^(NSError *error) {
    }];
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
    titleLabel.text = @"最近一个月收藏";
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
    static NSString *identifier = @"MyHiddenCustomCell";
    MyHiddenCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[MyHiddenCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    self.hidesBottomBarWhenPushed = YES;
    //    ShangPinViewController * vc = [[ShangPinViewController alloc]init];
    //    [self.navigationController pushViewController:vc animated:YES];
    //    self.hidesBottomBarWhenPushed = NO;
}
@end
