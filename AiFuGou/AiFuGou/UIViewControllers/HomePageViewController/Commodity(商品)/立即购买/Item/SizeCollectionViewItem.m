//
//  collectionViewSizeItem.m
//  AiFuGou
//
//  Created by Michael on 16/6/13.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "SizeCollectionViewItem.h"
#import "Masonry.h"
@interface SizeCollectionViewItem()

@end
@implementation SizeCollectionViewItem
- (instancetype) initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        
        self.backgroundColor = LineColor;
        
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = KHexColor(@"#999999");
        self.titleLabel.text = @"高帮";
        [self.contentView addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
    }
    return self;
}
@end
