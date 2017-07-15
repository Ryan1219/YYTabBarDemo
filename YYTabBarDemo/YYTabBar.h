//
//  YYTabBar.h
//  YYTabBarDemo
//
//  Created by Ryan on 2017/7/15.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYTabBar;
@protocol YYTabBarDelegate <NSObject>

- (void)tabbar:(YYTabBar *)tabBar clickCenterButtonAction:(UIButton *)button;

@end

@interface YYTabBar : UITabBar

/* <#description#> */
@property (nonatomic,weak) id<YYTabBarDelegate>delegate;

@end


