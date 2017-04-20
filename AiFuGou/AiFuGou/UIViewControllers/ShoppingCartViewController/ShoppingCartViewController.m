//
//  ShoppingCartViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/1.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "Masonry.h"
#import "ShoppingCartViewController.h"
#import "ShopCartCustomCell.h"
#import "ShopCartSectionMoel.h"
#import "ShopCartModel.h"
#import "ShangPinViewController.h"
@interface ShoppingCartViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UserInfoModel *user;
}
@property (nonatomic, strong) NSMutableArray    *infoArray;
@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) UIView            *settleView;
@property (nonatomic, strong) UIButton          *chooseAllButton;
@property (nonatomic, strong) UIButton          *settleButton;
@property (nonatomic, strong) UILabel           *titleHeJiLabel;
@property (nonatomic, strong) UILabel           *heJiLabel;
@property (nonatomic, strong) UILabel           *buHanYunFei;
@end
@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutFooterViewUI];
    self.infoArray = [NSMutableArray array];
    user = [[UserInfoModel alloc] init];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.settleView.mas_top);
    }];
    
    //[self requestQueryShopCart];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.infoArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ShopCartCustomCell";
    ShopCartCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ShopCartCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    ShopCartSectionMoel *model = self.infoArray[indexPath.section];
    cell.shopModel = [model.product objectForKey:@"product"];
    
    NSLog(@"[model.product obje %@",[model.product objectForKey:@"product"]);
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        self.hidesBottomBarWhenPushed = YES;
        ShangPinViewController * vc = [[ShangPinViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
}
//查询购物车
- (void)requestQueryShopCart
{
    NSLog(@"[user getUserID] = %@",[user getUserID]);
    //status =0 购物车   =1收藏车
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.car.show",
                           @"customerid":[user getUserID],
                           @"status":@"0",
                           };
    [OMURLConnection requestAFNJSon:dic method:RequestUrl view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            
            k_yjHUD(@"查询购物车成功", self.view);
            NSLog(@"++++++++++++++++++++++");
            self.infoArray =  [ShopCartSectionMoel mj_objectArrayWithKeyValuesArray:[[content objectForKey:@"data"] objectForKey:@"info"]];
            NSLog(@"self.infoArray   =  %@",self.infoArray);
            
            [self.tableView reloadData];
        }
    } errorBlock:^(NSError *error) {
    }];
}
-(void)layoutFooterViewUI
{
    self.settleView = [UIView new];
    self.settleView.backgroundColor = KHexColor(@"#ffffff");
    [self.view addSubview:_settleView];
    
    
    
    [_settleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.equalTo(CoreWidth);
        make.height.equalTo(45);
    }];

    
    self.chooseAllButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.chooseAllButton.titleLabel.font = KFontSize(14);
    [self.chooseAllButton setImageEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 0)];
    [self.chooseAllButton setImage:[UIImage imageNamed:@"huiyuanhou"] forState:UIControlStateNormal];
    [self.chooseAllButton setTitle:@"全选" forState:UIControlStateNormal];
    [self.chooseAllButton setTitleColor:DeepColor forState:UIControlStateNormal];
    [self.chooseAllButton addTarget:self action:@selector(chooseAllButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.settleView addSubview:_chooseAllButton];
    
    [_chooseAllButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.settleView.mas_centerY).offset(5);
        make.left.equalTo(self.settleView.mas_left).offset(10);
        make.width.equalTo(60);
        make.height.equalTo(30);
    }];
    
    self.settleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.settleButton.titleLabel.font = KFontSize(14);
    [self.settleButton setTitle:@"结算（¥135）" forState:UIControlStateNormal];
    self.settleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.settleButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.settleButton addTarget:self action:@selector(settleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.settleButton setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.settleView addSubview:_settleButton];
    
    [_settleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.settleView.mas_centerY).offset(0);
        make.right.equalTo(self.settleView.mas_right).offset(0);
        make.width.equalTo(CoreWidth/3);
        make.bottom.equalTo(self.settleView.mas_bottom).offset(0);
    }];
    
    self.heJiLabel = [UILabel new];
    self.heJiLabel.textColor = BackgroundColor;
    self.heJiLabel.font = KFontSize(14);
    self.heJiLabel.text = @"¥ 135";
    [self.settleView addSubview:_heJiLabel];
    
    
    [_heJiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.settleView.mas_top).offset(8);
        make.right.equalTo(self.settleButton.mas_left).offset(-5);
        make.width.equalTo(self.heJiLabel.mas_width);
        make.height.equalTo(14);
    }];

    
    self.titleHeJiLabel = [UILabel new];
    self.titleHeJiLabel.textColor = KHexColor(@"#666666");
    self.titleHeJiLabel.font = KFontSize(14);
    self.titleHeJiLabel.text = @"合计:";
    [self.settleView addSubview:_titleHeJiLabel];
    
    
    [_titleHeJiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.settleView.mas_top).offset(8);
        make.right.equalTo(self.heJiLabel.mas_left).offset(-10);
        make.width.equalTo(self.titleHeJiLabel.mas_width);
        make.height.equalTo(14);
    }];

    
    self.buHanYunFei = [UILabel new];
    self.buHanYunFei.textColor = DeepColor;
    self.buHanYunFei.font = KFontSize(14);
    self.buHanYunFei.text = @"不含运费";
    [self.settleView addSubview:_buHanYunFei];
    
    
    [_buHanYunFei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.settleView.mas_bottom).offset(-8);
        make.right.equalTo(self.settleButton.mas_left).offset(-5);
        make.width.equalTo(self.heJiLabel.mas_width);
        make.height.equalTo(14);
    }];
}
-(void)chooseAllButtonClick:(UIButton *)button
{
    
}
-(void)settleButtonClick:(UIButton *)button
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
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
    sectionFooterView.backgroundColor = KHexColor(@"#ffffff");
    
    
    UIImageView *iconImage = [UIImageView new];
    iconImage.image = [UIImage imageNamed:@"ziliao_shanghuming"];
    [sectionFooterView addSubview:iconImage];
    
    
    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sectionFooterView.mas_bottom).offset(-20);
        make.left.equalTo(sectionFooterView.mas_left).offset(10);
        make.width.equalTo(14);
        make.height.equalTo(14);
    }];
    
    
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"arrow_right"];
    [sectionFooterView addSubview:imageView];
    
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconImage.mas_centerY).offset(0);
        make.right.equalTo(sectionFooterView.mas_right).offset(-10);
        make.width.equalTo(7);
        make.height.equalTo(14);
    }];
    
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(14);
    titleLabel.textColor = LightColor;
    titleLabel.text = @"时尚手机外壳超市";
    [sectionFooterView addSubview:titleLabel];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconImage.mas_centerY).offset(0);
        make.left.equalTo(iconImage.mas_right).offset(10);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    UIView *line = [UIView new];
    line.backgroundColor = LineColor;
    [sectionFooterView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(sectionFooterView.mas_bottom).offset(0);
        make.left.equalTo(sectionFooterView.mas_left).offset(0);
        make.right.equalTo(sectionFooterView.mas_right).offset(0);
        make.height.equalTo(0.5);
    }];
    
    return sectionFooterView;
}
@end
