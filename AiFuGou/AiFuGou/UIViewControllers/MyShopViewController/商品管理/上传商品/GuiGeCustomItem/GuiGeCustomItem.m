//
//  GuiGeCustomItem.m
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "GuiGeCustomItem.h"

@interface GuiGeCustomItem()
@property (nonatomic, strong) UIImageView *iconImage;
@end
@implementation GuiGeCustomItem
- (instancetype) initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = LightColor;
        self.titleLabel.backgroundColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.layer.borderColor = LineColor.CGColor;
        self.titleLabel.layer.borderWidth = 0.5;
        self.titleLabel.layer.cornerRadius = 3;
        self.titleLabel.layer.masksToBounds = YES;
        self.titleLabel.text = @"白色";
        [self.contentView addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.contentView);
        }];
        
    }
    return self;
}
@end

