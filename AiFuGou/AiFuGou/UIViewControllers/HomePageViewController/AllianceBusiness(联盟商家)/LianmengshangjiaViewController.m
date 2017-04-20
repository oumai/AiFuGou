//
//  LianmengshangjiaViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/22.
//  Copyright © 2016年 Leaves. All rights reserved.
//

/*------------------------------------------------------------------------------V----------------------------------------------------------------------------*/
#import "LianMengShangJiaModel.h"
#import "UIImageView+WebCache.h"
@interface LianmengshangjiaCustomCell : UITableViewCell
@property (nonatomic, strong) LianMengShangJiaModel  *lianMengModel;

@end
@interface LianmengshangjiaCustomCell()

@property (nonatomic, strong) UIView    *line;
@property (nonatomic, strong) TTTAttributedLabel   *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel   *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel   *phoneLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@end
@implementation LianmengshangjiaCustomCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor  = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.contentView addSubview:_line];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-1);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        
        
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"iconImage"];
        self.iconImage.layer.cornerRadius = 25;
        self.iconImage.layer.masksToBounds = YES;
        self.iconImage.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_iconImage];
        
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(00);
            make.width.equalTo(50);
            make.height.equalTo(50);
        }];
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = DeepColor;
        self.titleLabel.text = @"iphone 6s 手机壳";
        [self.contentView addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImage.mas_top).offset(5);
            make.left.equalTo(self.iconImage.mas_right).offset(15);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.font = KFontSize(14);
        self.detailLabel.textColor = LightColor;
        self.detailLabel.text = @"联系方式";
        [self.contentView addSubview:_detailLabel];
        
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconImage.mas_bottom).offset(-5);
            make.left.equalTo(self.iconImage.mas_right).offset(15);
            make.width.equalTo(self.detailLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.phoneLabel = [TTTAttributedLabel new];
        self.phoneLabel.font = KFontSize(14);
        self.phoneLabel.textColor = BackgroundColor;
        self.phoneLabel.text = @"1587";
        [self.contentView addSubview:_phoneLabel];
        
        
        [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconImage.mas_bottom).offset(-5);
            make.left.equalTo(self.detailLabel.mas_right).offset(10);
            make.width.equalTo(self.phoneLabel.mas_width);
            make.height.equalTo(14);
        }];
    }
    return self;
}
- (void)setLianMengModel:(LianMengShangJiaModel *)lianMengModel
{
    if (nil == lianMengModel) {
        return;
    }
    self.titleLabel.text = lianMengModel.shopname;
    self.phoneLabel.text = lianMengModel.conway;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:lianMengModel.thumb] placeholderImage:nil];
}
@end


#import "LianmengshangjiaViewController.h"
#import "DongaBaiHuoViewController.h"
#import "SearchShopViewController.h"
#define topInfoHeight 20
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define WHITECOLOR [UIColor whiteColor]


@interface LianmengshangjiaViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchControllerDelegate,UISearchResultsUpdating,UISearchBarDelegate>
@property (nonatomic ,strong) NSMutableArray        *dataArray;
@property (nonatomic ,strong) UITableView           *tableView;
@property (nonatomic, strong) UISearchController    *searchController;
@end

@implementation LianmengshangjiaViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)setCustomBar
{
    UIView *barView = [UIView new];
    barView.frame = CGRectMake(0, 0, CoreWidth, 64);
    barView.backgroundColor = BackgroundColor;
    [self.view addSubview:barView];
    
    UISearchBar *search = [[UISearchBar alloc] init];
    search.placeholder = @"";
    search.delegate = self;
    [search setBackgroundImage:[UIImage createImageWithColor:BackgroundColor]];
    [barView addSubview:search];
    
    
    
    [search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(barView.mas_top).offset(20);
        make.centerX.equalTo(barView.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*2/3);
        make.height.equalTo(44);
    }];
    
    
    
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setImage:[UIImage imageNamed:@"private_back"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:left];

    
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(barView.mas_left).offset(5);
        make.centerY.equalTo(search.mas_centerY).offset(0);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];

}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    SearchShopViewController *search = [[SearchShopViewController alloc] init];
    [self.navigationController pushViewController:search animated:YES];
    return YES;
}
- (void)leftButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = [NSMutableArray array];
    [self setCustomBar];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 60;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.bottom.right.equalTo(self.view);
    }];
    
//    //创建UISearchController
//    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
//    self.searchController.delegate = self; //设置代理
//    self.searchController.searchResultsUpdater= self;
//    self.searchController.searchBar.backgroundColor = BackgroundColor;
//    //设置UISearchController的显示属性，以下3个属性默认为YES
//    self.searchController.dimsBackgroundDuringPresentation = NO;    //搜索时，背景变暗色
//    self.searchController.obscuresBackgroundDuringPresentation = NO;//搜索时，背景变模糊
//    self.searchController.hidesNavigationBarDuringPresentation = NO;//隐藏导航栏
//    self.searchController.searchBar.frame = CGRectMake(0, 0, 100, 64.0);
//    self.tableView.tableHeaderView = self.searchController.searchBar; // 添加 searchbar 到 headerview
//    [self.view addSubview:_tableView];
    [self requestData];
}
- (void)requestData
{
    //获取商家列表
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.shop.get",
//                           @"city":,
//                             @"area":
                               };
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            NSLog(@"++++++++++++++++++++++");
            
            NSArray *dataArr = [[content objectForKey:@"data"] objectForKey:@"info"];
            for (int i = 0; i<dataArr.count; i++) {
                
                LianMengShangJiaModel *model = [[LianMengShangJiaModel alloc] initWithDictionary:dataArr[i]];
                [_dataArray addObject:model];
            }
            [_tableView reloadData];
        }
    } errorBlock:^(NSError *error) {
    }];
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"LianmengshangjiaCustomCell";
    LianmengshangjiaCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[LianmengshangjiaCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.lianMengModel = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LianMengShangJiaModel *model = self.dataArray[indexPath.row];
    DongaBaiHuoViewController *vc = [DongaBaiHuoViewController  new];
    vc.shopname = model.shopname;
    vc.relname  = model.relname;
    vc.id = model.id;
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UISearchControllerDelegate代理
//测试UISearchController的执行过程
- (void)willPresentSearchController:(UISearchController *)searchController
{
    NSLog(@"willPresentSearchController");
}

- (void)didPresentSearchController:(UISearchController *)searchController
{
    NSLog(@"didPresentSearchController");
}

- (void)willDismissSearchController:(UISearchController *)searchController
{
    NSLog(@"willDismissSearchController");
}

- (void)didDismissSearchController:(UISearchController *)searchController
{
    NSLog(@"didDismissSearchController");
}

- (void)presentSearchController:(UISearchController *)searchController
{
    NSLog(@"presentSearchController");
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSLog(@"updateSearchResultsForSearchController");
    NSString *searchString = [self.searchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
//    if (self.searchList!= nil) {
//        [self.searchList removeAllObjects];
//    }
//    //过滤数据
//    self.searchList= [NSMutableArray arrayWithArray:[_dataList filteredArrayUsingPredicate:preicate]];
//    //刷新表格
//    [self.tableView reloadData];
}

@end
