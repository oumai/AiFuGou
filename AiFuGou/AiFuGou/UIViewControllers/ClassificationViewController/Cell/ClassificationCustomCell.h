//
//  ClassificationCustomCell.h
//  AiFuGou
//
//  Created by 刘祥 on 16/6/5.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassificationModel.h"
@interface ClassificationCustomCell : UITableViewCell
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) ClassificationModel *classModel;
@end
