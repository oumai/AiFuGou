//
//  PersonalCenterCollectionItem.m
//  AiFuGou
//
//  Created by Michael on 16/6/7.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "PersonalCenterCollectionItem.h"
@interface PersonalCenterCollectionItem ()

@end
@implementation PersonalCenterCollectionItem


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.imageView = [UIImageView new];
        self.imageView.contentMode  = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_imageView];
        
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.contentView.mas_top).equalTo(0);
//            make.left.equalTo(self.contentView.mas_left).equalTo(0);
//            make.bottom.equalTo(self.contentView.mas_bottom).equalTo(0);
//            make.right.equalTo(self.contentView.mas_right).equalTo(0);
            
            make.centerY.equalTo(self.contentView.mas_centerY).equalTo(0);
            make.centerX.equalTo(self.contentView.mas_centerX).equalTo(0);
            make.width.equalTo(50);
            make.height.equalTo(65.5);

        }];
        
        
    }
    return self;
}
@end
