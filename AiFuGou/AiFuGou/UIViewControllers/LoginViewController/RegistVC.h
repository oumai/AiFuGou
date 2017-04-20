//
//  RegistVC.h
//  YiFu
//
//  Created by Michael on 16/3/16.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "BaseViewController.h"
#import <SMS_SDK/Extend/SMSSDKResultHanderDef.h>

@interface RegistVC : BaseViewController
@property (nonatomic) SMSGetCodeMethod getCodeMethod;


@property (nonatomic, strong) void(^popBlock)(NSString *);
@end
