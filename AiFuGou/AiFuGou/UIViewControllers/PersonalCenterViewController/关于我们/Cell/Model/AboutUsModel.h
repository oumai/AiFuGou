//
//  AboutUsModel.h
//  AiFuGou
//
//  Created by Michael on 16/6/27.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AboutUsModel : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *url;     //url
@property (nonatomic, strong) NSString *content; //公司介绍
@property (nonatomic, strong) NSString *status;  //Status

- (instancetype) initWithDictionary:(NSDictionary *)dic;

@end
