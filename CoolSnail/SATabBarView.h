//
//  SATabBarView.h
//  CoolSnail
//
//  Created by quqi on 15/10/10.
//  Copyright © 2015年 牵着蜗牛走的我. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SATabBarView;
@protocol SATabBarDelegate <NSObject>

-(void)tabBar:(SATabBarView *)tabBar didSelectItemFrom:(NSUInteger )from to:(NSUInteger)to;

@end
@interface SATabBarView : UIView

//添加设置按钮的方法
-(void)addTabBarButton:(NSString *)icon selIcon:(NSString *)selIcon;


//定义我的选择器控制协议
@property (nonatomic,weak) id <SATabBarDelegate> delegate;
@end