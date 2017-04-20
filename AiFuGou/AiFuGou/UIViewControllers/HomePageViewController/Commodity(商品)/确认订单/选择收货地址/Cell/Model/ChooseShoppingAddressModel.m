//
//  ChooseShoppingAddressModel.m
//  AiFuGou
//
//  Created by Michael on 16/6/17.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "ChooseShoppingAddressModel.h"
@interface ChooseShoppingAddressModel()

@end
@implementation ChooseShoppingAddressModel

- (instancetype) initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
        if ([dic objectForKey:@"name"]) {
            self.name = [dic objectForKey:@"name"];
        }
        if ([[dic objectForKey:@"id"] isKindOfClass:[NSNumber class]])
        {
            self.id = [[dic objectForKey:@"id"] stringValue];
        }
        if ([[dic objectForKey:@"customerid"] isKindOfClass:[NSNumber class]])
        {
            self.customerid = [[dic objectForKey:@"customerid"] stringValue];
        }
         if ([[dic objectForKey:@"status"] isKindOfClass:[NSNumber class]])
        {
            self.status = [[dic objectForKey:@"status"] stringValue];
        }
        if ([dic objectForKey:@"phone"]) {
            self.phone = [dic objectForKey:@"phone"];
        }
        if ([dic objectForKey:@"area"]) {
            self.area = [dic objectForKey:@"area"];
        }
        if ([dic objectForKey:@"street"]) {
            self.street = [dic objectForKey:@"street"];
        }
        if ([dic objectForKey:@"province"]) {
            self.province = [dic objectForKey:@"province"];
        }
        if ([dic objectForKey:@"city"]) {
            self.city = [dic objectForKey:@"city"];
        }

    }
    return self;
}

@end
