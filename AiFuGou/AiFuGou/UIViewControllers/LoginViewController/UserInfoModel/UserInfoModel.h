//
//  UserInfoModel.h
//  AiFuGou
//
//  Created by Michael on 16/6/20.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *userPass;
@property (nonatomic, strong) NSString *pid;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *lastLoginTime;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *userStatus;
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) NSString *score1;
@property (nonatomic, strong) NSString *score2;
@property (nonatomic, strong) NSString *score3;
@property (nonatomic, strong) NSString *score4;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *userType;
@property (nonatomic, strong) NSString *coin;
@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSString *trole;
@property (nonatomic, strong) NSString *needchage;

- (instancetype) initWithDictionary:(NSDictionary *)dic;
- (NSString *)getUserID;
@end
