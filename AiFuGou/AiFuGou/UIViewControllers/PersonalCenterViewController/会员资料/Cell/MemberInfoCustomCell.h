//
//  MemberInfoCustomCell.h
//  AiFuGou
//
//  Created by Michael on 16/6/8.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberInfoModel.h"
@interface MemberInfoCustomCell : UITableViewCell
@property (nonatomic, strong) UILabel  *headerLabel;



@property (nonatomic, strong) MemberInfoModel *infoModel;
@end
