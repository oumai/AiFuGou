//
//  TableViewCell.m
//  TFSearchBar
//
//  Created by TF_man on 16/5/19.
//  Copyright © 2016年 TF_man. All rights reserved.
//
//屏幕宽和高
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

#import "TableViewCell.h"

@implementation TableViewCell

- (void)setCellArr:(NSArray *)cellArr{
    
    _cellArr = cellArr;
    CGFloat w = (kScreenWidth-30)/3;
    for (int i = 0; i < cellArr.count; i++)
    {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(15+i%3*w, 15+i/3*45, w-15, 30);
        [btn setTitle:cellArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor grayColor];
        [self addSubview:btn];
    }
    
}

- (void)btnClick:(UIButton *)btn{
    
//    NSLog(@"btnClick---%@",btn.titleLabel.text);
    [self.delegate TableViewSelectorIndix:btn.titleLabel.text];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
