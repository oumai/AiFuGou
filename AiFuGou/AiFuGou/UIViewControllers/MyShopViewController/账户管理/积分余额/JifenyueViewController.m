//
//  JifenyueViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/21.
//  Copyright © 2016年 Leaves. All rights reserved.
//
#import "Masonry.h"
#import "JifenyueViewController.h"
#import "BuyJiFenCustomCell.h"

#import "KeduihuanjifenViewController.h" //电子积分余额（可兑换电子积分）
@interface JifenyueViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) UIView        *footerView;
@property (nonatomic, strong) UIView        *line;
@property (nonatomic, strong) UIView        *cellView;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UITextField   *textField;
@property (nonatomic, strong) UITextField   *textField2;
@property (nonatomic, strong) UIButton      *button;
@property (nonatomic, strong) TTTAttributedLabel       *titleLabel2;

@end

@implementation JifenyueViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"积分余额";
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    
    
    self.footerView = [UIView new];
    self.footerView.backgroundColor = KHexColor(@"#ebebeb");
    self.footerView.frame = CGRectMake(0, 0, CoreWidth, CoreHeight-64);
    self.tableView.tableFooterView = self.footerView;
    
    
    
    self.cellView = [UIView new];
    self.cellView.layer.cornerRadius = 5;
    self.cellView.layer.masksToBounds = YES;
    self.cellView.backgroundColor = KHexColor(@"#ffffff");
    [self.footerView addSubview:_cellView];
    
    
    self.line = [UIView new];
    self.line.backgroundColor = LineColor;
    [self.cellView addSubview:_line];
    
    
    
    
    
    self.titleLabel = [TTTAttributedLabel new];
    self.titleLabel.font = KFontSize(14);
    self.titleLabel.textColor = DeepColor;
    self.titleLabel.text = @"支付账号:";
    [self.cellView addSubview:_titleLabel];
    
    
    
    self.textField = [UITextField new];
    self.textField.placeholder = @"请输入对方支付宝账户";
    self.textField.font = KFontSize(14);
    self.textField.textColor = LightColor;
    [self.cellView  addSubview:_textField];
    
    
    self.textField2 = [UITextField new];
    self.textField2.placeholder = @"请输入金额";
    self.textField2.font = KFontSize(14);
    self.textField2.textColor = LightColor;
    [self.cellView  addSubview:_textField2];
    
    self.titleLabel2 = [TTTAttributedLabel new];
    self.titleLabel2.font = KFontSize(14);
    self.titleLabel2.textColor = DeepColor;
    self.titleLabel2.text = @"金额:";
    [self.cellView addSubview:_titleLabel2];
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.layer.cornerRadius = 10;
    self.button.layer.masksToBounds = YES;
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    [self.button setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage createImageWithColor:BackgroundColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.footerView addSubview:_button];
    
    
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    
    [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.footerView.mas_top).offset(5);
        make.left.equalTo(self.footerView.mas_left).offset(10);
        make.height.equalTo(100);
        make.right.equalTo(self.footerView.mas_right).offset(-10);
        
    }];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
        make.left.equalTo(self.cellView.mas_left).offset(0);
        make.right.equalTo(self.cellView.mas_right).offset(0);
        make.height.equalTo(0.5);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(-25);
        make.left.equalTo(self.cellView.mas_left).offset(10);
        make.width.equalTo(70);
        make.height.equalTo(20);
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(-25);
        make.left.equalTo(self.titleLabel.mas_right).offset(0);
        make.width.equalTo(200);
        make.height.equalTo(18);
    }];
    [_titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(25);
        make.left.equalTo(self.cellView.mas_left).offset(10);
        make.width.equalTo(40);
        make.height.equalTo(18);
    }];
    
    [_textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cellView.mas_centerY).offset(25);
        make.left.equalTo(self.titleLabel2.mas_right).offset(0);
        make.width.equalTo(200);
        make.height.equalTo(18);
    }];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellView.mas_bottom).offset(50);
        make.centerX.equalTo(self.footerView.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*2/3);
        make.height.equalTo(40);
    }];
    
    
}
- (void)buttonClick:(UIButton *)button
{
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KeduihuanjifenViewController *vc = [KeduihuanjifenViewController new];
    vc.titleString = @"电子积分余额";
    vc.integralType = 0;
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"BuyJiFenCustomCell";
    BuyJiFenCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[BuyJiFenCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    TTTAttributedLabel *label = [TTTAttributedLabel new];
    label.font = KFontSize(14);
    label.textColor = DeepColor;
    [cell addSubview:label];
    
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell.mas_centerY).offset(0);
        make.left.equalTo(cell.mas_left).offset(20);
        make.width.equalTo(label.mas_width);
        make.height.equalTo(18);
    }];
    
    [label setText:@"消费积分余额:" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"0.0"
                                                                   attributes:@{NSForegroundColorAttributeName : BackgroundColor,
                                                                                NSFontAttributeName:KFontSize(12)}];
        [mutableAttributedString appendAttributedString:yuan];
        return mutableAttributedString;
    }];
    

    return cell;
}
@end