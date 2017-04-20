//
//  OMLocationProvinceVC.m
//  AiFuGou
//
//  Created by Michael on 16/6/21.
//  Copyright © 2016年 jumper. All rights reserved.
//



/*------------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface OMLocationProvinceModel : NSObject
@property (nonatomic, strong) NSString *provinceid;
@property (nonatomic, strong) NSString *province;
@property (nonatomic, strong) NSString *id;

- (instancetype) initWithDictionary:(NSDictionary *)dic;

@end

@interface OMLocationProvinceModel()

@end

@implementation OMLocationProvinceModel
- (instancetype) initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
        
        if ([dic objectForKey:@"province"]) {
            self.province = [dic objectForKey:@"province"];
        }
        if ([dic objectForKey:@"provinceid"]) {
            self.provinceid = [dic objectForKey:@"provinceid"];
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

@interface OMLocationProvinceCustomCell : UITableViewCell
@property (nonatomic, strong) OMLocationProvinceModel *provinceModel;
@end

@interface OMLocationProvinceCustomCell()

@property (nonatomic, strong) UIView                *line;
@property (nonatomic, strong) TTTAttributedLabel    *titleLabel;

@end

@implementation OMLocationProvinceCustomCell


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
- (void)setProvinceModel:(OMLocationProvinceModel *)provinceModel
{
    if (nil == provinceModel) {
        return;
    }
    self.titleLabel.text = provinceModel.province;
}
@end


/*------------------------------------------------------------------------------C----------------------------------------------------------------------------*/

#import "OMLocationProvinceVC.h"
#import "OMLocationCityVC.h"
@interface OMLocationProvinceVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) NSMutableArray    *dataArray ;
@end

@implementation OMLocationProvinceVC


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"选择省份";
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
                           @"method":@"rop.address.getprovinces"};
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            k_NSlogHUD(@"获取省份成功");
            
            NSArray *dataArr = [[content objectForKey:@"data"] objectForKey:@"info"];
            for (int i = 0; i<dataArr.count; i++) {
                
                OMLocationProvinceModel *model = [[OMLocationProvinceModel alloc] initWithDictionary:dataArr[i]];
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
    OMLocationProvinceCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[OMLocationProvinceCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.provinceModel = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OMLocationProvinceModel *model  = self.dataArray[indexPath.row];
    OMLocationCityVC *city = [OMLocationCityVC new];
    city.provinceString = model.provinceid;
    [self.navigationController pushViewController:city animated:YES];
}
@end
