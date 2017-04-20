//
//  WodeDingdanViewController.m
//  AIFUGOU
//
//  Created by apple love on 16/5/22.
//  Copyright © 2016年 Leaves. All rights reserved.
//

#import "WodeDingdanViewController.h"
#import "WoDeDingDanLeftCell.h"
#import "WoDeDingDanRightCell.h"
#import "Masonry.h"
@interface WodeDingdanViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTabelView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) NSInteger index;

@end

@implementation WodeDingdanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:DeepColor,UITextAttributeTextColor,  [UIFont fontWithName:nil size:10.f],UITextAttributeFont ,DeepColor,UITextAttributeTextShadowColor ,nil]; //字体边边颜色
    
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"已付款",@"未付款"]];
    self.segmentControl.segmentedControlStyle = UISegmentedControlStyleBordered;
    self.segmentControl.selectedSegmentIndex = 0;
    self.segmentControl.layer.cornerRadius = 2;
    self.segmentControl.layer.masksToBounds = YES;
    self.segmentControl.layer.borderWidth = 1;
    self.segmentControl.layer.borderColor = KHexColor(@"#f24818").CGColor;//边框的颜色
    self.segmentControl.tintColor = KHexColor(@"#f24818");  //选中后的背景颜色
    self.segmentControl.backgroundColor= KHexColor(@"#ebebeb"); //背景颜色
    [self.segmentControl setTitleTextAttributes:dic forState:UIControlStateNormal];
    [self.segmentControl addTarget:self action:@selector(segmentControlClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentControl];
    
    
    [_segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64+5);
        make.left.equalTo(self.view.mas_left).offset(5);
        make.right.equalTo(self.view.mas_right).offset(-5);
        make.height.equalTo(30);
    }];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 64+40, CoreWidth, CoreHeight-64-40);
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(CoreWidth*2, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    self.leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CoreWidth, CoreHeight-104) style:UITableViewStylePlain];
    self.leftTableView.rowHeight = 170;
    self.leftTableView.dataSource = self;
    [self.scrollView addSubview:_leftTableView];
    
    self.rightTabelView = [[UITableView alloc] initWithFrame:CGRectMake(CoreWidth, 0, CoreWidth, CoreHeight-104) style:UITableViewStylePlain];
    self.rightTabelView.rowHeight = 170;
    self.rightTabelView.dataSource = self;
    [self.scrollView addSubview:_rightTabelView];
}
- (void)segmentControlClick:(UISegmentedControl *)seg
{
    self.index = seg.selectedSegmentIndex;
    NSLog(@"index = %ld",self.index);
    [_scrollView setContentOffset:CGPointMake(CoreWidth*(self.index), 0) animated:YES];
}
#pragma mark ------------------------------------------------------------------UIScrollView Delegate-------------------------------------------------
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.segmentControl.selectedSegmentIndex = _scrollView.contentOffset.x/CoreWidth;
}


#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _leftTableView) {
        return 4;
    }
    else
    {
        return 2;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTableView) {
        static NSString *leftID = @"left";
        WoDeDingDanLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:leftID];
        if (nil == cell) {
            cell = [[WoDeDingDanLeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftID];
        }
        return cell;
    }
    else
    {
        static NSString *rightID = @"right";
        WoDeDingDanRightCell *cell = [tableView dequeueReusableCellWithIdentifier:rightID];
        if (nil == cell) {
            cell = [[WoDeDingDanRightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rightID];
        }
        return cell;
    }
}
@end