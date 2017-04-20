//
//  UpVipViewController.m
//  AiFuGou
//
//  Created by Michael on 16/6/14.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
/*------------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface UpVipViewControllerModel : NSObject

- (instancetype) initWithDictionary:(NSDictionary *)dic;

@end

@interface UpVipViewControllerModel()

@end

@implementation UpVipViewControllerModel
- (instancetype) initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end
/*------------------------------------------------------------------------------V----------------------------------------------------------------------------*/

@interface UpVipViewControllerCustomCell : UITableViewCell
@property (nonatomic, strong) UIImageView           *circleImage;

@end

@interface UpVipViewControllerCustomCell()
@property (nonatomic, strong) UIView                *line;
@property (nonatomic, strong) TTTAttributedLabel    *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel    *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel    *priceLabel;
@property (nonatomic, strong) TTTAttributedLabel    *numberLabel;
@property (nonatomic, strong) UIImageView           *iconImage;

@end

@implementation UpVipViewControllerCustomCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor  = [UIColor whiteColor];
//        self.line = [UIView new];
//        self.line.backgroundColor = LineColor;
//        [self.contentView addSubview:_line];
//        
//        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
//            make.left.equalTo(self.contentView.mas_left).offset(0);
//            make.right.equalTo(self.contentView.mas_right).offset(0);
//            make.height.equalTo(0.5);
//        }];
        
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"gerenzhongxin_huiyuan"];
        [self.contentView addSubview:_iconImage];
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.width.equalTo(15);
            make.height.equalTo(14);
        }];

        
        self.circleImage = [UIImageView new];
        self.circleImage.image = [UIImage imageNamed:@"huiyuanhou"];
        [self.contentView addSubview:_circleImage];
        
        [_circleImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImage.mas_right).offset(5);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.width.equalTo(9);
            make.height.equalTo(9);
        }];
        
        
        self.priceLabel = [TTTAttributedLabel new];
        self.priceLabel.font = KFontSize(14);
        self.priceLabel.textColor = LightColor;
        [self.contentView addSubview:_priceLabel];
        
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.circleImage.mas_right).offset(15);
            make.width.equalTo(self.priceLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        
        
        [self.priceLabel setText:@"初级会员     " afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            
            NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"11."
                                                                       attributes:@{NSForegroundColorAttributeName : BackgroundColor,
                                                                                    NSFontAttributeName:KFontSize(12)}];
            [mutableAttributedString appendAttributedString:yuan];
            return mutableAttributedString;
        }];
    }
    return self;
}
@end


/*------------------------------------------------------------------------------C----------------------------------------------------------------------------*/

#import "UpVipViewController.h"
@interface UpVipViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, assign) NSInteger     selectedRow;

@end
@implementation UpVipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"升级会员";
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    
    
}
//跳转到支付页面
-(void)sureButtonClick:(UIButton *)button
{
    
}
#pragma mark  - UITableViewDataSource & UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UpVipViewControllerCustomCell";
    UpVipViewControllerCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UpVipViewControllerCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == _selectedRow)
    {
        cell.circleImage.image = [UIImage imageNamed:@"huiyuanhou_selected"];
        
    }else
    {

        cell.circleImage.image = [UIImage imageNamed:@"huiyuanhou"];
    }
    
   

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedRow=indexPath.row;
    [tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
//区尾
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIView *sectionFooterView = [UIView new];
    sectionFooterView.backgroundColor = KHexColor(@"#ebebeb");
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#f24818")] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [sectionFooterView addSubview:button];
    
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(sectionFooterView.mas_centerX).offset(0);
        make.centerY.equalTo(sectionFooterView.mas_centerY).offset(0);
        make.width.equalTo(CoreWidth-40);
        make.height.equalTo(40);
    }];
    return sectionFooterView;
}
@end
