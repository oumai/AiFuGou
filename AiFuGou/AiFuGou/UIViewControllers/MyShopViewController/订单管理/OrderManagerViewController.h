//
//  OrderManagerViewController.h
//  AiFuGou
//
//  Created by 刘祥 on 16/6/6.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "BaseViewController.h"

@interface OrderManagerViewController : BaseViewController
@property (nonatomic, copy) void(^pushBlock)(NSInteger);

@end
