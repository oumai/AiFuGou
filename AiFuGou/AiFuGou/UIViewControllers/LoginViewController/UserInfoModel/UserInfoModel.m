//
//  UserInfoModel.m
//  AiFuGou
//
//  Created by Michael on 16/6/20.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "UserInfoModel.h"

@interface UserInfoModel ()

@end
@implementation UserInfoModel

- (instancetype) initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
        
        NSLog(@"dic == %@",dic);
        
        if ([dic objectForKey:@"id"]) {
            self.id = [dic objectForKey:@"id"];
            [[NSUserDefaults standardUserDefaults] setObject:self.id forKey:@"userID"];
        }
        if ([dic objectForKey:@"mobile"]) {
            self.mobile = [dic objectForKey:@"mobile"];
        }
        if ([dic objectForKey:@"userPass"]) {
            self.userPass = [dic objectForKey:@"userPass"];
        }
        if ([[dic objectForKey:@"pid"] isKindOfClass:[NSNumber class]] ) {
            self.pid = [[dic objectForKey:@"pid"] stringValue];
        }
        if ([[dic objectForKey:@"lastLoginTime"] isKindOfClass:[NSNumber class]] ) {
            self.lastLoginTime = [[dic objectForKey:@"lastLoginTime"] stringValue];
        }
        if ([[dic objectForKey:@"createTime"] isKindOfClass:[NSNumber class]] ) {
            self.createTime = [[dic objectForKey:@"createTime"] stringValue];
        }
        if ([[dic objectForKey:@"userStatus"] isKindOfClass:[NSNumber class]] ) {
            self.userStatus = [[dic objectForKey:@"userStatus"] stringValue];
        }
        if ([[dic objectForKey:@"score"] isKindOfClass:[NSNumber class]] ) {
            self.score = [[dic objectForKey:@"score"] stringValue];
        }
        if ([[dic objectForKey:@"score1"] isKindOfClass:[NSNumber class]] ) {
            self.score1 = [[dic objectForKey:@"score1"] stringValue];
        }
        if ([[dic objectForKey:@"score2"] isKindOfClass:[NSNumber class]] ) {
            self.score2 = [[dic objectForKey:@"score2"] stringValue];
        }
        if ([[dic objectForKey:@"score3"] isKindOfClass:[NSNumber class]] ) {
            self.score3 = [[dic objectForKey:@"score3"] stringValue];
        }
        if ([[dic objectForKey:@"score4"] isKindOfClass:[NSNumber class]] ) {
            self.score4 = [[dic objectForKey:@"score4"] stringValue];
        }
        if ([[dic objectForKey:@"money"] isKindOfClass:[NSNumber class]] ) {
            self.money = [[dic objectForKey:@"money"] stringValue];
        }
        if ([[dic objectForKey:@"userType"] isKindOfClass:[NSNumber class]] ) {
            self.userType = [[dic objectForKey:@"userType"] stringValue];
        }
        if ([[dic objectForKey:@"coin"] isKindOfClass:[NSNumber class]] ) {
            self.coin = [[dic objectForKey:@"coin"] stringValue];
        }
        if ([[dic objectForKey:@"role"] isKindOfClass:[NSNumber class]] ) {
            self.role = [[dic objectForKey:@"role"] stringValue];
        }
        if ([[dic objectForKey:@"trole"] isKindOfClass:[NSNumber class]] ) {
            self.trole = [[dic objectForKey:@"trole"] stringValue];
        }
        if ([[dic objectForKey:@"needchage"] isKindOfClass:[NSNumber class]] ) {
            self.needchage = [[dic objectForKey:@"needchage"] stringValue];
        }
    }
    return self;
}
- (NSString *)getUserID
{
//    [[NSUserDefaults standardUserDefaults] setObject:self.id forKey:@"userID"];

    return [[NSUserDefaults standardUserDefaults] objectForKey:@"userID"];
}
@end
