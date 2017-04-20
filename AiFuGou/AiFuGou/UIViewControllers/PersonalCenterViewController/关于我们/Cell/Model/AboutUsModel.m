
//
//  AboutUsModel.m
//  AiFuGou
//
//  Created by Michael on 16/6/27.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "AboutUsModel.h"

@implementation AboutUsModel

- (instancetype) initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
        
        if ([dic objectForKey:@"url"]) {
            self.url = [dic objectForKey:@"url"];
        }
        if ([dic objectForKey:@"content"]) {
            self.content = [dic objectForKey:@"content"];
        }
        if ([[dic objectForKey:@"id"] isKindOfClass:[NSNumber class]])
        {
            self.id = [[dic objectForKey:@"id"] stringValue];
        }
        if ([[dic objectForKey:@"status"] isKindOfClass:[NSNumber class]])
        {
            self.status = [[dic objectForKey:@"status"] stringValue];
        }

    }
    return self;
}
@end