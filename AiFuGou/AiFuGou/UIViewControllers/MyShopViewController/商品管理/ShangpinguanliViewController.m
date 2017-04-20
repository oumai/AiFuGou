//
//  ShangpinguanliViewController.m
//  AIFUGOU
//
//  Created by Minghui Sun on 16/5/16.
//  Copyright © 2016年 Leaves. All rights reserved.
//
static NSString *identifier = @"ShangpinguanliCustomCellID";
#import "Masonry.h"
#import "MyShopViewController.h"
#import "ShangpinguanliViewController.h"
#import "ShangpinguanliCustomCell.h"
#import "HeaderCollectionReusableView.h"
@interface ShangpinguanliViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UITableView                   *tableView;
@property (nonatomic, strong) UICollectionViewFlowLayout    *layout;
@property (nonatomic, strong) UICollectionView              *collectionView;
@property (nonatomic, strong) UIButton                      *button;//上传商品

@end

@implementation ShangpinguanliViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"东阿新城百货";
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.itemSize = CGSizeMake((CoreWidth)/2, 150);
    self.layout.minimumLineSpacing = 0;
    self.layout.minimumInteritemSpacing = 0;
    [self.layout setHeaderReferenceSize:CGSizeMake(CoreWidth, 50)];
    [self.layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = KHexColor(@"#ebebeb");
    [self.view addSubview:_collectionView];
    
    [self.collectionView registerClass:[ShangpinguanliCustomCell class] forCellWithReuseIdentifier:identifier];
    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
    }];
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setTitle:@"上传产品" forState:UIControlStateNormal];
    [self.button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.equalTo(CoreWidth);
        make.height.equalTo(40);
    }];
}
- (void)buttonClick:(UIButton *)button
{
    
    if (self.pushBlock) {
        self.pushBlock(10000);
    }
}
#pragma mark ------------------------------------------------------------------UICollectionViewDelegateFlowLayout-------------------------------------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShangpinguanliCustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    __weak ShangpinguanliCustomCell*safeCell = cell;
    [safeCell setPushBlock:^() {
        
        if (self.pushBlock) {
            self.pushBlock(indexPath.item);
        }
    }];
    return cell;
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    HeaderCollectionReusableView*headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    headerView.headerViewImage.image = [UIImage imageNamed:@"iconImage"];
    headerView.headerViewImage.backgroundColor = [UIColor redColor];
    headerView.frame = CGRectMake(0, 0, CoreWidth, 200);
    return headerView;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//        OrderDetailViewController *vc = [OrderDetailViewController  new];
//        self.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
}

@end
