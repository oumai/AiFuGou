//
//  OMURLConnection.h
//  AiFuGou
//
//  Created by Michael on 16/6/16.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^completeBlock_tt)(NSData *data,id responseObject);
typedef void (^errorBlock_t)(NSError *error);
@interface OMURLConnection : NSObject

+(void)getMessage:(NSDictionary *)result;
+(void)decryptionResonseObject:(id)data;
+(void)requestAFNJSon:(NSDictionary *)dic method:(NSString *)method view:(UIView *)view version:(NSString *)string completeBlock:(completeBlock_tt)completeBlock errorBlock:(errorBlock_t)errorBlock;
@end
