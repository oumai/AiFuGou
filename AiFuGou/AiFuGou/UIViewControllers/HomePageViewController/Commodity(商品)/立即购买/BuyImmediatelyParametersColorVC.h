//
//  BuyImmediatelyParametersColorVC.h
//  AiFuGou
//
//  Created by Michael on 16/6/13.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "BaseViewController.h"

@interface BuyImmediatelyParametersColorVC : BaseViewController
@property (nonatomic , copy) void(^dismissSimanPopoverViewController)(BuyImmediatelyParametersColorVC *);
@property (nonatomic , copy) void(^sureButtonClick)(BuyImmediatelyParametersColorVC *);
@end
