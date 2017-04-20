//
//  ShopCartSectionMoel.h
//  AiFuGou
//
//  Created by Michael on 16/6/27.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopCartSectionMoel : NSObject

@property (nonatomic, assign) int id;
@property (nonatomic, assign) int price;
@property (nonatomic, assign) int customerid;
@property (nonatomic, assign) int count;
@property (nonatomic, assign) int status;
@property (nonatomic, assign) int productid;
@property (nonatomic, assign) int regdate;
@property (nonatomic, strong) NSString *ordername;
@property (nonatomic, strong) NSString *shopname;
@property (nonatomic, strong) NSString *productname;
@property (nonatomic, assign) NSString *logisticsstatus; //保留字段

@property (nonatomic, strong) NSDictionary *product;

@end
