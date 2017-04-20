//
//  ClassificationModel.m
//  AiFuGou
//
//  Created by Michael on 16/6/17.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "ClassificationModel.h"
@interface ClassificationModel()

@end
@implementation ClassificationModel

- (instancetype) initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
        if ([[dic objectForKey:@"id"] isKindOfClass:[NSNumber class]] ) {
            self.id = [[dic objectForKey:@"id"] stringValue];
        }
        if ([[dic objectForKey:@"pid"] isKindOfClass:[NSNumber class]] ) {
            self.pid = [[dic objectForKey:@"pid"] stringValue];
        }
        if ([[dic objectForKey:@"active"] isKindOfClass:[NSNumber class]] ) {
            self.active = [[dic objectForKey:@"active"] stringValue];
        }

        if ([dic objectForKey:@"name"]) {
            self.name = [dic objectForKey:@"name"];
        }
        if ([dic objectForKey:@"memo"]) {
            self.memo = [dic objectForKey:@"memo"];
        }
        
    }
    return self;
}
@end

