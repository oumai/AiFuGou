//
//  SearchShopViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/30.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*------------------------------------------------------------------------------V----------------------------------------------------------------------------*/
#import "LianMengShangJiaModel.h"
#import "UIImageView+WebCache.h"
@interface SearchShopViewCustomCell : UITableViewCell
@property (nonatomic, strong) LianMengShangJiaModel  *lianMengModel;

@end
@interface SearchShopViewCustomCell()

@property (nonatomic, strong) UIView    *line;
@property (nonatomic, strong) TTTAttributedLabel   *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel   *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel   *phoneLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@end
@implementation SearchShopViewCustomCell

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

#import "SearchShopViewController.h"
#import "DongaBaiHuoViewController.h"
@interface SearchShopViewController ()<UISearchBarDelegate>
{
    UISearchBar *search;
    UserInfoModel *user;
}
@property (strong  ,nonatomic)NSMutableArray *listArray;
@end

@implementation SearchShopViewController
- (void)setBarLeftItem
{
    NavigationBarBackgroundColor
    NSString * image = @"private_back";
    NSString * hImage = @"private_back";
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.titleLabel.font = KFontSize(14);
    [right setFrame:CGRectMake(0, 0, 60, 24)];
    [right setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [right setImage:[UIImage imageNamed:hImage] forState:UIControlStateHighlighted];
    right.imageEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);
    [right setTitle:@"" forState:UIControlStateNormal];
    right.titleEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0);
    [right addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:right];
}
- (void)leftButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBarLeftItem];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSearch];
    
    user = [[UserInfoModel alloc]init];
    self.listArray = [NSMutableArray new];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
-(void)createSearch{
    self.navigationItem.rightBarButtonItem = nil;
    search = [[UISearchBar alloc]initWithFrame:CGRectMake(40, -3, CoreWidth-40-20, 50)];
    search.tintColor=BaseColor;
    search.delegate = self;
    search.showsCancelButton = NO;
    search.barTintColor = [UIColor whiteColor];
    search.placeholder = @"搜索医院";
    [search becomeFirstResponder];
    UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithCustomView:search];
    self.navigationItem.rightBarButtonItem = searchBarItem;
}
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"] && text.length == 0)
    {
        return NO;
    }
    else if ([text isEqualToString:@"\n"])
    {
        [searchBar resignFirstResponder];
        [self getList:searchBar.text];
        return NO;
    }
    return YES;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self getList:searchText];
}

#pragma mark AFN
-(void)getList:(NSString *)string{
//    [self removeNoContent];
//    [ASURLConnection requestAFNJSon:@{@"keyword":string} method:kGetSearchHospital view:nil version:@"" completeBlock:^(NSData *data, id responseObject) {
//        if ([[ASURLConnection getMsg:responseObject]isEqual:@1]) {
//            NSArray *array = AFNdata;
//            if(array.count==0){
//                [self createNoContent:@"暂无医院" buttonTitle:nil view:self.view];
//            }
//            [self.listArray removeAllObjects];
//            for (int i = 0; i<array.count; i++) {
//                [hospital resignFirstResponder];
//                model = [ASAreaHospitalModel objectWithKeyValues:array[i]];
//                [self.listArray addObject:model];
//            }
//            [self.tableView reloadData];
//        }else{
//            k_NSlogHUD([ASURLConnection getMessage:responseObject])
//        }
//    } errorBlock:^(NSError *error) {
//        
//    }];
    [self requestData];
}
//获取地址
- (void)requestData
{
    
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.shop.get",
                           @"shopname":search.text,
                           @"city":@"",
                           @"area":@""
                               };
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            
            NSArray *dataArr = [[content objectForKey:@"data"] objectForKey:@"info"];
            [self.listArray removeAllObjects];
            for (int i = 0; i<dataArr.count; i++)
            {
                LianMengShangJiaModel *model = [[LianMengShangJiaModel alloc] initWithDictionary:dataArr[i]];
                [self.listArray addObject:model];
            }
            [self.tableView reloadData];
        }
        else
        {
        }
    } errorBlock:^(NSError *error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *idetifier = @"cell";
    
    SearchShopViewCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    
    if (!cell) {
        cell = [[SearchShopViewCustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifier];
    }
    cell.lianMengModel = self.listArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LianMengShangJiaModel *model = self.listArray[indexPath.row];
    DongaBaiHuoViewController *vc = [DongaBaiHuoViewController  new];
    vc.shopname = model.shopname;
    vc.relname  = model.relname;
    vc.id = model.id;
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
