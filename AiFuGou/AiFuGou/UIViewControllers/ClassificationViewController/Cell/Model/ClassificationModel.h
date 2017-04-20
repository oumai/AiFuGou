//
//  ClassificationModel.h
//  AiFuGou
//
//  Created by Michael on 16/6/17.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassificationModel : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *pid;
@property (nonatomic, strong) NSString *memo;
@property (nonatomic, strong) NSString *active;

- (instancetype) initWithDictionary:(NSDictionary *)dic;
@end
