
//
//  OrderDetailViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "OrderDetailViewController.h"
#import "OrderDetailCustomCell.h"
#import "OrderDetailModel.h"
@interface OrderDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView           *tableView;
@property (nonatomic, strong) NSDictionary          *infoDic;

@end

@implementation OrderDetailViewController

- (void)layoutModel
{
    
    //    NSArray *imageArray = @[@"ziliao_fuzeren",@"ziliao_lianxifangshi",@"tuijian30-30",@"ziliao_erweima",@"ziliao_dizhi",@"iconfont-shezhi"];//
    //    NSArray *titleArray = @[@"用户名:",@"手机号:",@"推荐人:",@"我的二维码:",@"收货地址:",@"设置:"];
    
    OrderDetailModel *model = [OrderDetailModel new];
    model.titleString = @"商品名称:";
    model.detailString = @"烟台苹果";
    
    OrderDetailModel *model2 = [OrderDetailModel new];
    model2.titleString = @"订单号:";
    model2.detailString = @"395555555555";
    
    OrderDetailModel *model3 = [OrderDetailModel new];
    model3.titleString = @"数量:";
    model3.detailString = @"20";
    
    
    OrderDetailModel *model4 = [OrderDetailModel new];
    model4.titleString = @"价格:";
    model4.detailString = @"125";
    
    OrderDetailModel *model5 = [OrderDetailModel new];
    model5.titleString = @"买家留言:";
    model5.detailString = @"白色衬衫  178cm 70kg";
    
    OrderDetailModel *model6 = [OrderDetailModel new];
    model6.titleString = @"联系人:";
    model6.detailString = @"王大炮";
    
    OrderDetailModel *model7 = [OrderDetailModel new];
    model7.titleString = @"联系电话:";
    model7.detailString = @"13999999999";
    
    
    
    OrderDetailModel *model8 = [OrderDetailModel new];
    model8.titleString = @"收货地址:";
    model8.detailString = @"香港中环置地广场";
    
    
    OrderDetailModel *model9 = [OrderDetailModel new];
    model9.titleString = @"订单时间:";
    model9.detailString = @"2016-06-26 12:00";
    
    
    OrderDetailModel *modela = [OrderDetailModel new];
    modela.titleString = @"付款时间:";
    modela.detailString = @"2016-06-26 14:00";
    
    _infoDic = @{@"0":@[model,model2,model3,model4],
                 @"1":@[model5],
                 @"2":@[model6,model7,model8],
                 @"3":@[model9,modela]
                 };
    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.title = @"订单详情";
    [self layoutModel];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _infoDic.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionKey = [@(section) stringValue];
    NSArray *array = _infoDic[sectionKey];
    return array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 70;
    }
    else
    {
        return 45;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"OrderDetailCustomCell";
    OrderDetailCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[OrderDetailCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSString *setionKey = [@(indexPath.section) stringValue];
    NSArray *array = _infoDic[setionKey];
    cell.orderModel = array[indexPath.row];
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        
//        //头像这一行（第一行）
//        self.headerImage = [UIImageView new];
//        self.headerImage.layer.cornerRadius = 30;
//        self.headerImage.layer.masksToBounds = YES;
//        self.headerImage.image = [UIImage imageNamed:@"iconImage"];
//        self.headerImage.backgroundColor = [UIColor lightGrayColor];
//        [cell addSubview:_headerImage];
//        
//        [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(cell.mas_right).offset(-30);
//            make.centerY.equalTo(cell.mas_centerY).offset(0);
//            make.width.equalTo(60);
//            make.height.equalTo(60);
//        }];
//        cell.headerLabel.text = @"头像";
    }
    return cell;
}
@end
