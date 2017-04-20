//
//  GuiGeCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/16.
//  Copyright © 2016年 jumper. All rights reserved.
//

static NSString *identifier = @"GuiGeCustomItem";
#import "Masonry.h"
#import "GuiGeCustomCell.h"
#import "GuiGeCustomItem.h"
@interface GuiGeCustomCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray  *titleArray;
@property (nonatomic, strong) UICollectionViewFlowLayout    *layoutColor;
@property (nonatomic, strong) UICollectionView              *collectionViewColor;
@end
@implementation GuiGeCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.titleArray = @[@"M",@"L",@"XL",@"XXL",@"XXXL",@"XXXXL",@"",@""];

        self.layoutColor = [[UICollectionViewFlowLayout alloc] init];
        self.layoutColor.itemSize = CGSizeMake((CoreWidth-80)/3, 30);
        self.layoutColor.minimumLineSpacing = 10;
        self.layoutColor.minimumInteritemSpacing = 20;
        self.layoutColor.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
        [self.layoutColor setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        self.collectionViewColor = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layoutColor];
        self.collectionViewColor.dataSource = self;
        self.collectionViewColor.delegate = self;
        self.collectionViewColor.backgroundColor = KHexColor(@"#ffffff");
        [self.contentView addSubview:_collectionViewColor];
        [self.collectionViewColor registerClass:[GuiGeCustomItem class] forCellWithReuseIdentifier:identifier];
        
        
        [_collectionViewColor mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);

        }];

    }
    return self;
}

#pragma mark ------------------------------------------------------------------UICollectionViewDelegateFlowLayout-------------------------------------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GuiGeCustomItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.titleLabel.text = self.titleArray[indexPath.item];
    return cell;
 
}

@end
