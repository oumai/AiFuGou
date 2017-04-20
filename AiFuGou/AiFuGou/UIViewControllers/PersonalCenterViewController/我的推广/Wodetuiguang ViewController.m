//
//  Wodetuiguang ViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/22.
//  Copyright © 2016年 Leaves. All rights reserved.
//
#import "Masonry.h"
#import "Wodetuiguang ViewController.h"
#import "WoDeTuiGuangCustomCell.h"

#import "TanKuangView.h"
@interface Wodetuiguang_ViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
{
    UserInfoModel *user;
}
@property (nonatomic, strong) NSMutableArray     *dataArray;
@property (nonatomic, strong) NSString           *currentTime;
@property (nonatomic, strong) UITableView        *tableView;
@property (nonatomic, strong) UIView             *headerView;
@property (nonatomic, strong) UIView             *changeDateView;
@property (nonatomic, strong) UIView             *titleView;
@property (nonatomic, strong) TTTAttributedLabel *yongHuMingLabel;
@property (nonatomic, strong) TTTAttributedLabel *jiBiewLabel;
@property (nonatomic, strong) TTTAttributedLabel *timeLabel;
@property (nonatomic, strong) TTTAttributedLabel *shouJiHaoLabel;

@property (nonatomic, strong) UITapGestureRecognizer *tap;  //弹框
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, strong) TanKuangView *tan;
@end

@implementation Wodetuiguang_ViewController

- (void)rightImageClick
{
    self.tan.hidden = NO;
    
}


- (void)tapClickTanRemoveFrom
{
    [_tan removeFromSuperview];
    [self.view removeGestureRecognizer:_tap];
    self.isOpen = NO;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的推广";
    self.view.backgroundColor = KHexColor(@"#ffffff");
    self.dataArray = [NSMutableArray array];
    user = [[UserInfoModel alloc] init];
    self.isOpen = NO;
    [self setRightItemImage:@"tuiguang_right"];
    [self layoutHeaderViewUUI];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).offset(0);
        make.left.bottom.right.equalTo(self.view);
    }];
    [self layoutTanKuangViewUI];
    //[self requestData];
}
- (void)layoutTanKuangViewUI
{
    self.tan = [[TanKuangView alloc] init];
    self.tan.navigation = self.navigationController;
    self.tan.frame = CGRectMake(CoreWidth-100, 64, 100, 160);
    self.tan.hidden = YES;
    [self.view addSubview:_tan];
    
    __weak TanKuangView *isOp = self.tan;
    [isOp setTankuangDismissBlock:^(NSInteger index) {
        
        self.tan.hidden = YES;
        self.isOpen = NO;
        
        if (index == 0) {
            
            
        }
        else if (index == 1)
        {
            
        }
        else if (index == 2)
        {
            
        }
        else if (index == 3)
        {
            
        }

    }];
}
- (void)layoutHeaderViewUUI  //title
{
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, CoreWidth, 50)];
    self.headerView.backgroundColor = KHexColor(@"#ebebeb");
    [self.view addSubview:_headerView];
    
    
    self.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, CoreWidth, 45)];
    self.titleView.backgroundColor = KHexColor(@"#fffffff");
    [self.headerView addSubview:_titleView];
    
    
    self.yongHuMingLabel = [TTTAttributedLabel new];
    self.yongHuMingLabel.textColor = DeepColor;
    self.yongHuMingLabel.font = KFontSize(14);
    self.yongHuMingLabel.text = @"用户名";
    [self.titleView addSubview:_yongHuMingLabel];
    
    
    [_yongHuMingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleView.mas_centerY).offset(0);
        make.left.equalTo(self.titleView.mas_left).offset(15);
        make.width.equalTo(self.yongHuMingLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    self.jiBiewLabel = [TTTAttributedLabel new];
    self.jiBiewLabel.textColor = DeepColor;
    self.jiBiewLabel.font = KFontSize(14);
    self.jiBiewLabel.text = @"级别";
    [self.titleView addSubview:_jiBiewLabel];
    
    
    [_jiBiewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleView.mas_centerY).offset(0);
        make.centerX.equalTo(self.titleView.mas_centerX).offset(-50);
        make.width.equalTo(self.jiBiewLabel.mas_width);
        make.height.equalTo(14);
    }];

    
    self.timeLabel = [TTTAttributedLabel new];
    self.timeLabel.textColor = DeepColor;
    self.timeLabel.font = KFontSize(14);
    self.timeLabel.text = @"时间";
    [self.titleView addSubview:_timeLabel];
    
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleView.mas_centerY).offset(0);
        make.centerX.equalTo(self.titleView.mas_centerX).offset(30);
        make.width.equalTo(self.timeLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    self.shouJiHaoLabel = [TTTAttributedLabel new];
    self.shouJiHaoLabel.textColor = DeepColor;
    self.shouJiHaoLabel.font = KFontSize(14);
    self.shouJiHaoLabel.text = @"手机号";
    [self.titleView addSubview:_shouJiHaoLabel];
    
    
    [_shouJiHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleView.mas_centerY).offset(0);
        make.centerX.equalTo(self.titleView.mas_right).offset(-40);
        make.width.equalTo(self.shouJiHaoLabel.mas_width);
        make.height.equalTo(14);
    }];
}

#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    WoDeTuiGuangCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[WoDeTuiGuangCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    //cell.tuiGuangModel = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.tan.hidden = YES;
    
}
#pragma mark ------------------------------------------------------------------ASURLConnection ----------------------------------------------------------------
- (void)requestData
{
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.spread.get",
                           @"uid":[user getUserID]
                           };
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            
            NSArray *dataArr =  [[content objectForKey:@"data"] objectForKey:@"info"];//
            
            for (int i = 0; i<dataArr.count; i++) {
                WoDeTuiGuangModel *model  = [[WoDeTuiGuangModel  alloc] initWithDictionary:dataArr[i]];
                [self.dataArray addObject:model];
            }
            [self.tableView reloadData];
        }
    } errorBlock:^(NSError *error) {
    }];
}
@end

