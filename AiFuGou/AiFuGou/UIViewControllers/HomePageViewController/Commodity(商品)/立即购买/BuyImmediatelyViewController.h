//
//  BuyImmediatelyViewController.h
//  AiFuGou
//
//  Created by Michael on 16/6/13.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "BaseViewController.h"

@interface BuyImmediatelyViewController : BaseViewController
@property (nonatomic , copy) void(^dismissSimanPopoverViewController)(BuyImmediatelyViewController *);
@property (nonatomic , copy) void(^sureButtonClick)(BuyImmediatelyViewController *);
@end
