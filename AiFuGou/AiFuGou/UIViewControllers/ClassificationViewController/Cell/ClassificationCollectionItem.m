//
//  ClassificationCollectionItem.m
//  AiFuGou
//
//  Created by 刘祥 on 16/6/5.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "Masonry.h"
#import "ClassificationCollectionItem.h"
@interface ClassificationCollectionItem()

@property (nonatomic, strong) UILabel               *titleLabel;
@property (nonatomic, strong) UIImageView           *iconImage;
@end
@implementation ClassificationCollectionItem
- (instancetype) initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = KHexColor(@"#ebebeb");
        
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = KHexColor(@"#999999");
        self.titleLabel.text = @"高帮";
        [self.contentView addSubview:_titleLabel];
        
        
     
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"iconImage"];
        self.iconImage.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_iconImage];
        
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.width.equalTo(80);
            make.height.equalTo(80);
        }];
        
        
        
        
    }
    return self;
}
@end
