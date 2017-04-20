//
//  HeaderReusableSizeView.m
//  AiFuGou
//
//  Created by Michael on 16/6/14.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "HeaderReusableSizeView.h"
#import "Masonry.h"

@interface HeaderReusableSizeView()
@end
@implementation HeaderReusableSizeView

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        
        
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = KHexColor(@"#999999");
        self.titleLabel.text = @"尺码";
        [self addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.left.equalTo(self.mas_left).offset(10);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
    }
    return self;
}

@end

