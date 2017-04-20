//
//  memberInfoViewController.m
//  AIFUGOU
//
//  Created by 柯索 on 16/5/22.
//  Copyright © 2016年 Leaves. All rights reserved.
//
#import "Masonry.h"
#import "memberInfoViewController.h"
#import "MemberInfoCustomCell.h"
#import "MemberInfoModel.h"
#import "SheetActionView.h"

#import "YongHuMingViewController.h"
#import "QRCodeViewController.h"
#import "ChooseShoppingAddressVC.h"
#import "SettingViewController.h" //设置
@interface memberInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, strong) UITableView           *tableView;
@property (nonatomic, strong) NSDictionary          *infoDic;
@property (nonatomic, strong) SheetActionView       *sheetView;
@property (nonatomic, strong) UITapGestureRecognizer*tap;
@property (nonatomic, assign) BOOL                  isPresented;
@property (nonatomic, strong) UIImageView           *headerImage;

@end

@implementation memberInfoViewController

- (void)layoutModel
{
    
    //    NSArray *imageArray = @[@"ziliao_fuzeren",@"ziliao_lianxifangshi",@"tuijian30-30",@"ziliao_erweima",@"ziliao_dizhi",@"iconfont-shezhi"];//
    //    NSArray *titleArray = @[@"用户名:",@"手机号:",@"推荐人:",@"我的二维码:",@"收货地址:",@"设置:"];
    
    MemberInfoModel *model = [MemberInfoModel new];
    model.iconString = @"";
    model.titleString = @"";
    model.detailString = @"";
    model.cls = nil;
    
    MemberInfoModel *model2 = [MemberInfoModel new];
    model2.iconString = @"ziliao_fuzeren";
    model2.titleString = @"用户名:";
    model2.detailString = @"王大锤";
    model2.cls = [YongHuMingViewController class];
    
    MemberInfoModel *model3 = [MemberInfoModel new];
    model3.iconString = @"ziliao_lianxifangshi";
    model3.titleString = @"手机号:";
    model3.detailString = @"15827428893";
    model3.cls = nil;
    
    
    MemberInfoModel *model4 = [MemberInfoModel new];
    model4.iconString = @"tuijian30-30";
    model4.titleString = @"推荐人:";
    model4.detailString = @"大鹏";
    model4.cls = nil;
    
    MemberInfoModel *model5 = [MemberInfoModel new];
    model5.iconString = @"ziliao_erweima";
    model5.titleString = @"我的二维码:";
    model5.detailString = @"";
    model5.cls = [QRCodeViewController class];
    
    MemberInfoModel *model6 = [MemberInfoModel new];
    model6.iconString = @"ziliao_dizhi";
    model6.titleString = @"收货地址:";
    model6.detailString = @"济南市";
    model6.cls = [ChooseShoppingAddressVC class];
    
    
    MemberInfoModel *model7 = [MemberInfoModel new];
    model7.iconString = @"iconfont-shezhi";
    model7.titleString = @"设置:";
    model7.cls = [SettingViewController class];
    
    
    
    
    _infoDic = @{@"0":@[model],
                 @"1":@[model2,model3,model4,model5],
                 @"2":@[model6,model7]};

}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.title = @"会员资料";
    self.isPresented = NO;
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
    }];
    
    [self layoutSheetViewUI];
}
- (void)layoutSheetViewUI
{
    self.sheetView = [SheetActionView new];
    self.sheetView.frame = CGRectMake(0, CoreHeight, CoreWidth, 160);
    
    __weak SheetActionView *safeView = self.sheetView;
    [safeView setSheetViewBlock:^(NSInteger sheet) {
        
        if (sheet == 100) {
            [self cameraButttonClick];
            [self animationedDown];
            
        }
        else if (sheet == 101)
        {
            [self photoesButttonClick];
            [self animationedDown];
            
        }
        else if (sheet == 102)
        {
            [self animationedDown];
        }
    }];
    [self.view addSubview:_sheetView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionKey = [@(section) stringValue];
    NSArray *array = _infoDic[sectionKey];
    return array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 70;
    }
    else
    {
        return 45;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"MemberInfoCustomCell";
    MemberInfoCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[MemberInfoCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
   
    NSString *setionKey = [@(indexPath.section) stringValue];
    NSArray *array = _infoDic[setionKey];
    cell.infoModel = array[indexPath.row];

    if (indexPath.section == 0 && indexPath.row == 0) {
        
        
        //头像这一行（第一行）
        self.headerImage = [UIImageView new];
        self.headerImage.layer.cornerRadius = 30;
        self.headerImage.layer.masksToBounds = YES;
        self.headerImage.image = [UIImage imageNamed:@"iconImage"];
        self.headerImage.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:_headerImage];
        
        [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cell.mas_right).offset(-30);
            make.centerY.equalTo(cell.mas_centerY).offset(0);
            make.width.equalTo(60);
            make.height.equalTo(60);
        }];
        cell.headerLabel.text = @"头像";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *setcionKey = [@(indexPath.section) stringValue];
    NSArray *infoArr = _infoDic[setcionKey];
    MemberInfoModel *model = infoArr[indexPath.row];
    
    
    
    UIViewController *viewController = (UIViewController *)[model.cls new];
    if ([viewController isKindOfClass:[YongHuMingViewController class]]) {
        YongHuMingViewController *earnVC = [YongHuMingViewController new];
        [self.navigationController pushViewController:earnVC animated:YES];
    }
    else if ([viewController isKindOfClass:[QRCodeViewController class]]) {
        QRCodeViewController *earnVC = [QRCodeViewController new];
        [self.navigationController pushViewController:earnVC animated:YES];
    }
    else if ([viewController isKindOfClass:[ChooseShoppingAddressVC class]]) {
        ChooseShoppingAddressVC *earnVC = [ChooseShoppingAddressVC new];
        [self.navigationController pushViewController:earnVC animated:YES];
    }
    else if ([viewController isKindOfClass:[SettingViewController class]]) {
        SettingViewController *earnVC = [SettingViewController new];
        [self.navigationController pushViewController:earnVC animated:YES];
    }

    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        if (_isPresented == NO) {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.1];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(animationUp)];
            [UIView commitAnimations];
        }
        else
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.1];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(animationedDown)];
            [UIView commitAnimations];
        }
    }

}

- (void)animationUp
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    self.sheetView.frame = CGRectMake(0, CoreHeight-160, CoreWidth, 160);
    [UIView commitAnimations];
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:_tap];
    _isPresented = YES;
    
}
- (void)animationedDown
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.sheetView.frame = CGRectMake(0, CoreHeight, CoreWidth, 160);
    [UIView commitAnimations];
    [self.view removeGestureRecognizer:_tap];
    _isPresented = NO;
    
}
- (void)tapClick
{
    [self animationedDown];
}
#pragma mark ------------------------------------------------------------------相机 选照片-------------------------------------------------
//打开相机
- (void)cameraButttonClick
{
    BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!isCamera) {
        NSLog(@"没有摄像头");
        return ;
    }
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    // 编辑模式
    imagePicker.allowsEditing = YES;
    [self  presentViewController:imagePicker animated:YES completion:^{
    }];
}
//打开相册
- (void)photoesButttonClick
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self  presentViewController:imagePicker animated:YES completion:^{
    }];
}
//取消
- (void)cancelButttonClick
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
// 选中照片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //imageView.image = image;
    // UIImagePickerControllerOriginalImage 原始图片
    // UIImagePickerControllerEditedImage 编辑后图片
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.headerImage.image = image;
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
}
@end
