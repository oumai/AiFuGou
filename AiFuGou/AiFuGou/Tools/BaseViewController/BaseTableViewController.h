//
//  BaseTableViewController.h
//  AngelSound
//
//  Created by jumper on 14-11-10.
//  Copyright (c) 2014年 Jumper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UITableViewController

@property (strong , nonatomic)UIButton *nocontentButton;

-(void)pop;

-(void)createNoNet:(UIView *)view;

-(void)netConnect;

-(void)createNoContent:(NSString *)string buttonTitle:(NSString *)buttonTitle view:(UIView *)view;

-(void)Actiondo:(id)sender;

-(void)removeNoContent;
@end
