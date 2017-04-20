//
//  KeduihuanjifenViewController.h
//  AIFUGOU
//
//  Created by apple love on 16/5/22.
//  Copyright © 2016年 Leaves. All rights reserved.
//
typedef enum
{
    DianZiJiFenType = 0,  //电子积分
    LeiJiXiaoFeiType,     //累计消费
    WeiFanHuanXiaoFeiType,//未返还积分
    LeiJiFanHuanType,     //累计返还
    KeDuiHuanJiFenType,   //可兑换
}JiFenAllType;
#import <UIKit/UIKit.h>

@interface KeduihuanjifenViewController : BaseViewController
@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, assign) JiFenAllType integralType;
@end
