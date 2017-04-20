//
//  BaseTableViewController.m
//  AngelSound
//
//  Created by jumper on 14-11-10.
//  Copyright (c) 2014年 Jumper. All rights reserved.
//
#define kSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define kSCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#import "BaseTableViewController.h"

#define lableX 50.0



@interface BaseTableViewController ()
@property(nonatomic,strong)UIImageView *imageView;

@property(nonatomic,strong)UIView *noneNetView;
@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setLeftbarite];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0]};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

-(void)viewWillAppear:(BOOL)animated{

        self.tabBarController.tabBar.hidden = YES;

}

-(void)viewWillDisappear:(BOOL)animated{
        [self.tableView  setEditing:NO];
        [self.view endEditing:YES];
        self.tabBarController.tabBar.hidden = NO;
}

-(void)setLeftbarite{
    NSString * image = @"return_normal";
    NSString * hImage = @"return_hover";
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    [right setFrame:CGRectMake(0, 0, 60, 24)];
    [right setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [right setImage:[UIImage imageNamed:hImage] forState:UIControlStateHighlighted];
    right.imageEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    [right setTitle:@"返回" forState:UIControlStateNormal];
    right.titleEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0);
    [right addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:right];
    
}

-(void)pop{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)removeNoContent{
    if (_noneNetView) {
        [_noneNetView removeFromSuperview];
        _noneNetView = nil;
    }
    
}
-(void)createNoContent:(NSString *)string buttonTitle:(NSString *)buttonTitle view:(UIView *)view{
    [self removeNoContent];
    if (_noneNetView==nil) {
        _noneNetView=[[UIView alloc]initWithFrame:view.bounds];
        _noneNetView.backgroundColor = [UIColor clearColor];
        _noneNetView.userInteractionEnabled = YES;
        
        UIView *noview = [[UIView alloc]init];
        //图片
        UIImage *image = [UIImage imageNamed:@"not_found"];
        UIImageView *noneNetImageView=[[UIImageView alloc]initWithFrame:CGRectMake(kSCREEN_WIDTH/2-image.size.width/2, 0, image.size.width, image.size.height)];
        noneNetImageView.contentMode = UIViewContentModeScaleAspectFit;
        noneNetImageView.image = image;
        noneNetImageView.contentMode = 1;
        [noview addSubview:noneNetImageView];
        
        //文字提示
        UIFont *font = [UIFont boldSystemFontOfSize:15.0];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(lableX, CGRectGetHeight(noneNetImageView.frame)+20, kSCREEN_WIDTH-lableX*2,0)];
        lable.numberOfLines = 0;
        lable.text = string;
        lable.textColor = RGBA(83, 83, 83, 1);
        lable.font = font;
        lable.textAlignment = NSTextAlignmentCenter;
        CGSize size = CGSizeMake(kSCREEN_WIDTH - lableX*2, 0);//[lable.text sizeWithFont:font maxSize:CGSizeMake(kSCREEN_WIDTH - lableX*2, 0)];
        lable.frame = CGRectMake(lableX, lable.frame.origin.y, lable.frame.size.width, size.height);
        [noview addSubview:lable];
        
        /*自定义视图
         1.nocontentButton
         */
        self.nocontentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (buttonTitle) {//如需要button，则创建
            self.nocontentButton.frame = CGRectMake(kSCREEN_WIDTH/2.0 - 100/2.0,CGRectGetMidY(lable.frame)+size.height, 100, 30);
            [self.nocontentButton setBackgroundImage:[UIImage imageNamed:@"ok_button"] forState:UIControlStateNormal];
            [self.nocontentButton setBackgroundImage:[UIImage imageNamed:@"ok_button"] forState:UIControlStateHighlighted];
            self.nocontentButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
             [self.nocontentButton setTitle:buttonTitle forState:UIControlStateNormal];
            [noview addSubview:self.nocontentButton];
        }
        
        CGFloat height = CGRectGetMidY(lable.frame)+size.height+CGRectGetHeight(self.nocontentButton.frame);;
        [noview setFrame:CGRectMake(0, CGRectGetHeight(_noneNetView.frame)/2-height/2, kSCREEN_WIDTH, height)];
        [_noneNetView addSubview:noview];
    }
    [view addSubview:_noneNetView];
}

-(void)createNoNet:(UIView *)view{
    if (_noneNetView==nil) {
        _noneNetView=[[UIView alloc]initWithFrame:view.bounds];
        _noneNetView.userInteractionEnabled = YES;
        _noneNetView.backgroundColor = [UIColor whiteColor];
        
        UIView *noview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 200)];
        noview.center = _noneNetView.center;
        [_noneNetView addSubview:noview];
        
        UIImageView *noneNetImageView=[[UIImageView alloc]initWithFrame:CGRectMake(kSCREEN_WIDTH/2-130/2, 0, 130, 140)];
        noneNetImageView.image = [UIImage imageNamed:@"no_net"];
        [noview addSubview:noneNetImageView];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 140, kSCREEN_WIDTH, 30)];
        lable.text = @"数据获取失败";
        lable.textColor = RGBA(83, 83, 83, 1);
       
        lable.font = [UIFont systemFontOfSize:15.0];
        lable.textAlignment = NSTextAlignmentCenter;
        [noview addSubview:lable];
        
        UILabel *downlable = [[UILabel alloc]initWithFrame:CGRectMake(0, 170, kSCREEN_WIDTH, 30)];
        downlable.text = @"请检查网络后点击重新加载";
        downlable.textColor = RGBA(141, 140, 141, 1);
        
        downlable.font = [UIFont systemFontOfSize:13.0];
        downlable.textAlignment = NSTextAlignmentCenter;
        [noview addSubview:downlable];

        
        UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo:)];
        [_noneNetView addGestureRecognizer:tapGesture];

        [view addSubview:_noneNetView];
    }
    
}
-(void)netConnect{
    if(_noneNetView){
        [_noneNetView removeFromSuperview];
        _noneNetView = nil;
    }
}
-(void)Actiondo:(id)sender{
    
}

@end
