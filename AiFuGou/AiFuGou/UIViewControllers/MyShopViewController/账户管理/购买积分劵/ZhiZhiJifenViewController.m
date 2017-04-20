//
//  ZhiZhiJifenViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/21.
//  Copyright © 2016年 Leaves. All rights reserved.
//
#import "Masonry.h"
#import "ZhiZhiJifenViewController.h"

@interface ZhiZhiJifenViewController ()<UITextFieldDelegate>
{
    UserInfoModel *user;
}
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) UIView        *headerView;
@property (nonatomic, strong) UIView        *line;
@property (nonatomic, strong) UIView        *cellView;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UITextField   *textField;
@property (nonatomic, strong) UIButton      *button;
@property (nonatomic, strong) TTTAttributedLabel       *titleLabel2;
@property (nonatomic, strong) TTTAttributedLabel       *titleLabel3;  //根据输入的积分 确定金额


@end

@implementation ZhiZhiJifenViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleString;
    user = [[UserInfoModel alloc] init];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
       
    [self layoutHeaderViewUI];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputTextChanged:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self.textField];
}
- (void)inputTextChanged:(NSNotification *)noti
{
    float monney = [self.textField.text floatValue]/625;
    NSLog(@"%@ uuuu%f    %f",self.textField.text,[self.textField.text floatValue],monney);
    self.titleLabel3.text = [NSString stringWithFormat:@"%.2f 元",monney];
}
- (void)buttonClick:(UIButton *)button
{
    //pid   查询积分类型的id（购买纸质积分券使用，购买电子积分不使用该字段）
    //fuid  用户id
    //buytype 1余额购买2银联
    //Aid   用户地址id（购买纸质积分券使用，购买电子积分不使用该字段）
    //type  1购买电子积分2购买纸质积分券
    //Value 积分数量（购买纸质积分券不使用）
    //Count 纸质积分券数量（购买电子积分券不使用）
    NSDictionary *jsonDic = nil;
    if ([self.title isEqualToString:@"购买纸质积分"]) {
        
        
        jsonDic = @{@"appKey":@"00001",
                    @"v":@"1.0",
                    @"format": @"json",
                    @"method":@"rop.points.buy",
                    @"Fuid":[user getUserID],
                    @"pid":@"1",
                    @"buytype":@"2",
                    @"Aid":@"2",
                    @"type":@"2",
                    @"Count":@""
                    };
        [self requestData:jsonDic];
    }
    if ([self.title isEqualToString:@"购买电子积分"]) {
        
        jsonDic = @{@"appKey":@"00001",
                    @"v":@"1.0",
                    @"format": @"json",
                    @"method":@"rop.points.buy",
                    @"Fuid":[user getUserID],
                    @"buytype":@"2",
                    @"value":self.textField.text,
                    @"type":@"1",
                    };
        [self requestData:jsonDic];
    }
}
//购买积分
- (void)requestData:(NSDictionary *)dic
{
   
    
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
- (void)layoutHeaderViewUI
{
    self.headerView = [UIView new];
    self.headerView.backgroundColor = KHexColor(@"#ebebeb");
    self.headerView.frame = CGRectMake(0, 0, CoreWidth, CoreHeight-64);
    self.tableView.tableFooterView = self.headerView;
    
    
    
    self.cellView = [UIView new];
    self.cellView.layer.cornerRadius = 5;
    self.cellView.layer.masksToBounds = YES;
    self.cellView.backgroundColor = KHexColor(@"#ffffff");
    [self.headerView addSubview:_cellView];
    
    
    self.line = [UIView new];
    self.line.backgroundColor = LineColor;
    [self.headerView addSubview:_line];
    
    
    self.titleLabel = [TTTAttributedLabel new];
    self.titleLabel.font = KFontSize(14);
    self.titleLabel.textColor = DeepColor;
    self.titleLabel.text = @"积分数量:";
    [self.headerView addSubview:_titleLabel];
    
    
    
    self.textField = [UITextField new];
    self.textField.placeholder = @"请输入想要购买的积分数量";
    self.textField.font = KFontSize(14);
    self.textField.textColor = LightColor;
    self.textField.delegate = self;
    [self.cellView  addSubview:_textField];
    
    
    
    
    self.titleLabel2 = [TTTAttributedLabel new];
    self.titleLabel2.font = KFontSize(14);
    self.titleLabel2.textColor = DeepColor;
    self.titleLabel2.text = @"金额:";
    [self.headerView addSubview:_titleLabel2];
    
    self.titleLabel3 = [TTTAttributedLabel new];
    self.titleLabel3.font = KFontSize(14);
    self.titleLabel3.textColor = BackgroundColor;
    self.titleLabel3.text = @"0.0";
    [self.headerView addSubview:_titleLabel3];
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    [self.button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:_button];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    
    [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(5);
        make.left.equalTo(self.headerView.mas_left).offset(10);
        make.height.equalTo(100);
        make.right.equalTo(self.headerView.mas_right).offset(-10);
        
    }];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
        make.left.equalTo(self.cellView.mas_left).offset(0);
        make.right.equalTo(self.cellView.mas_right).offset(0);
        make.height.equalTo(0.5);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(-25);
        make.left.equalTo(self.cellView.mas_left).offset(10);
        make.width.equalTo(70);
        make.height.equalTo(20);
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(-25);
        make.left.equalTo(self.titleLabel.mas_right).offset(0);
        make.width.equalTo(200);
        make.height.equalTo(18);
    }];
    
    [_titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(25);
        make.left.equalTo(self.cellView.mas_left).offset(10);
        make.width.equalTo(60);
        make.height.equalTo(18);
    }];
    
    
    [_titleLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(25);
        make.left.equalTo(self.titleLabel2.mas_right).offset(10);
        make.width.equalTo(100);
        make.height.equalTo(18);
    }];
    
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellView.mas_bottom).offset(50);
        make.centerX.equalTo(self.headerView.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*2/3);
        make.height.equalTo(40);
    }];
}
@end