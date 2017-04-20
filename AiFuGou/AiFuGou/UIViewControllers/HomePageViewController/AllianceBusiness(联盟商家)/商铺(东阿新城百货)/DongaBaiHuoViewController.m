//
//  DongaBaiHuoViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/22.
//  Copyright © 2016年 Leaves. All rights reserved.
//

static NSString *identifier = @"DongaBaiHuoCollectionViewCell";
#import "Masonry.h"
#import "DongaBaiHuoViewController.h"
#import "DongaBaiHuoCollectionViewCell.h"
#import "DongAXinChengBaiHuoModel.h"
#import "HeaderCollectionReusableView.h"
#import "FDAlertView.h"

#import "ShangPinViewController.h"
@interface DongaBaiHuoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,FDAlertViewDelegate>
@property (nonatomic, strong) NSMutableArray                *dataArray;
@property (nonatomic, strong) UICollectionViewFlowLayout    *layout;
@property (nonatomic, strong) UICollectionView              *collectionView;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@end

@implementation DongaBaiHuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.shopname;
    self.dataArray  =[NSMutableArray array];
    
    
    [self layoutBottomUI];
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.itemSize = CGSizeMake((CoreWidth)/2, 150);
    self.layout.minimumLineSpacing = 0;
    self.layout.minimumInteritemSpacing = 0;
    [self.layout setHeaderReferenceSize:CGSizeMake(320, 50)];
    [self.layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = KHexColor(@"#ebebeb");
    [self.view addSubview:_collectionView];
    
    [self.collectionView registerClass:[DongaBaiHuoCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.leftButton.mas_top).offset(0);
    }];
    [self requestData];
}
- (void)layoutBottomUI
{
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.tag = 101;
    self.leftButton.titleLabel.font = KFontSize(14);
    [self.leftButton setTitle:@"商铺信息" forState:UIControlStateNormal];
    [self.leftButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.leftButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#eca50c")] forState:UIControlStateNormal];
    [self.leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_leftButton];
    
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.equalTo(CoreWidth/2);
        make.height.equalTo(40);
    }];
    
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.tag = 102;
    self.rightButton.titleLabel.font = KFontSize(14);
    [self.rightButton setTitle:@"联系卖家" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.rightButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#f24818")] forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rightButton];
    
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.width.equalTo(CoreWidth/2);
        make.height.equalTo(40);
    }];

}
- (void)requestData
{
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.posts.get",
                           @"id":self.id};
    [OMURLConnection requestAFNJSon:dic method:@"http://jnlingyu.hicp.net:10298/Business/api" view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            NSLog(@"++++++++++++++++++++++");
            
            NSArray *dataArr = [[content objectForKey:@"data"] objectForKey:@"info"];
            for (int i = 0; i<dataArr.count; i++) {
                
                DongAXinChengBaiHuoModel *model = [[DongAXinChengBaiHuoModel alloc] initWithDictionary:dataArr[i]];
                [_dataArray addObject:model];
            }
            [_collectionView reloadData];
            
        }
        
    } errorBlock:^(NSError *error) {
        
    }];
    
}

- (void)buttonClick:(UIButton *)button
{
    
    if (button.tag == 101) {
        
    }
    if (button.tag == 102) {
        
        FDAlertView *alertView = [[FDAlertView alloc] initWithTitle:@"提示" icon:nil message:[NSString stringWithFormat:@"是否拨打电话%@",@"400800234"] delegate:self buttonTitles:@"取消",@"确定", nil];
        [alertView setTitleColor:DeepColor fontSize:14];
        [alertView setButtonTitleColor:BackgroundColor fontSize:14 atIndex:0];
        [alertView setButtonTitleColor:BackgroundColor fontSize:14 atIndex:1];
        [alertView show];
    }
}

- (void)alertView:(FDAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
    }
    if (buttonIndex == 1) {
        
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"400800234"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
}

#pragma mark ------------------------------------------------------------------UICollectionViewDelegateFlowLayout-------------------------------------------------
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(CoreWidth, 100);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DongaBaiHuoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.dongAModel = self.dataArray[indexPath.row];
    return cell;
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    HeaderCollectionReusableView*headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    headerView.headerViewImage.image = [UIImage imageNamed:@"iconImage"];
    headerView.headerViewImage.backgroundColor = [UIColor blueColor];
    return headerView;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DongAXinChengBaiHuoModel *model = self.dataArray[indexPath.row];
    ShangPinViewController *vc = [ShangPinViewController  new];
    vc.shopID               = self.id;
    vc.shopname             = self.shopname;
    vc.relname              = self.relname;
    vc.price                = model.price;
    vc.postContent          = model.postContent;
    vc.postTitle            = model.postTitle;
    vc.thumb                = model.thumb;
    vc.id                   = model.id;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
