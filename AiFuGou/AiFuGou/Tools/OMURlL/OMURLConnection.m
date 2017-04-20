//
//  OMURLConnection.m
//  AiFuGou
//
//  Created by Michael on 16/6/16.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "OMURLConnection.h"

@implementation OMURLConnection


+(void)requestAFNJSon:(NSDictionary *)dic method:(NSString *)method view:(UIView *)view version:(NSString *)string completeBlock:(completeBlock_tt)completeBlock errorBlock:(errorBlock_t)errorBlock
{

    [ASHUDView showActivity:view];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer     = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    
    

    
    NSString *ret = [RopSign sign:dic secret:@"qwertyuiop"];
    NSMutableDictionary *newdic = [NSMutableDictionary dictionaryWithDictionary:dic];  //下面是post请求的参数
    [newdic setObject:ret forKey:@"sign"];
    [manager POST:method parameters:newdic progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];                         //这里的responseString是json串
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        NSLog(@"responseString = %@",responseString);
        NSLog(@"dataDic == %@",content);    //成功返回
        completeBlock(nil,responseObject);
        [ASHUDView hidenActivity:view];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error == %@",error);        //失败返回
        errorBlock(error);
        
        [ASHUDView hidenActivity:view];
//        k_NSlogHUD(@"请求失败");
//        k_NSlogHUD([NSString stringWithFormat:@"%@",[[content objectForKey:@"data"] objectForKey:@"msg"]);
        
        
    }];
}

+(void)decryptionResonseObject:(id)data
{
    [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
}
@end
