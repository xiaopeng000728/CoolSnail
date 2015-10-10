//
//  SATBVC.m
//  CoolSnail
//
//  Created by quqi on 15/10/10.
//  Copyright © 2015年 牵着蜗牛走的我. All rights reserved.
//

#import "SATBVC.h"
#import "SATabBarView.h"
#import "UINavigationItem+LXP.h"
@interface SATBVC ()<SATabBarDelegate>
{
    SATabBarView *_myTabBar;
}
@end

@implementation SATBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.hidden = YES;
    
}
#pragma mark 删除系统自带的Tab
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //该方法只会执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //1.删除默认的tab按钮
        [self.tabBar removeFromSuperview];
        _myTabBar = [[SATabBarView alloc] init];
        //设置我的代理--用于切换我的控制器视图
        _myTabBar.delegate = self;
        _myTabBar.frame = self.tabBar.frame;
        
        //添加四个按钮
        [_myTabBar addTabBarButton:@"home_normal" selIcon:@"home_select"];
        [_myTabBar addTabBarButton:@"choiceness_normal" selIcon:@"choiceness_select"];
        [_myTabBar addTabBarButton:@"attention_normal" selIcon:@"attention_select"];
        [_myTabBar addTabBarButton:@"create_normal" selIcon:@"create_select"];
        [_myTabBar addTabBarButton:@"aboutme_normal" selIcon:@"aboutme_select"];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleShow:) name:@"hide" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleHide:) name:@"show" object:nil];
        [self.view addSubview:_myTabBar];
        
    });
    
}
-(void)handleShow:(NSNotification *)notifi
{
    _myTabBar.hidden = YES;
}
-(void)handleHide:(NSNotification *)notifi
{
    _myTabBar.hidden = NO;
}

#pragma mark  实现协议方法
-(void)tabBar:(SATabBarView *)tabBar didSelectItemFrom:(NSUInteger)from to:(NSUInteger)to
{
    //选择某个控制器（这个UITabBarControlller自带API）
    self.selectedIndex = to;
    
    //    self.selectedViewController = self.childViewControllers[to];
    
    //得到新的控制器视图
    
    UIViewController *newVC = self.childViewControllers[to];
    
    //2.将新控制器的navigationItem值转移给Tabbarcontroller
    
    [self.navigationItem copyFromItem:newVC.navigationItem];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
