//
//  OMLocationCityVC.m
//  AiFuGou
//
//  Created by Michael on 16/6/22.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*------------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface OMLocationCityModel : NSObject
@property (nonatomic, strong) NSString *cityid;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *id;

- (instancetype) initWithDictionary:(NSDictionary *)dic;

@end

@interface OMLocationCityModel()

@end

@implementation OMLocationCityModel
- (instancetype) initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
        
        if ([dic objectForKey:@"city"]) {
            self.city = [dic objectForKey:@"city"];
        }
        if ([dic objectForKey:@"cityid"]) {
            self.cityid = [dic objectForKey:@"cityid"];
        }
        else if ([[dic objectForKey:@"id"] isKindOfClass:[NSNumber class]])
        {
            self.id = [[dic objectForKey:@"id"] stringValue];
        }
        
        
    }
    return self;
}
@end
/*------------------------------------------------------------------------------V----------------------------------------------------------------------------*/

@interface OMLocationCityCustomCell : UITableViewCell
@property (nonatomic, strong) OMLocationCityModel *cityModel;
@end

@interface OMLocationCityCustomCell()

@property (nonatomic, strong) UIView                *line;
@property (nonatomic, strong) TTTAttributedLabel    *titleLabel;

@end

@implementation OMLocationCityCustomCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = KHexColor(@"#ebebeb");
        
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.contentView addSubview:_line];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = DeepColor;
        [self.contentView addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(15);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
    }
    return self;
}
- (void)setCityModel:(OMLocationCityModel *)cityModel
{
    if (nil == cityModel) {
        return;
    }
    self.titleLabel.text = cityModel.city;
}
@end


/*------------------------------------------------------------------------------C----------------------------------------------------------------------------*/

#import "OMLocationCityVC.h"
#import "HomePageViewController.h"
@interface OMLocationCityVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) NSMutableArray    *dataArray ;
@end

@implementation OMLocationCityVC


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"选择城市";
    self.view.backgroundColor = [UIColor blueColor];
    self.dataArray = [NSMutableArray array];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    [self requestProvince];
}
//获取省份
- (void)requestProvince
{
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.address.getcity",
                           @"province":self.provinceString};
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            k_NSlogHUD(@"获取城市成功");
            
            NSArray *dataArr = [[content objectForKey:@"data"] objectForKey:@"info"];
            for (int i = 0; i<dataArr.count; i++) {
                
                OMLocationCityModel *model = [[OMLocationCityModel alloc] initWithDictionary:dataArr[i]];
                [self.dataArray addObject:model];
            }
            [_tableView reloadData];
        }
    } errorBlock:^(NSError *error) {
    }];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"OMLocationProvinceCustomCell";
    OMLocationCityCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[OMLocationCityCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.cityModel = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OMLocationCityModel *model = self.dataArray[indexPath.row];
    for (HomePageViewController *vc in self.navigationController.viewControllers ) {
        if ([vc isKindOfClass:[HomePageViewController class]]) {
            [self.navigationController popToViewController:vc animated:YES];
            vc.locationString = model.city;
        }
    }
}
@end
