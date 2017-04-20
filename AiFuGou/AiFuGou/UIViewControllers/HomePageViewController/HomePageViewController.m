//
//  HomePageViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/1.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
#define identifierItem @"HomePageCollectionView"
@interface HomePageCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView   *imageView;
@end

@interface HomePageCollectionViewCell ()

@end

@implementation HomePageCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.imageView = [UIImageView new];
        [self.contentView addSubview:_imageView];
        
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).equalTo(0);
            make.left.equalTo(self.contentView.mas_left).equalTo(0);
            make.bottom.equalTo(self.contentView.mas_bottom).equalTo(0);
            make.right.equalTo(self.contentView.mas_right).equalTo(0);
        }];
        
        
    }
    return self;
}
@end

#import "HomePageViewController.h"
#import "ShangPinViewController.h"
#import "HomePageCustomCell.h"
#import "LianmengshangjiaViewController.h"
#import "LocationCityViewController.h"
#import "SearchViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>             //定位
#import "OMLocationProvinceVC.h"
@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,CLLocationManagerDelegate>
{
    UserInfoModel *user;
}

@property (nonatomic, strong) CLLocationManager   *locationManager;
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) UIView        *mainView;
@property (nonatomic, strong) UIScrollView  *ImageScroll;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UICollectionViewFlowLayout    *layout;
@property (nonatomic, strong) UICollectionView              *collectionView;

@property (nonatomic, strong) UILabel *cityLabel;  //城市（左）
@property (nonatomic, strong) NSString *latitudeLongString;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation HomePageViewController
- (void)setLeftCustom
{
    UIView *leftView = [UIView new];
    leftView.frame = CGRectMake(0, 0, 30, 42);
    [leftView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(locationTapClick)]];
    
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"location"];
    [leftView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftView.mas_top).offset(5);
        make.centerX.equalTo(leftView.mas_centerX).offset(0);
        make.width.equalTo(15);
        make.height.equalTo(20);
    }];
    
    self.cityLabel = [UILabel new];
    self.cityLabel.textColor = [UIColor whiteColor];
    self.cityLabel.font = KFontSize(12);
    self.cityLabel.text = @"济南";
    [leftView addSubview:self.cityLabel];
    
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(leftView.mas_bottom).offset(-5);
        make.centerX.equalTo(leftView.mas_centerX).offset(0);
        make.width.equalTo(self.cityLabel.mas_width);
        make.height.equalTo(12);
    }];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.cityLabel.text = [self.locationString length] == 0 ? [[NSUserDefaults standardUserDefaults] objectForKey:cityUserDefault]: self.locationString;
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:cityUserDefault]);
    
    NSLog(@"%@",self.tabBarController.tabBar.hidden?@"YES":@"NO");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftCustom];
    user = [[UserInfoModel alloc] init];
    
    NSLog(@"getUserID = %@",[user getUserID]);
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CoreWidth, CoreHeight) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    [self layoutLocation];
    [self layoutHeaderViewUI];
    //[self requestData];  //获取轮播图片
    
//    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(self.view);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
//    }];
}
//获取轮播
- (void)requestData
{
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.picture.get"};
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            
            NSLog(@"++++++++++++++++++++++");
        }
    } errorBlock:^(NSError *error) {
    }];
}
//获取地址
- (void)requestAddress:(NSString *)cityString
{
    
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.location.get",
                           @"location":self.latitudeLongString};
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            NSLog(@"++++++++++++++++++++++");
            
            NSArray *dataArr = [[content objectForKey:@"data"] objectForKey:@"info"];
            
            self.cityLabel.text = [[dataArr[0] objectForKey:@"city"] objectForKey:@"city"];
            [[NSUserDefaults standardUserDefaults] setObject:self.cityLabel.text forKey:cityUserDefault];
        }
        else
        {
            self.cityLabel.text = cityString;  //请求失败的时候
        }
    } errorBlock:^(NSError *error) {
        
    }];
}
#pragma mark -----------------------------------------------------------------------CLLocationManagerDelegate-------------------
- (void)layoutLocation
{
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = 10;
    [_locationManager requestAlwaysAuthorization];//添加这句
    [_locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currLocation = [locations lastObject];
    NSLog(@"纬度度=%f 经度=%f 高度=%f", currLocation.coordinate.latitude, currLocation.coordinate.longitude, currLocation.altitude);
    
    self.latitudeLongString = [NSString stringWithFormat:@"%.2f,%.2f",currLocation.coordinate.latitude,currLocation.coordinate.longitude];
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:currLocation completionHandler:^(NSArray *array, NSError *error)
     {
         NSString *city  = nil;
         if (array.count > 0)
         {
             CLPlacemark *placemark = [array objectAtIndex:0];
             city = placemark.locality;
             if (!city)
             {
                 //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                 city = placemark.administrativeArea;
             }
             NSLog(@"city = %@", city);
         }
         else if (error == nil && [array count] == 0)
         {
             NSLog(@"No results were returned.");
         }
         else if (error != nil)
         {
             NSLog(@"An error occurred = %@", error);
         }
         
         // 停止位置更新
         [manager stopUpdatingLocation];
         
         
         if ([[[NSUserDefaults standardUserDefaults] objectForKey:cityUserDefault] isEqualToString:city]) {
             
             self.cityLabel.text = city;
         }
         else
         {
             [self requestAddress:city];
         }

     }];
   
}
-(void)locationTapClick
{
    
//    LocationCityViewController *vc = [LocationCityViewController  new];
//    self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
//    
//    
//    
//    [vc setSucceed:^(NSString *str) {
//        
//        self.cityLabel.text = str;
//        
//        NSLog(@"%@",str);
//    }];
    
    OMLocationProvinceVC *vcM = [OMLocationProvinceVC  new];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vcM animated:YES];
    self.hidesBottomBarWhenPushed = NO;

    
