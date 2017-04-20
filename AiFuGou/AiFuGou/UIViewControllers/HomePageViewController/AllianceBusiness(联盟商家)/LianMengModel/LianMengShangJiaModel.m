//
//  LianMengShangJiaModel.m
//  AiFuGou
//
//  Created by 刘祥 on 16/6/18.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "LianMengShangJiaModel.h"

@interface  LianMengShangJiaModel ()


@end
@implementation LianMengShangJiaModel


- (instancetype) initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
        if ([[dic objectForKey:@"id"] isKindOfClass:[NSNumber class]] ) {
            self.id = [[dic objectForKey:@"id"] stringValue];
        }
        if ([[dic objectForKey:@"status"] isKindOfClass:[NSNumber class]] ) {
            self.status = [[dic objectForKey:@"status"] stringValue];
        }
        if ([[dic objectForKey:@"uid"] isKindOfClass:[NSNumber class]] ) {
            self.uid = [[dic objectForKey:@"uid"] stringValue];
        }
        if ([[dic objectForKey:@"province"] isKindOfClass:[NSNumber class]] ) {
            self.province = [[dic objectForKey:@"province"] stringValue];
        }
        if ([[dic objectForKey:@"city"] isKindOfClass:[NSNumber class]] ) {
            self.city = [[dic objectForKey:@"city"] stringValue];
        }
        if ([[dic objectForKey:@"area"] isKindOfClass:[NSNumber class]] ) {
            self.area = [[dic objectForKey:@"area"] stringValue];
        }
        if ([[dic objectForKey:@"addtime"] isKindOfClass:[NSNumber class]] ) {
            self.addtime = [[dic objectForKey:@"addtime"] stringValue];
        }
        if ([[dic objectForKey:@"catid"] isKindOfClass:[NSNumber class]] ) {
            self.catid = [[dic objectForKey:@"catid"] stringValue];
        }
        if ([dic objectForKey:@"thumb"]) {
            self.thumb = [dic objectForKey:@"thumb"];
        }
        if ([dic objectForKey:@"relname"]) {
            self.relname = [dic objectForKey:@"relname"];
        }
        if ([dic objectForKey:@"conway"]) {
            self.conway = [dic objectForKey:@"conway"];
        }
        if ([dic objectForKey:@"provincename"]) {
            self.provincename = [dic objectForKey:@"provincename"];
        }
        if ([dic objectForKey:@"cityname"]) {
            self.cityname = [dic objectForKey:@"cityname"];
        }
        if ([dic objectForKey:@"shopname"]) {
            self.shopname = [dic objectForKey:@"shopname"];
        }
        if ([dic objectForKey:@"areaname"]) {
            self.areaname = [dic objectForKey:@"areaname"];
        }
       
    }
    return self;
}

@end
