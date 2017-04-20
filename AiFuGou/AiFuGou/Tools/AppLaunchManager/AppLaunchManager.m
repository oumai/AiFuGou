//
//  AppLaunchManager.m
//  AppLaunchManager
//
//  Created by Michael on 16/1/19.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "AppLaunchManager.h"

#import "HomePageViewController.h"
#import "ClassificationViewController.h"
#import "MyShopViewController.h"
#import "ShoppingCartViewController.h"
#import "PersonalCenterViewController.h"
#import "LoginViewController.h"
@interface AppLaunchManager()<UIScrollViewDelegate>
{
    BOOL isOut;
}
@property (nonatomic, strong) LoginViewController*loginVCQ;
@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) UIScrollView       *scrollView;
@property (nonatomic, strong) UIPageControl      *pageControl;
@property (nonatomic, strong) UIButton           *loginButton;
@property (nonatomic, strong) UIButton           *registButton;
@end


@implementation AppLaunchManager

+ (instancetype)shareDafaults
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once (&once,^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


- (void)launch
{
    //1设置引导页
    
    isOut =NO;
    self.window = [UIApplication sharedApplication].delegate.window;
    if(![[NSUserDefaults standardUserDefaults] boolForKey:firstStartUserDefault]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:firstStartUserDefault];
        NSLog(@"第一次启动");
         [self makeLaunchView]; //为假表示没有文件，没有进入过主页
        
    }else{
        NSLog(@"不是第一次启动");
        
        
//        if ([[[NSUserDefaults standardUserDefaults] objectForKey:loginUserDefault] boolValue] == YES) {
            [self mainClick];  //登录过了
//        }
//        else
//        {
//            [self loginV];     //没登录过
//
//        }
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainWindowClick) name:JumpWindow object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exitGoLogin) name:Exit object:nil];
}
- (void)exitGoLogin
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:loginUserDefault];
    [self loginV];
}
- (LoginViewController *)loginV
{
    
    self.loginVCQ = [LoginViewController new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:_loginVCQ];
    return _loginVCQ;
}

- (UITabBarController *)tabBarController
{
    if ( nil == _tabBarController ) {
        
        
        HomePageViewController *vc = [HomePageViewController new];
        vc.title = @"首页";
        vc.tabBarItem.image = [UIImage imageNamed:@"iconfont-shouye"];
        UINavigationController *preNav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        
        ClassificationViewController *vc2 = [ClassificationViewController new];
        vc2.title = @"分类";
        vc2.tabBarItem.image = [UIImage imageNamed:@"iconfont-fenlei"];
        UINavigationController *preNav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
        
        MyShopViewController *vc3 = [MyShopViewController new];
        vc3.title = @"我的商城";
        vc3.tabBarItem.image = [UIImage imageNamed:@"iconfont-shangcheng"];
        UINavigationController *preNav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
        
        
        ShoppingCartViewController *vc4 = [ShoppingCartViewController new];
        vc4.title = @"购物车";
        vc4.tabBarItem.image = [UIImage imageNamed:@"iconfont-gouwuche"];
        UINavigationController *preNav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
        
        PersonalCenterViewController *vc5 = [PersonalCenterViewController new];
        vc5.title = @"个人中心";
        vc5.tabBarItem.image = [UIImage imageNamed:@"iconfont-gerenzhongxin"];
        UINavigationController *preNav5 = [[UINavigationController alloc] initWithRootViewController:vc5];
        
        UITabBarController *tab = [[UITabBarController alloc] init];
        tab.viewControllers = @[preNav,preNav2,preNav3,preNav4,preNav5];
        UIView * mView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, CoreWidth, 49)];//这是整个tabbar的颜色
        [mView setBackgroundColor:[UIColor whiteColor]];
        [tab.tabBar insertSubview:mView atIndex:0];
        mView.alpha=0.8;
        tab.tabBar.tintColor = KHexColor(@"#f24818");
        self.window.rootViewController = tab;
    }
    return _tabBarController;
}
- (void)mainWindowClick
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(mainClick)];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.window cache:YES];
    self.loginVCQ.view.alpha = 0;
    [UIView commitAnimations];
}
- (void)mainClick
{
    [self tabBarController];
}
-(void)makeLaunchView
{
    NSArray *arr    = [NSArray arrayWithObjects:
                       @"yindaoye",
                       @"yindaoye1",
                       @"yindaoye2",
                       @"yindaoye3",nil];                                //数组内存放的是我要显示的假引导页面图片
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.window.bounds];    //通过scrollView 将这些图片添加在上面，从而达到滚动这些图片
    self.scrollView.contentSize = CGSizeMake(CoreWidth*arr.count, self.window.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.tag = 7000;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    UIViewController *rootViewController = [[UIViewController alloc] init];
    self.window.rootViewController = rootViewController;
    [rootViewController.view addSubview:_scrollView];
    for (int i=0; i<arr.count; i++) {
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(i*CoreWidth, 0, CoreWidth, CoreHeight)];
        img.image=[UIImage imageNamed:arr[i]];
        [_scrollView addSubview:img];
    }
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CoreHeight-115, CoreWidth, 20)];
    self.pageControl.hidden = YES;
    self.pageControl.numberOfPages = 5;
    self.pageControl.currentPage = 0;
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = KHexColor(@"#2e408a");
    [self.pageControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [rootViewController.view addSubview:_pageControl];
    
    [UIColor colorForHexString:@""];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginButton.hidden = YES;
    self.loginButton.layer.cornerRadius = 5;
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.loginButton.frame = CGRectMake((CoreWidth/2-100)/2, CoreHeight-70, 100, 40);
    self.loginButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.loginButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [rootViewController.view addSubview:_loginButton];
    
    self.registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registButton.hidden = YES;
    self.registButton.layer.cornerRadius = 5;
    self.registButton.layer.masksToBounds = YES;
    self.registButton.layer.borderWidth = 1;
    self.registButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.registButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.registButton.frame = CGRectMake((CoreWidth/2-100)/2+CoreWidth/2, CoreHeight-70, 100, 40);
    self.registButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.registButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.registButton setBackgroundImage:[UIImage createImageWithColor:[UIColor grayColor]] forState:UIControlStateNormal];//KHexColor(@"#2e408a")
    [self.registButton addTarget:self action:@selector(registButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [rootViewController.view addSubview:_registButton];
}
#pragma mark ---------------------------------------------------------------UIScrollView Delegate-----------------------------------------------------------
- (void)valueChanged:(UIPageControl*)page
{
    [_scrollView setContentOffset:CGPointMake(CoreWidth*page.currentPage , 0) animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    _pageControl.currentPage = scrollView.contentOffset.x/(205.5);
    if (scrollView.contentOffset.x>3*CoreWidth+30) {
        isOut=YES;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (isOut)
    {
        [UIView animateWithDuration:1.5 animations:^{
            scrollView.alpha = 0;                 //让scrollview 渐变消失
            self.registButton.alpha = 0;
            self.loginButton.alpha = 0;
            self.pageControl.alpha = 0;
            
        }completion:^(BOOL finished) {
            [_registButton removeFromSuperview];
            [_loginButton removeFromSuperview];
            [_pageControl removeFromSuperview];
            [scrollView  removeFromSuperview];  //将scrollView移除
            [self loginV];                    //进入主界面
            
        } ];
    }
}
#pragma mark ---------------------------------------------------------------Actions ButtonClick-----------------------------------------------------------
-(void)gotoMain
{
    [self tabBarController];
}
- (void)loginButtonClick:(UIButton *)button
{
    [self tabBarController];
}
- (void)registButtonClick:(UIButton *)button
{
    
}
@end