//    SearchViewController *searchV = [[SearchViewController alloc]init];
//    self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:searchV animated:YES];
//    [searchV setSucceed:^(NSString *str) {
//        
//    }];
}
-(void)layoutHeaderViewUI
{
    
    self.mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CoreWidth,320)];
    [self.tableView setTableHeaderView:_mainView];
    
    self.ImageScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, CoreWidth, 155)];
    self.ImageScroll.tag = 1000;
    self.ImageScroll.pagingEnabled = YES;
    self.ImageScroll.delegate = self;
    self.ImageScroll.backgroundColor = [UIColor redColor];
    [self.mainView addSubview:_ImageScroll];
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 155-20, CoreWidth, 20)];
    //self.pageControl.currentPageIndicatorTintColor = blueTextColor;
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = 3;
    [self.pageControl addTarget:self action:@selector(pageControlDidPageChanged) forControlEvents:UIControlEventValueChanged];
    [self.mainView addSubview:_pageControl];
    
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.itemSize = CGSizeMake((CoreWidth-15)/2, 75);
    self.layout.minimumLineSpacing = 5;
    self.layout.minimumInteritemSpacing = 5;
    self.layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);  //定义每个的边距
    [self.layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 155, CoreWidth, 320-155) collectionViewLayout:_layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = KHexColor(@"#ebebeb");
    [self.mainView addSubview:_collectionView];
    
    [self.collectionView registerClass:[HomePageCollectionViewCell class] forCellWithReuseIdentifier:identifierItem];
    
    [self newADImage];
    
  }
-(void)newADImage{
    
    
    NSArray * imarr = @[@"banner1",@"guan_img",@"banner1"];
    for (int i=0; i<3; i++)
    {
        UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(i*CoreWidth, 0, CoreWidth, 155)];
        image.backgroundColor = [UIColor redColor];
        image.contentMode=UIViewContentModeScaleAspectFill;
        image.image = [UIImage imageNamed:imarr[i]];
        image.tag=i;
        image.userInteractionEnabled=YES;
        [_ImageScroll addSubview:image];
        _ImageScroll.contentSize = CGSizeMake(CoreWidth*4, 155);
    }
    _pageControl.numberOfPages=4;
    if (!_timer) {
        _timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(switchoverScrollV) userInfo:nil repeats:YES];
    }
}

#pragma mark  - UITableViewDataSource & UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"HomePageCustomCell";
    HomePageCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[HomePageCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
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
#pragma mark ------------------------------------------------------------------UICollectionViewDelegateFlowLayout-------------------------------------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierItem forIndexPath:indexPath];
    NSArray * imageArray =@[@"lianmeng",@"aifugou",@"shenghuofuwu",@"tongcheng"];
    cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LianmengshangjiaViewController *vc = [LianmengshangjiaViewController  new];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
#pragma mark  - 自动轮播
-(void)switchoverScrollV
{
    static int i=1;
    if (i<3)
    {
        [_ImageScroll setContentOffset:CGPointMake((i)*CoreWidth, 0) animated:YES];
        _pageControl.currentPage = i;
        i++;
    }
    else
    {
        i=0;
        [_ImageScroll setContentOffset:CGPointMake((i)*CoreWidth, 0) animated:NO];
        _pageControl.currentPage = i;
        i++;
    }
}
#pragma mark - ScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag==1000)
    {
        CGPoint point=[scrollView contentOffset];
        int n=(int)point.x/(CoreWidth);
        _pageControl.currentPage = n;
    }
}
-(void)pageControlDidPageChanged
{
    CGRect frame = _ImageScroll.frame;
    frame.origin.x = frame.size.width * _pageControl.currentPage;
    frame.origin.y = 0;
    [_ImageScroll scrollRectToVisible:frame animated:YES];
}
@end
