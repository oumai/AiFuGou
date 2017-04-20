//
//  AddShoppingAddressVC.m
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "AddShoppingAddressVC.h"
#import "AddShoppingAddressCustomCell.h"

@interface AddShoppingAddressVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    AddShoppingAddressCustomCell *cell;
}
@property (nonatomic, strong) UITableView     *tableView;
@property (nonatomic, strong) UITextField     *shouHuoRenTF;
@property (nonatomic, strong) UITextField     *phoneTF;
@property (nonatomic, strong) UITextField     *addressTF;
@property (nonatomic, strong) UITextField     *emailTF;
@property (nonatomic, strong) UISwitch        *switchOn;

@end

@implementation AddShoppingAddressVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.title = [self.titleString length] == 0 ? @"添加收货地址" :self.titleString;
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
    
}
- (void)requestDataSaveAndModify:(NSString *)saveString
{
    
 
   }

- (void)buttonClick:(UIButton *)button
{
    
    NSDictionary *dic = nil;
    if ([self.titleString length] == 0) {
        //添加
       dic = @{@"appKey":@"00001",
                               @"v":@"1.0",
                               @"format": @"json",
                               @"method":@"rop.address.add",
                               @"customerid":@"2941",
                               @"phone":self.phoneTF.text,
                               @"area":self.emailTF.text,
                               @"street":self.addressTF.text,
                               @"province":@"",
                               @"city":@"",
                               @"name":self.shouHuoRenTF.text,
                               @"Status":self.statusString};

    }
    else
    {
        //修改
        dic = @{@"appKey":@"00001",
                @"v":@"1.0",
                @"format": @"json",
                @"method":@"rop.editaddress.get",
                @"customerid":@"2941",
                @"phone":self.phoneTF.text,
                @"area":self.emailTF.text,
                @"street":self.addressTF.text,
                @"province":@"",
                @"city":@"",
                @"name":self.shouHuoRenTF.text,
                @"Status":self.statusString,
                @"id":self.id};
    }
    
    [OMURLConnection requestAFNJSon:dic method:RequestUrl view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        NSLog(@" ==+ %@",[content objectForKey:@"result"]);
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            
            k_yjHUD([self.titleString length] == 0 ? @"保存成功" : @"修改成功", self.view);
        }
        
    } errorBlock:^(NSError *error) {
        
    }];


}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
{
    return 170;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIView *secitonFooterView = [UIView new];
    secitonFooterView.backgroundColor = KHexColor(@"#ebebeb");
    
    AddShoppingAddressCustomCell *cellView = [AddShoppingAddressCustomCell new];
    cellView.titleLabel.text = @"邮编:";
    cellView.iconImage.image = [UIImage imageNamed:@"ziliao_shenfenzhenghao"];
    cellView.detailTextField.placeholder = @"请输入邮箱";
    [secitonFooterView addSubview:cellView];
    
    [cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(secitonFooterView.mas_top).offset(10);
        make.left.equalTo(secitonFooterView.mas_left).offset(0);
        make.right.equalTo(secitonFooterView.mas_right).offset(0);
        make.height.equalTo(40);
        
    }];
    
    self.emailTF = [UITextField new];
    self.emailTF.font = KFontSize(14);
    self.emailTF.textColor = LightColor;
    [cellView addSubview:_emailTF];
    
    
    [_emailTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cellView.mas_centerY).offset(0);
        make.left.equalTo(cellView.titleLabel.mas_right).offset(10);
        make.right.equalTo(cellView.mas_right).offset(-30);
        make.height.equalTo(14);
    }];

    
    UIView *switchView = [UIView new];
    switchView.backgroundColor = [UIColor whiteColor];
    [secitonFooterView addSubview:switchView];
    
    [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cellView.mas_bottom).offset(10);
        make.left.equalTo(secitonFooterView.mas_left).offset(0);
        make.right.equalTo(secitonFooterView.mas_right).offset(0);
        make.height.equalTo(40);
        
    }];

    TTTAttributedLabel *morenLabel = [TTTAttributedLabel new];
    morenLabel.font = KFontSize(14);
    morenLabel.textColor = DeepColor;
    morenLabel.text = @"设为默认";
    [secitonFooterView addSubview:morenLabel];
    
    
    [morenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(switchView.mas_centerY).offset(0);
        make.left.equalTo(switchView.mas_left).offset(10);
        make.width.equalTo(morenLabel.mas_width);
        make.height.equalTo(18);
    }];
    

    self.statusString = @"1";
    self.switchOn = [UISwitch new];
    self.switchOn.on = NO;
    self.switchOn.onTintColor = BackgroundColor;
    [self.switchOn addTarget:self action:@selector(switchOnClick:) forControlEvents:UIControlEventValueChanged];
    [switchView addSubview:self.switchOn];
    
    
    [self.switchOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(switchView.mas_centerY).offset(0);
        make.right.equalTo(switchView.mas_right).offset(-20);
        make.width.equalTo(40);
        make.height.equalTo(28);
    }];

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 10;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1;
    button.layer.borderColor = BackgroundColor.CGColor;
    [button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [secitonFooterView addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(secitonFooterView.mas_bottom).offset(0);
        make.left.equalTo(secitonFooterView.mas_left).offset(40);
        make.width.equalTo(CoreWidth-80);
        make.height.equalTo(40);
    }];
    
    if ([self.titleString length] == 0) {
        [button setTitle:@"保存" forState:UIControlStateNormal];

    }
    else
    {
        [button setTitle:@"修改" forState:UIControlStateNormal];
    }
    
    return secitonFooterView;
}
- (void)switchOnClick:(id )sender
{
    UISwitch *switc = (UISwitch *)sender;
    BOOL isButtonOn = [switc isOn];
    if (isButtonOn) {
        NSLog(@"是");
        self.statusString = @"0";

    }
    else
    {
        NSLog(@"否");
        self.statusString = @"1";

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 3) {
        return 70;
    }
    else
    {
        return 45;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"AddShoppingAddressCustomCell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[AddShoppingAddressCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    NSArray *titleArray = @[@"收货人:",@"手机号:",@"地址:"];
    NSArray *imageArray = @[@"iconfont-gerenzhongxin-1",@"ziliao_lianxifangshi",@"ziliao_dizhi"];
    cell.titleLabel.text = titleArray[indexPath.row];
    cell.iconImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
    if (indexPath.row == 0) {
        
        self.shouHuoRenTF = [UITextField new];
        self.shouHuoRenTF.font = KFontSize(14);
        self.shouHuoRenTF.textColor = LightColor;
        [cell addSubview:_shouHuoRenTF];
        
        [_shouHuoRenTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.mas_centerY).offset(0);
            make.left.equalTo(cell.titleLabel.mas_right).offset(10);
            make.right.equalTo(cell.mas_right).offset(-30);
            make.height.equalTo(14);
        }];
    }
    if (indexPath.row == 1) {
        
        self.phoneTF = [UITextField new];
        self.phoneTF.font = KFontSize(14);
        self.phoneTF.textColor = LightColor;
        [cell addSubview:_phoneTF];
        
        
        [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.mas_centerY).offset(0);
            make.left.equalTo(cell.titleLabel.mas_right).offset(10);
            make.right.equalTo(cell.mas_right).offset(-30);
            make.height.equalTo(14);
        }];
    }
    if (indexPath.row == 2) {
        self.addressTF = [UITextField new];
        self.addressTF.font = KFontSize(14);
        self.addressTF.textColor = LightColor;
        [cell addSubview:_addressTF];
        
        [_addressTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.mas_centerY).offset(0);
            make.left.equalTo(cell.titleLabel.mas_right).offset(10);
            make.right.equalTo(cell.mas_right).offset(-30);
            make.height.equalTo(14);
        }];
        
    }
    if ([self.titleString length] == 0) {
        self.shouHuoRenTF.placeholder = @"请您输入收货人姓名";
        self.phoneTF.placeholder = @"请您输入收货人联系方式";
        self.addressTF.placeholder = @"请您输入收货地址";
    }
    else
    {
        self.shouHuoRenTF.text = self.nameString;
        self.phoneTF.text = self.phoneString;
        self.addressTF.text = self.streetString;
        
    }

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
       return YES;
}
@end
