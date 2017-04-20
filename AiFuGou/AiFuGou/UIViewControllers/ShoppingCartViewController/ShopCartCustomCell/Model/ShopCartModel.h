//
//  ShopCartModel.h
//  AiFuGou
//
//  Created by Michael on 16/6/24.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopCartModel : NSObject

//@property (nonatomic, strong) NSString *istop;
//@property (nonatomic, strong) NSString *recommended;

@property (nonatomic, strong) NSString *postContent;
@property (nonatomic, strong) NSString *postMimeType;
@property (nonatomic, strong) NSString *postTitle;
@property (nonatomic, strong) NSString *thumb;
@property (nonatomic, strong) NSString *postKeywords;

@property (nonatomic, assign) int postHits;
@property (nonatomic, assign) int postParent;
@property (nonatomic, assign) int postModified;
@property (nonatomic, assign) int commentCount;
@property (nonatomic, assign) int id;
@property (nonatomic, assign) int num;
@property (nonatomic, assign) int price;     //价格
@property (nonatomic, assign) int area;
@property (nonatomic, assign) int postStatus;
@property (nonatomic, assign) int postLike;
@property (nonatomic, assign) int catid;
@property (nonatomic, assign) int postAuthor;
@property (nonatomic, assign) int commentStatus;
@property (nonatomic, assign) int postDate;


@end
