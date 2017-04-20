//
//  GoumaijifenViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/21.
//  Copyright © 2016年 Leaves. All rights reserved.
//
#import "Masonry.h"
#import "GoumaijifenViewController.h"
#import "BuyJiFenCustomCell.h"
#import "GoumaijifenViewController.h"
#import "ZhiZhiJifenViewController.h"
#import "UserInfoModel.h"
@interface GoumaijifenViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UserInfoModel *user;
}
@property (nonatomic, assign)NSInteger SelectedPath;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation GoumaijifenViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购买积分";
    user = [[UserInfoModel alloc] init];
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
    [self requestData];
}
#pragma mark  - UITableViewDataSource & UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"BuyJiFenCustomCell";
    BuyJiFenCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[BuyJiFenCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray *imageArray = @[@"iconfont-chongzhi30-30",@"xiaofei30-30"];
    NSArray *titleArray = @[@"购买纸质积分:",@"购买电子积分:"];
    cell.iconImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
    cell.titleLabel.text = titleArray[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZhiZhiJifenViewController *vc = [ZhiZhiJifenViewController new];
    vc.titleString = indexPath.row == 0 ? @"购买纸质积分" : @"购买电子积分";
    [self.navigationController pushViewController:vc animated:YES];
}
//购买积分
- (void)requestData
{
    
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.points.buy.get",
                           @"uid":[user getUserID]};
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            
            
        }
        else
        {
        }
    } errorBlock:^(NSError *error) {
        
    }];
}

@end