//
//  UpdateCommoditiesViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "UpdateCommoditiesViewController.h"
#import "UpdateCommoditiesCustomCell.h"
#import "UpdateCommoditiesModel.h"
#import "PlaceholderTextView.h"


#import "ChooseLeiMuViewController.h"  //选择类目  //鞋子内里 材质  //鞋面材质
#import "BaoBeiDiscribeVC.h"           //宝贝描述
#import "ShangPinGuiGeViewController.h"//商品规格
@interface UpdateCommoditiesViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, strong) UITableView           *tableView;
@property (nonatomic, strong) UIView                *headerView;
@property (nonatomic, strong) NSDictionary          *infoDic;
@property (nonatomic, strong) UIImageView           *headerImage;
@property (nonatomic, strong) UIButton              *button;
@end

@implementation UpdateCommoditiesViewController

- (void)layoutModel
{
    
    //    NSArray *imageArray = @[@"ziliao_fuzeren",@"ziliao_lianxifangshi",@"tuijian30-30",@"ziliao_erweima",@"ziliao_dizhi",@"iconfont-shezhi"];//
    //    NSArray *titleArray = @[@"用户名:",@"手机号:",@"推荐人:",@"我的二维码:",@"收货地址:",@"设置:"];
    UpdateCommoditiesModel *model = [UpdateCommoditiesModel new];
    model.titleString = @"类目";
    model.detailString = @"";
    model.rightImageString = @"arrow_right";
    model.cls = [ChooseLeiMuViewController class];
    
    UpdateCommoditiesModel *model2 = [UpdateCommoditiesModel new];
    model2.titleString = @"品牌";
    model2.detailString = @"";
    model2.rightImageString = @"arrow_right";
    model2.cls = nil;

    
    
    UpdateCommoditiesModel *model3 = [UpdateCommoditiesModel new];
    model3.titleString = @"鞋面材质";
    model3.detailString = @"";
    model3.rightImageString = @"arrow_right";
    model3.cls = [ChooseLeiMuViewController class];
    
    
    UpdateCommoditiesModel *model4 = [UpdateCommoditiesModel new];
    model4.titleString = @"鞋面内里材料";
    model4.detailString = @"";
    model4.rightImageString = @"arrow_right";
    model4.cls = [ChooseLeiMuViewController class];
    
    UpdateCommoditiesModel *model5 = [UpdateCommoditiesModel new];
    model5.titleString = @"商品规格（可选）";
    model5.detailString = @"";
    model5.rightImageString = @"arrow_right";
    model5.cls = [ShangPinGuiGeViewController class];
    
    UpdateCommoditiesModel *model6 = [UpdateCommoditiesModel new];
    model6.titleString = @"原价";
    model6.detailString = @"";
    model6.rightImageString = @"iconfont-icon23-28";
    model6.cls = nil;
    
    
    UpdateCommoditiesModel *model7 = [UpdateCommoditiesModel new];
    model7.titleString = @"现价";
    model7.detailString = @"";
    model7.rightImageString = @"iconfont-icon23-28";
    model7.cls = nil;
    
    UpdateCommoditiesModel *model8 = [UpdateCommoditiesModel new];
    model8.titleString = @"费用";
    model8.detailString = @"";
    model8.rightImageString = @"iconfont-icon23-28";
    model8.cls = nil;
    
    
    UpdateCommoditiesModel *model9 = [UpdateCommoditiesModel new];
    model9.titleString = @"宝贝描述";
    model9.detailString = @"";
    model9.rightImageString = @"arrow_right";
    model9.cls = [BaoBeiDiscribeVC class];
    
    UpdateCommoditiesModel *modela = [UpdateCommoditiesModel new];
    modela.titleString = @"发货地";
    modela.detailString = @"";
    modela.rightImageString = @"arrow_right";
    modela.cls = nil;
    
    
    
    _infoDic = @{@"0":@[model],
                 @"1":@[model2,model3,model4],
                 @"2":@[model5,model6,model7,model8],
                 @"3":@[model9],
                 @"4":@[modela]};
    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.title = @"上传商品";
    [self layoutModel];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-40);
    }];
    
    [self layoutHeaderViewUI];
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setTitle:@"立即发布" forState:UIControlStateNormal];
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
    
}
- (void)layoutHeaderViewUI
{
    self.headerView = [UIView new];
    self.headerView.frame = CGRectMake(0, 0, CoreWidth, 320);
    self.headerView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.tableHeaderView = self.headerView;
    
    
    self.headerImage = [UIImageView new];
    self.headerImage.image = [UIImage imageNamed:@"iconImage"];
    self.headerImage.backgroundColor = [UIColor lightGrayColor];
    self.headerImage.frame = CGRectMake(0, 0, CoreWidth, 240);
    [self.headerView addSubview:_headerImage];
    
    
    PlaceholderTextView *placeView = [[PlaceholderTextView alloc] initWithFrame: CGRectMake(10, 245, CoreWidth-20, 80)];
    placeView.placeholder = @"请输入商品标题";
    placeView.layer.cornerRadius = 5;
    placeView.layer.masksToBounds = YES;
    [self.headerView addSubview:placeView];
    
    
    
    UILabel *label = [UILabel new];
    label.textColor = LineColor;
    label.font = KFontSize(12);
    label.text = @"2/60";
    label.frame = CGRectMake(CoreWidth-60, 50, CoreWidth, 20);
    [placeView addSubview:label];
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.infoDic.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  section == 0 ?  0.001 :10;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSString *sectionKey = [@(section) stringValue];
    NSArray *array = _infoDic[sectionKey];
    return array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UpdateCommoditiesCustomCell";
    UpdateCommoditiesCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UpdateCommoditiesCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSString *setionKey = [@(indexPath.section) stringValue];
    NSArray *array = _infoDic[setionKey];
    cell.updateModel = array[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *sectionKey = [@(indexPath.section) stringValue];
    NSArray *array = _infoDic[sectionKey];
    UpdateCommoditiesModel *model = array[indexPath.row];
   
    UIViewController *viewController = (UIViewController *)[model.cls new];
    if ([viewController isKindOfClass:[ChooseLeiMuViewController class]]) {
        ChooseLeiMuViewController *vc = [ChooseLeiMuViewController new];
        vc.titleString = model.titleString;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([viewController isKindOfClass:[BaoBeiDiscribeVC class]]) {
        BaoBeiDiscribeVC *vc = [BaoBeiDiscribeVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([viewController isKindOfClass:[ShangPinGuiGeViewController class]]) {
        ShangPinGuiGeViewController *vc = [ShangPinGuiGeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }

}
@end
