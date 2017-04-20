//
//  ShangPinViewController.h
//  AIFUGOU
//
//  Created by apple love on 16/5/22.
//  Copyright © 2016年 Leaves. All rights reserved.
//

#import "BaseViewController.h"

@interface ShangPinViewController : BaseViewController

@property (nonatomic, strong) NSString  *id;            //商品id
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


@property (nonatomic, strong) NSString *shopID;
@property (nonatomic, strong) NSString *shopname;
@property (nonatomic, strong) NSString *relname;//卖家名字
@end
