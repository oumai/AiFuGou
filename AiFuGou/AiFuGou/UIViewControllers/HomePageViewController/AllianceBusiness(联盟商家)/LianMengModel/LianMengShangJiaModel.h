//
//  LianMengShangJiaModel.h
//  AiFuGou
//
//  Created by 刘祥 on 16/6/18.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LianMengShangJiaModel : NSObject

@property (nonatomic, strong) NSString *id;        //商铺ID
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *uid;       //会员ID
@property (nonatomic, strong) NSString *province;  //省号
@property (nonatomic, strong) NSString *city;      //城市号
@property (nonatomic, strong) NSString *area;      //区号
@property (nonatomic, strong) NSString *addtime;
@property (nonatomic, strong) NSString *catid;      //商铺id
@property (nonatomic, strong) NSString *thumb;
@property (nonatomic, strong) NSString *shopname;   //商店名
@property (nonatomic, strong) NSString *relname;    //真实名（商户负责人）
@property (nonatomic, strong) NSString *conway;     //电话号
@property (nonatomic, strong) NSString *provincename;//省名
@property (nonatomic, strong) NSString *cityname;    //市名
@property (nonatomic, strong) NSString *areaname;    //区名

- (instancetype) initWithDictionary:(NSDictionary *)dic;
@end
