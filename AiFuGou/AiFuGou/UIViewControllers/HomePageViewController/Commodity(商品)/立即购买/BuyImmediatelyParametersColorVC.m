//
//  BuyImmediatelyParametersColorVC.m
//  AiFuGou
//
//  Created by Michael on 16/6/13.
//  Copyright © 2016年 jumper. All rights reserved.
//

static NSString *identifier = @"SizeCollectionViewItem";
#import "Masonry.h"
#import "BuyImmediatelyParametersColorVC.h"  ////
#import "SizeCollectionViewItem.h"
#import "HeaderReusableSizeView.h"

@interface BuyImmediatelyParametersColorVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray               *titleArray;
@property (nonatomic, strong) NSArray               *colorArray;
@property (nonatomic, strong) UIView                *bgView;     ///本页面分四部分两个View  两个CollectionView
@property (nonatomic, strong) UIImageView           *iconImage;
@property (nonatomic, strong) UIButton              *closeButton;
@property (nonatomic, strong) UILabel               *priceLabel;
@property (nonatomic, strong) UILabel               *titleChiMaCanShuLabel;



@property (nonatomic, strong) UICollectionViewFlowLayout    *layoutSize;
@property (nonatomic, strong) UICollectionView              *collectionViewSize;
@property (nonatomic, strong) UICollectionViewFlowLayout    *layoutColor;
@property (nonatomic, strong) UICollectionView              *collectionViewColor;


@property (nonatomic, strong) UIView                *fouthView;    //最下面的View
@property (nonatomic, strong) TTTAttributedLabel    *titleShuLiangLabelT;
@property (nonatomic, strong) TTTAttributedLabel    *shuLiangLabelT;
@property (nonatomic, strong) UIButton              *reduceButtonT;
@property (nonatomic, strong) UIButton              *addButtonT;
@property (nonatomic, strong) UIView                *LineT;
@property (nonatomic, strong) UIView                *LineT2;
@property (nonatomic, strong) UIButton              *button;

@end

@implementation BuyImmediatelyParametersColorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    
    self.titleArray = @[@"M",@"L",@"XL",@"XXL",@"XXXL",@"XXXXL"];
    self.colorArray = @[@"红色",@"橙色",@"黄色",@"绿色",@"蓝色",@"靛色",@"紫色",@"黑色",@"白色",@"银白",@"藏青"];

    self.bgView = [UIView new];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.frame = CGRectMake(0, 30, CoreWidth, 500-30);
    [self.view addSubview:_bgView];
    
    
    [self layoutFirstViewUI];
    [self layoutSizeCollectionViewUI];
    [self layouColorCollectionViewUI];
    [self layoutFouthViewUI];
}
- (void)buttonClick:(UIButton *)button
{
    if (self.dismissSimanPopoverViewController) {
        self.dismissSimanPopoverViewController(self);
    }
    
    
    if (self.sureButtonClick) {
        self.sureButtonClick(self);
    }
    
}
- (void)reduceButtonTClick:(UIButton *)button
{
    
}
- (void)addButtonTClick:(UIButton *)button
{
    
}
- (void)closeButtonTClick:(UIButton *)button
{
    
    if (self.dismissSimanPopoverViewController) {
        self.dismissSimanPopoverViewController(self);
    }
}

