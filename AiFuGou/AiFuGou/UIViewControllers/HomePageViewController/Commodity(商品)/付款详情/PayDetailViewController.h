//
//  PayDetailViewController.h
//  AiFuGou
//
//  Created by Michael on 16/6/13.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "BaseViewController.h"

@interface PayDetailViewController : BaseViewController
@property (nonatomic , copy) void(^dismissSimanPopoverViewController)(PayDetailViewController *);

@property (nonatomic, copy) void(^pushPaySuccessedBlock)();

@end
