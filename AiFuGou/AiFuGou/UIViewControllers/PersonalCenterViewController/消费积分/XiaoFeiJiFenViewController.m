//
//  XiaoFeiJiFenViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/22.
//  Copyright © 2016年 Leaves. All rights reserved.
//
#import "Masonry.h"
#import "XiaoFeiJiFenViewController.h"
#import "XiaoFeiJiFenCustomCell.h"
#import "KeduihuanjifenViewController.h"
@interface XiaoFeiJiFenViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UserInfoModel *user;
}
@property (nonatomic, strong) NSMutableArray    *dataArray;
@property (nonatomic, assign) NSInteger         SelectedPath;
@property (nonatomic, strong) UITableView       *tableView;

@end

@implementation XiaoFeiJiFenViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消费积分";
    user = [[UserInfoModel alloc] init];
    [self layoutTableViewUI];
    [self requestData];
   
}

- (void)layoutTableViewUI
{
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

}
- (void)requestData
{
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.points.get",
                           @"uid":[user getUserID]
                           };
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            
            NSString *consumePoints =  [[[[content objectForKey:@"data"] objectForKey:@"info"][0] objectForKey:@"consumePoints"] stringValue];//消费积分余额
            NSString *exchangePoints =  [[[[content objectForKey:@"data"] objectForKey:@"info"][0] objectForKey:@"exchangePoints"] stringValue];//兑换积分余额
            NSString *consumeAllPoints =  [[[[content objectForKey:@"data"] objectForKey:@"info"][0] objectForKey:@"consumeAllPoints"] stringValue];//累计消费积分余额
            NSString *exchangeAllPoints =  [[[[content objectForKey:@"data"] objectForKey:@"info"][0] objectForKey:@"exchangeAllPoints"] stringValue];//累计兑换积分余额
            self.dataArray = [[NSMutableArray alloc] initWithObjects:consumePoints, exchangePoints,consumeAllPoints,exchangeAllPoints, nil];
            
            [self.tableView reloadData];
        }
    } errorBlock:^(NSError *error) {
    }];
}

#pragma mark  - UITableViewDataSource & UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"HomePageCustomCell";
    XiaoFeiJiFenCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[XiaoFeiJiFenCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray *imageArray = @[@"iconfont-yue30-25",@"xiaofei30-30",@"iconfont-chongzhi30-30",@"iconfont-tixian30-30"];
    NSArray *titleArray = @[@"消费积分余额:",@"兑换积分余额:",@"累计消费积分余额:",@"累计兑换积分余额:"];
    cell.iconImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
    cell.titleLabel.text = titleArray[indexPath.row];
    cell.priceLabel.text = self.dataArray[indexPath.row];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *titleArray = @[@"消费积分余额:",@"兑换积分余额:",@"累计消费积分余额:",@"累计兑换积分余额:"];
    KeduihuanjifenViewController * vc = [[KeduihuanjifenViewController alloc]init];
    vc.titleString = titleArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
@end