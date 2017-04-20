//
//  UpVipView.h
//  AiFuGou
//
//  Created by Michael on 16/6/14.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpVipView : UIView

@property (nonatomic, strong) void(^dismissKuangBlock)();
@property (nonatomic, strong) void(^sureKuangBlock)();

@end