- (void)layouColorCollectionViewUI
{
    self.layoutColor = [[UICollectionViewFlowLayout alloc] init];
    self.layoutColor.itemSize = CGSizeMake((CoreWidth-50)/4, 30);
    self.layoutColor.minimumLineSpacing = 10;
    self.layoutColor.minimumInteritemSpacing = 10;
    [self.layoutColor setHeaderReferenceSize:CGSizeMake(CoreWidth, 30)];
    self.layoutColor.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    [self.layoutColor setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionViewColor = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layoutColor];
    self.collectionViewColor.dataSource = self;
    self.collectionViewColor.delegate = self;
    self.collectionViewColor.backgroundColor = KHexColor(@"#ffffff");
    [self.bgView addSubview:_collectionViewColor];
    
    
    [self.collectionViewColor registerClass:[SizeCollectionViewItem class] forCellWithReuseIdentifier:identifier];
    [self.collectionViewColor registerClass:[HeaderReusableSizeView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    
    [_collectionViewColor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionViewSize.mas_bottom).offset(0);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.height.equalTo(150);
    }];

}
- (void)layoutSizeCollectionViewUI
{
    self.layoutSize = [[UICollectionViewFlowLayout alloc] init];
    self.layoutSize.itemSize = CGSizeMake((CoreWidth-50)/4, 30);
    self.layoutSize.minimumLineSpacing = 10;
    self.layoutSize.minimumInteritemSpacing = 10;
    [self.layoutSize setHeaderReferenceSize:CGSizeMake(CoreWidth, 30)];
    self.layoutSize.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    [self.layoutSize setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionViewSize = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layoutSize];
    self.collectionViewSize.dataSource = self;
    self.collectionViewSize.delegate = self;
    self.collectionViewSize.backgroundColor = KHexColor(@"#ffffff");
    [self.bgView addSubview:_collectionViewSize];
    
    
    [self.collectionViewSize registerClass:[SizeCollectionViewItem class] forCellWithReuseIdentifier:identifier];
    [self.collectionViewSize registerClass:[HeaderReusableSizeView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    
    [_collectionViewSize mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImage.mas_bottom).offset(0);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.height.equalTo(120);
    }];

}

#pragma mark ------------------------------------------------------------------UICollectionViewDelegateFlowLayout-------------------------------------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return collectionView == _collectionViewSize ? self.titleArray.count : self.colorArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    
    if (collectionView == _collectionViewSize) {
        SizeCollectionViewItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        cell.titleLabel.text = self.titleArray[indexPath.item];
        return cell;

    }
    else
    {
        SizeCollectionViewItem *cellC = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        cellC.titleLabel.text = self.colorArray[indexPath.item];
        return cellC;

    }
}
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake((CoreWidth-70), 50);
//}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if (kind==UICollectionElementKindSectionHeader) {
        
        
        if (collectionView == _collectionViewSize) {
            HeaderReusableSizeView*headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
            headerView.titleLabel.text = @"尺码";
            return headerView;
        }
        else
        {
            HeaderReusableSizeView*headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
            headerView.titleLabel.text = @"颜色";
            return headerView;
        }
      
    }
    
    return nil;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    
}
- (void)layoutFirstViewUI
{
    self.iconImage = [UIImageView new];
    self.iconImage.layer.cornerRadius = 5;
    self.iconImage.layer.masksToBounds = YES;
    self.iconImage.layer.borderColor = KHexColor(@"#ffffff").CGColor;
    self.iconImage.layer.borderWidth = 5;
    self.iconImage.image = [UIImage imageNamed:@"iconImage"];
    self.iconImage.backgroundColor = [UIColor lightGrayColor];
    self.iconImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_iconImage];
    
    
    self.titleChiMaCanShuLabel = [TTTAttributedLabel new];
    self.titleChiMaCanShuLabel.font = KFontSize(14);
    self.titleChiMaCanShuLabel.textColor = DeepColor;
    self.titleChiMaCanShuLabel.textAlignment = NSTextAlignmentCenter;
    self.titleChiMaCanShuLabel.text = @"请选择  尺码   颜色";
    [self.bgView addSubview:_titleChiMaCanShuLabel];
    
    
    
    self.priceLabel = [TTTAttributedLabel new];
    self.priceLabel.font = KFontSize(14);
    self.priceLabel.textColor = BackgroundColor;
    self.priceLabel.textAlignment = NSTextAlignmentCenter;
    self.priceLabel.text = @"¥ 125.0";
    [self.bgView addSubview:_priceLabel];
    
    
    self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeButton setImage:[UIImage imageNamed:@"iconfont-cha28-28"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeButtonTClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:_closeButton];
    
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.width.equalTo(100);
        make.height.equalTo(100);
    }];
    [_titleChiMaCanShuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.iconImage.mas_bottom).offset(0);
        make.centerX.equalTo(self.bgView.mas_centerX).offset(35);
        make.width.equalTo(self.titleChiMaCanShuLabel.mas_width);
        make.height.equalTo(20);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImage.mas_centerY).offset(0);
        make.left.equalTo(self.iconImage.mas_right).offset(10);
        make.width.equalTo(60);
        make.height.equalTo(20);
    }];
    [_closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(5);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];

}

