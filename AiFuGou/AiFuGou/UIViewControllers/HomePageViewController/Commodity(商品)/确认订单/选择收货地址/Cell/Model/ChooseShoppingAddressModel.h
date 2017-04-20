//
//  ChooseShoppingAddressModel.h
//  AiFuGou
//
//  Created by Michael on 16/6/17.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChooseShoppingAddressModel : NSObject
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *customerid; //customerid 用户id
@property (nonatomic, strong) NSString *status;     //Status  0 代表默认；1不默认；3 删除
@property (nonatomic, strong) NSString *phone;      //手机
@property (nonatomic, strong) NSString *area;       //地区
@property (nonatomic, strong) NSString *street;     //街道
@property (nonatomic, strong) NSString *name;       //名字
@property (nonatomic, strong) NSString *province;   //省份
@property (nonatomic, strong) NSString *city;       //城市
- (instancetype) initWithDictionary:(NSDictionary *)dic;

@end
