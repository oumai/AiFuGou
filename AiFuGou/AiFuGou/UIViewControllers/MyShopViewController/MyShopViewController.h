//
//  MyShopViewController.h
//  AiFuGou
//
//  Created by Michael on 16/6/1.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface MyShopViewController : BaseViewController
typedef NS_ENUM(NSInteger , TypeOfCell)
{
    oneCell   = 100,
    twoCell   = 101,
    threeCell = 102,
    fourCell  = 103,
    fiveCell  = 104,
    sixCell   = 105,
};
@property (nonatomic, assign) TypeOfCell type;

@end