- (void)layoutFouthViewUI
{
    self.fouthView = [UIView new];
    self.fouthView.backgroundColor = KHexColor(@"#ffffff");
    [self.view addSubview:_fouthView];
    
    
    self.LineT = [UIView new];
    self.LineT.backgroundColor = LineColor;
    self.LineT.frame = CGRectMake(10, 0, CoreWidth, 0.5);
    [self.fouthView addSubview:_LineT];
    
    self.LineT2 = [UIView new];
    self.LineT2.backgroundColor = LineColor;
    self.LineT2.frame = CGRectMake(10, 40, CoreWidth, 0.5);
    [self.fouthView addSubview:_LineT2];
    
    
    
    self.titleShuLiangLabelT = [TTTAttributedLabel new];
    self.titleShuLiangLabelT.font = KFontSize(14);
    self.titleShuLiangLabelT.textColor = DeepColor;
    self.titleShuLiangLabelT.text = @"购买数量";
    [self.fouthView addSubview:_titleShuLiangLabelT];
    
    
    
    
    self.addButtonT = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButtonT setImage:[UIImage imageNamed:@"shangpin_add"] forState:UIControlStateNormal];
    [self.addButtonT addTarget:self action:@selector(addButtonTClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.fouthView addSubview:_addButtonT];
    
    
    
    self.shuLiangLabelT = [TTTAttributedLabel new];
    self.shuLiangLabelT.font = KFontSize(14);
    self.shuLiangLabelT.textColor = DeepColor;
    self.shuLiangLabelT.layer.cornerRadius = 10;
    self.shuLiangLabelT.layer.masksToBounds = YES;
    self.shuLiangLabelT.layer.borderWidth = 1;
    self.shuLiangLabelT.layer.borderColor = LightColor.CGColor;
    self.shuLiangLabelT.textAlignment = NSTextAlignmentCenter;
    self.shuLiangLabelT.text = @"10";
    [self.fouthView addSubview:_shuLiangLabelT];
    
    
    
    
    self.reduceButtonT = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.reduceButtonT setImage:[UIImage imageNamed:@"shangPin_reduce"] forState:UIControlStateNormal];
    [self.reduceButtonT addTarget:self action:@selector(reduceButtonTClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.fouthView addSubview:_reduceButtonT];
    
    
    
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    self.button.layer.borderWidth = 1;
    self.button.layer.borderColor = BackgroundColor.CGColor;
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    [self.button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:_button];
    
    
    [_fouthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-60);
        make.left.equalTo(self.view.mas_left).offset(7);
        make.right.equalTo(self.view.mas_right).offset(-7);
        make.height.equalTo(40);
        
    }];
    
    [_titleShuLiangLabelT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.fouthView.mas_centerY).offset(0);
        make.left.equalTo(self.fouthView.mas_left).offset(10);
        make.width.equalTo(self.titleShuLiangLabelT.mas_width);
        make.height.equalTo(14);
    }];
    [_addButtonT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.fouthView.mas_centerY).offset(0);
        make.right.equalTo(self.fouthView.mas_right).offset(-10);
        make.width.equalTo(20);
        make.height.equalTo(20);
    }];
    
    [_shuLiangLabelT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.fouthView.mas_centerY).offset(0);
        make.right.equalTo(self.addButtonT.mas_left).offset(-8);
        make.width.equalTo(60);
        make.height.equalTo(20);
    }];
    [_reduceButtonT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.fouthView.mas_centerY).offset(0);
        make.right.equalTo(self.shuLiangLabelT.mas_left).offset(-8);
        make.width.equalTo(20);
        make.height.equalTo(20);
    }];
    
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fouthView.mas_bottom).offset(10);
        make.left.equalTo(self.fouthView.mas_left).offset(40);
        make.width.equalTo(CoreWidth-80);
        make.height.equalTo(40);
    }];
    
}

@end
