
//
//  DongAXinChengBaiHuoModel.m
//  AiFuGou
//
//  Created by 刘祥 on 16/6/19.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "DongAXinChengBaiHuoModel.h"
@interface DongAXinChengBaiHuoModel()

@end


@implementation DongAXinChengBaiHuoModel
- (instancetype) initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
        
        if ([dic objectForKey:@"thumb"]) {
            self.thumb = [dic objectForKey:@"thumb"];
        }
        if ([dic objectForKey:@"postContent"]) {
            self.postContent = [dic objectForKey:@"postContent"];
        }
        if ([dic objectForKey:@"postTitle"]) {
            self.postTitle = [dic objectForKey:@"postTitle"];
        }
        if ([[dic objectForKey:@"id"] isKindOfClass:[NSNumber class]] ) {
            self.id = [[dic objectForKey:@"id"] stringValue];
        }
        if ([[dic objectForKey:@"catid"] isKindOfClass:[NSNumber class]] ) {
            self.catid = [[dic objectForKey:@"catid"] stringValue];
        }
        if ([[dic objectForKey:@"price"] isKindOfClass:[NSNumber class]] ) {
            self.price = [[dic objectForKey:@"price"] stringValue];
        }
        if ([[dic objectForKey:@"num"] isKindOfClass:[NSNumber class]] ) {
            self.num = [[dic objectForKey:@"num"] stringValue];
        }
        if ([[dic objectForKey:@"postAuthor"] isKindOfClass:[NSNumber class]] ) {
            self.postAuthor = [[dic objectForKey:@"postAuthor"] stringValue];
        }
        if ([[dic objectForKey:@"postDate"] isKindOfClass:[NSNumber class]] ) {
            self.postDate = [[dic objectForKey:@"postDate"] stringValue];
        }

        if ([[dic objectForKey:@"postStatus"] isKindOfClass:[NSNumber class]] ) {
            self.postStatus = [[dic objectForKey:@"postStatus"] stringValue];
        }
        if ([[dic objectForKey:@"commentStatus"] isKindOfClass:[NSNumber class]] ) {
            self.commentStatus = [[dic objectForKey:@"commentStatus"] stringValue];
        }
        if ([[dic objectForKey:@"postModified"] isKindOfClass:[NSNumber class]] ) {
            self.postModified = [[dic objectForKey:@"postModified"] stringValue];
        }

        if ([[dic objectForKey:@"postParent"] isKindOfClass:[NSNumber class]] ) {
            self.postParent = [[dic objectForKey:@"postParent"] stringValue];
        }
        if ([[dic objectForKey:@"commentCount"] isKindOfClass:[NSNumber class]] ) {
            self.commentCount = [[dic objectForKey:@"commentCount"] stringValue];
        }
        if ([[dic objectForKey:@"postHits"] isKindOfClass:[NSNumber class]] ) {
            self.postHits = [[dic objectForKey:@"postHits"] stringValue];
        }

        if ([[dic objectForKey:@"postLike"] isKindOfClass:[NSNumber class]] ) {
            self.postLike = [[dic objectForKey:@"postLike"] stringValue];
        }
        if ([[dic objectForKey:@"istop"] isKindOfClass:[NSNumber class]] ) {
            self.istop = [[dic objectForKey:@"istop"] stringValue];
        }
        if ([[dic objectForKey:@"recommended"] isKindOfClass:[NSNumber class]] ) {
            self.recommended = [[dic objectForKey:@"recommended"] stringValue];
        }

        if ([[dic objectForKey:@"area"] isKindOfClass:[NSNumber class]] ) {
            self.area = [[dic objectForKey:@"area"] stringValue];
        }
        

    }
    return self;
}

@end
