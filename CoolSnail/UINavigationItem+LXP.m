//
//  UINavigationItem+LXP.m
//  WQ-ItcastLottery
//
//  Created by zuxia on 14-12-6.
//  Copyright (c) 2014年 zuxia. All rights reserved.
//

#import "UINavigationItem+LXP.h"

@implementation UINavigationItem (LXP)

//2.将新控制器的navigationItem值转移给Tabbarcontroller避免每次调用
-(void)copyFromItem:(UINavigationItem *)other
{
    self.leftBarButtonItem = other.leftBarButtonItem;
    self.leftBarButtonItems = other.leftBarButtonItems;
    self.rightBarButtonItem = other.rightBarButtonItem;
    self.rightBarButtonItems = other.rightBarButtonItems;
    self.title = other.title;
    self.titleView = other.titleView;
}
@end
