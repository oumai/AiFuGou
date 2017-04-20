//
//  WoDeTuiGuangModel.m
//  AiFuGou
//
//  Created by Michael on 16/6/24.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "WoDeTuiGuangModel.h"


@interface WoDeTuiGuangModel()

@end

@implementation WoDeTuiGuangModel
- (instancetype) initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
        
        if ([dic objectForKey:@"user_nicename"]) {
            self.user_nicename = [dic objectForKey:@"user_nicename"];
        }
        if ([dic objectForKey:@"mobile"]) {
            self.mobile = [dic objectForKey:@"mobile"];
        }
        if ([dic objectForKey:@"type"]) {
            self.type = [dic objectForKey:@"type"];
        }
        if ([[dic objectForKey:@"create_time"] isKindOfClass:[NSNumber class]])
        {
            self.create_time = [[dic objectForKey:@"create_time"] stringValue];
        }
        
    }
    return self;
}
@end
