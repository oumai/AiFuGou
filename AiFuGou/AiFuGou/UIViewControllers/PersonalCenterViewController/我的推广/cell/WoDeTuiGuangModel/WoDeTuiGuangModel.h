//
//  WoDeTuiGuangModel.h
//  AiFuGou
//
//  Created by Michael on 16/6/24.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WoDeTuiGuangModel : NSObject

@property (nonatomic, strong) NSString *user_nicename;
@property (nonatomic, strong) NSString *create_time;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *type;
- (instancetype) initWithDictionary:(NSDictionary *)dic;
@end
