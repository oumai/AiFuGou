//
//  DongAXinChengBaiHuoModel.h
//  AiFuGou
//
//  Created by 刘祥 on 16/6/19.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DongAXinChengBaiHuoModel : NSObject

@property (nonatomic, strong) NSString  *id;            //商品id
@property (nonatomic, strong) NSString  *catid;
@property (nonatomic, strong) NSString  *price;         //价格
@property (nonatomic, strong) NSString  *num;           //数量
@property (nonatomic, strong) NSString  *thumb;         //商品图片
@property (nonatomic, strong) NSString  *postAuthor;    //商铺id
@property (nonatomic, strong) NSString  *postDate;      //创建时间
@property (nonatomic, strong) NSString  *postStatus;    //是否审核通过
@property (nonatomic, strong) NSString  *commentStatus; //发布状态
@property (nonatomic, strong) NSString  *postModified;  //更新时间
@property (nonatomic, strong) NSString  *postParent;
@property (nonatomic, strong) NSString  *commentCount;
@property (nonatomic, strong) NSString  *postHits;
@property (nonatomic, strong) NSString  *postLike;
@property (nonatomic, strong) NSString  *istop;
@property (nonatomic, strong) NSString  *recommended;
@property (nonatomic, strong) NSString  *area;          //商品所在地区
@property (nonatomic, strong) NSString  *postContent;   //商品详情
@property (nonatomic, strong) NSString  *postTitle;     //名称

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
