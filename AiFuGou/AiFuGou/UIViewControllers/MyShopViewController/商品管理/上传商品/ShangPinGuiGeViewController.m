//
//  ShangPinGuiGeViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//
static NSString  *colorSection  = @"coloerSection";
static NSString  *colorItem     = @"colorItem";
static NSString  *sizeSection   = @"sizeSection";
static NSString  *sizeItem      = @"sizeItem";
#import "GuiGeCustomItem.h"
#import "Masonry.h"
/*------------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface SectionHeaderView : UIView
@property (nonatomic, strong) TTTAttributedLabel            *titleLabel;
@property (nonatomic, strong) UICollectionViewFlowLayout    *layoutColorSection;
@property (nonatomic, strong) UICollectionView              *collectionViewColorSection;
@property (nonatomic, strong) NSArray                       *titleArray;
@end

@interface SectionHeaderView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation SectionHeaderView


- (instancetype) initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = LightColor;
        self.titleLabel.backgroundColor = LineColor;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.layer.cornerRadius = 5;
        self.titleLabel.layer.masksToBounds = YES;
        self.titleLabel.text = @"自定义颜色";
        [self addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_top).offset(20);
            make.left.equalTo(self.mas_left).offset(20);
            make.width.equalTo(80);
            make.height.equalTo(30);
        }];
        
        self.layoutColorSection = [[UICollectionViewFlowLayout alloc] init];
        self.layoutColorSection.itemSize = CGSizeMake((CoreWidth-80)/3, 30);
        self.layoutColorSection.minimumLineSpacing = 10;
        self.layoutColorSection.minimumInteritemSpacing = 20;
        self.layoutColorSection.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
        [self.layoutColorSection setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        self.collectionViewColorSection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layoutColorSection];
        self.collectionViewColorSection.dataSource = self;
        self.collectionViewColorSection.delegate = self;
        self.collectionViewColorSection.backgroundColor = KHexColor(@"#ffffff");
        [self addSubview:_collectionViewColorSection];
        
        
        [self.collectionViewColorSection registerClass:[GuiGeCustomItem class] forCellWithReuseIdentifier:colorSection];
        
        
        [_collectionViewColorSection mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(40);
            make.left.equalTo(self.mas_left).offset(10);
            make.right.equalTo(self.mas_right).offset(-10);
            make.bottom.equalTo(self.mas_bottom).offset(0);
        }];

        
    }
    return self;
}
-(void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    NSLog(@" == %@",_titleArray);
}
#pragma mark ------------------------------------------------------------------UICollectionViewDelegateFlowLayout-------------------------------------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GuiGeCustomItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:colorSection forIndexPath:indexPath];
    cell.titleLabel.text = self.titleArray[indexPath.item];
    return cell;
    
}
@end

/*------------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface SectionFooterView : UIView
@property (nonatomic, strong) void(^extendBlock)();
@property (nonatomic, strong) UIButton    *downButton;

@end

@interface SectionFooterView()

@end

@implementation SectionFooterView


- (instancetype) initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.downButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.downButton.frame = CGRectMake(0, 0, CoreWidth, 30);
        self.downButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.downButton setImage:[UIImage imageNamed:@"arrow_right"] forState:UIControlStateNormal];
        [self.downButton addTarget:self action:@selector(downButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.downButton];
        
    }
    return self;
}
- (void)downButtonClick:(UIButton *)button
{
    if (self.extendBlock) {
        self.extendBlock();
    }
}
@end




/*------------------------------------------------------------------------------V----------------------------------------------------------------------------*/
#import "ShangPinGuiGeViewController.h"
#import "GuiGeCustomCell.h"
@interface ShangPinGuiGeViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    BOOL *_isOpen;
    GuiGeCustomCell *cell;
}
@property (nonatomic, strong) NSArray               *titleArray;
@property (nonatomic, strong) NSArray               *colorArray;

@property (nonatomic, strong) UITableView                   *tableView;

@property (nonatomic, strong) UICollectionViewFlowLayout    *layoutSizeSection;
@property (nonatomic, strong) UICollectionView              *collectionViewSizeSection;

@property (nonatomic, strong) UICollectionViewFlowLayout    *layoutSize;
@property (nonatomic, strong) UICollectionView              *collectionViewSize;
@property (nonatomic, strong) UICollectionViewFlowLayout    *layoutColor;
@property (nonatomic, strong) UICollectionView              *collectionViewColor;


@end

@implementation ShangPinGuiGeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    self.title = @"商品规格";
    self.titleArray = @[@"M",@"L",@"XL",@"XXL",@"XXXL",@"XXXXL"];
    self.colorArray = @[@"红色",@"橙色",@"黄色",@"绿色",@"蓝色",@"靛色"];

    _isOpen = malloc(sizeof(BOOL) *2);
    memset(_isOpen, 0, sizeof(BOOL) *2);
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];

}
#pragma mark ------------------------------------------------------  popoverActionsEnd--------------------------
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    headerView.backgroundColor = KHexColor(@"#ffffff");
    
    
    SectionHeaderView *headerSectionView = [SectionHeaderView new];
    headerSectionView.backgroundColor = KHexColor(@"#ffffff");
    headerSectionView.frame = CGRectMake(0, 0, CoreWidth, 120);
    
    if (0 == section) {
        headerSectionView.titleArray = self.titleArray;
    }
    else{
        headerSectionView.titleArray = self.colorArray;

    }
    
    [headerView addSubview:headerSectionView];
    
    
    NSArray *headerTitleArray = @[@"自定义颜色",@"自定义尺码"];
    headerSectionView.titleLabel.text = headerTitleArray[section];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerVeiw = [UIView new];
    footerVeiw.backgroundColor = KHexColor(@"#ffffff");
    
    SectionFooterView *footerViewSection = [SectionFooterView new];
    footerViewSection.frame = CGRectMake(0, 0, CoreWidth, 30);
    [footerVeiw addSubview:footerViewSection];
    
    [footerViewSection setExtendBlock:^{
        
        _isOpen[section] = !_isOpen[section];
        [_tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    return footerVeiw;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 500;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _isOpen[section] ? 1 : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"GuiGeCustomCell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[GuiGeCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *index = [self.tableView indexPathForCell:cell];
    NSLog(@"index ==%@",index);
}

//#pragma mark ------------------------------------------------------------------UICollectionViewDelegateFlowLayout-------------------------------------------------
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    
//    NSIndexPath *index = [self.tableView indexPathForCell:cell];
//    NSLog(@"index ==%@",index);
//    if (index.section == 0) {
//       return  self.titleArray.count;
//    }
//    else
//    {
//        return  self.colorArray.count;
//    }
////    return 0 == section ? self.titleArray.count : self.colorArray.count;
//}
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    GuiGeCustomItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:colorSection forIndexPath:indexPath];
//    
//    NSIndexPath *index = [_tableView indexPathForCell:[GuiGeCustomCell new]];
//    if (index.section == 0) {
//        item.titleLabel.text = self.titleArray[indexPath.item];
//    }
//    else
//    {
//        item.titleLabel.text = self.colorArray[indexPath.item];
//    }
//
////    cell.titleLabel.text =  0 == indexPath.section ?  self.titleArray[indexPath.item] : self.colorArray[indexPath.item];
//    return item;
//    
//}
//
@end
