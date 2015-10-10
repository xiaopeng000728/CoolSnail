//
//  SATabBarView.m
//  CoolSnail
//
//  Created by quqi on 15/10/10.
//  Copyright © 2015年 牵着蜗牛走的我. All rights reserved.
//

#import "SATabBarView.h"
#import "SAButton.h"
@interface SATabBarView ()
{
    SAButton *_selecteButton;
}
@end
@implementation SATabBarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置tab的背景颜色
        self.backgroundColor = [UIColor colorWithRed:46.0 /255.0 green:53.0 / 255.0  blue:54.0 / 255.0 alpha:1.0];
    }
    return self;
}
#pragma mark 设置按钮

-(void)addTabBarButton:(NSString *)icon selIcon:(NSString *)selIcon
{
    //创建按钮
    SAButton *button = [SAButton buttonWithType:UIButtonTypeCustom];
    UIImageView *imgView1 = [[UIImageView alloc] init];
    imgView1.image = [UIImage imageNamed:selIcon];
    UIImageView *imgView2 = [[UIImageView alloc] init];
    imgView2.image = [UIImage imageNamed:icon];
    //设置背景
    [button setImage:imgView2.image forState:UIControlStateNormal];
    [button setImage:imgView1.image forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor colorWithRed:50 / 255.0 green:196 / 255.0 blue:178 / 255.0 alpha:1.0]forState:UIControlStateSelected];
    [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
    button.titleEdgeInsets = UIEdgeInsetsMake(39, -50, 1, 0);
    [button setTitleColor:[UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1.0]forState:UIControlStateNormal];
    
    
    [self addSubview:button];
    //重新调用所有按钮的frame
    [self adjustButtonFrames];
    //设置我的tag
    button.tag = self.subviews.count - 1;
    //默认选择第0个
    if (self.subviews.count==1) {
        [self buttonClick:button];
    }
    
    
}
#pragma mark - 重新调用所有按钮的frame
- (void)adjustButtonFrames
{
    int btnCount = (int)self.subviews.count;
    for (int i=0; i<btnCount; i++) {
        
        SAButton *button = self.subviews[i];
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width / btnCount;
        //        CGFloat buttonW = 33.0;
        CGFloat buttonX = i * ( self.frame.size.width / btnCount) ;
        CGFloat buttonH = 50;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}

#pragma mark 选择我的控制器
- (void)buttonClick:(SAButton *)wqBtn
{
    //通知代理
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectItemFrom:to:)]) {
        
        [_delegate tabBar:self didSelectItemFrom:_selecteButton.tag to:wqBtn.tag];
    }
    //三行代码-切换按钮
    _selecteButton.selected = NO;
    wqBtn.selected = YES;
    _selecteButton = wqBtn;
    
}

@end
