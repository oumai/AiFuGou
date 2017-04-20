//
//  UpVipView.m
//  AiFuGou
//
//  Created by Michael on 16/6/14.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
/*------------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface UpVipModel: NSObject

- (instancetype) initWithDictionary:(NSDictionary *)dic;

@end

@interface UpVipModel()

@end

@implementation UpVipModel
- (instancetype) initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end
/*------------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface UpVipCustomCell : UITableViewCell

@end

@interface UpVipCustomCell()
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;
@property (nonatomic, strong) UIView *line;

@end

@implementation UpVipCustomCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        self.line = [UIView new];
        self.line.backgroundColor = LineColor;
        [self.contentView addSubview:_line];
        
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];

        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = KHexColor(@"#999999");
        [self.contentView addSubview:_titleLabel];
        
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(-15);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.font = KFontSize(14);
        self.detailLabel.textColor = KHexColor(@"#999999");
        self.detailLabel.text = @"100% 全返 %5  推荐权  %1x5 = %5";
        [self.contentView addSubview:_titleLabel];
        
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(15);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];

    }
    return self;
}
@end



#import "UpVipView.h"
@interface UpVipView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray ;

@end
@implementation UpVipView


- (instancetype) initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.rowHeight = 60;
        [self addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self);
        }];
        
//        self.titleArray = @[@"CellViewVC",@"HorizonalTableViewVC",@"NoCommonControlsVC",@"UIScrollVC",@"Gradient",@"CollectionView",@"",@"",@"",@"",@"",@"",@""];

    }
    return self;
}

- (void)closeButtonClick:(UIButton *)button
{
    if (self.dismissKuangBlock) {
        self.dismissKuangBlock();
    }
}
- (void)sureButtonClick:(UIButton *)button
{
    if (self.sureKuangBlock) {
        self.sureKuangBlock();
    }
}
#pragma mark  - UITableViewDataSource & UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionFooterView = [UIView new];
    sectionFooterView.backgroundColor = KHexColor(@"#ebebeb");
    
    
    TTTAttributedLabel *titleLabel = [TTTAttributedLabel new];
    titleLabel.font = KFontSize(15);
    titleLabel.textColor = BackgroundColor;
    [sectionFooterView addSubview:titleLabel];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"iconfont-cha28-28"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [sectionFooterView addSubview:button];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sectionFooterView.mas_centerY).offset(0);
        make.centerX.equalTo(sectionFooterView.mas_centerX).offset(0);
        make.width.equalTo(titleLabel.mas_width);
        make.height.equalTo(15);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sectionFooterView.mas_left).offset(10);
        make.centerY.equalTo(sectionFooterView.mas_centerY).offset(0);
        make.width.equalTo(20);
        make.height.equalTo(20);
    }];
    
    
    
    [titleLabel setText:@"温馨提示:" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"会员升级只有一次机会"
                                                                   attributes:@{NSForegroundColorAttributeName : LightColor,
                                                                                NSFontAttributeName:KFontSize(12)}];
        [mutableAttributedString appendAttributedString:yuan];
        return mutableAttributedString;
    }];
    return sectionFooterView;
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
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UpVipCustomCell";
    UpVipCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UpVipCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        cell.titleLabel.text = [NSString stringWithFormat:@"初级会员:%@",@"20"];
    }
    if (indexPath.row == 1) {
        cell.titleLabel.text = [NSString stringWithFormat:@"中级会员:%@",@"40"];;
    }
    if (indexPath.row == 2) {
        cell.titleLabel.text = [NSString stringWithFormat:@"高级会员:%@",@"60"];;
    }
    return cell;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
