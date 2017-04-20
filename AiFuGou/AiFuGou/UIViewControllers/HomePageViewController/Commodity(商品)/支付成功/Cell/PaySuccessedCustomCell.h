//
//  PaySuccessedCustomCell.h
//  AiFuGou
//
//  Created by Michael on 16/6/13.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaySuccessedCustomCell : UITableViewCell

@property (nonatomic, strong) TTTAttributedLabel *shouHuoRenLabel;
@property (nonatomic, strong) TTTAttributedLabel *addressLabel;
@property (nonatomic, strong) TTTAttributedLabel *priceLabel;
@property (nonatomic, strong) TTTAttributedLabel *accountLabel;


@property (nonatomic, copy) void(^backHomePageBlock)();
@end
