//
//  YYTabBarViewController.m
//  YYTabBarDemo
//
//  Created by Ryan on 2017/7/15.
//  Copyright © 2017年 Ryan. All rights reserved.
//

#import "YYTabBarViewController.h"
#import "YYTabBar.h"
#import "YYCenterViewController.h"

@interface YYTabBarViewController () <YYTabBarDelegate>

@end

@implementation YYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //使用自定义YYTabBar
    YYTabBar *tabBar = [[YYTabBar alloc] init];
    tabBar.delegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    
    [self addAllChildViewController];
}


// 添加全部的 childViewcontroller
- (void)addAllChildViewController
{
    UIViewController *homeVC = [[UIViewController alloc] init];
    homeVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:homeVC title:@"首页" imageNamed:@"tabBar_home"];
    
    UIViewController *activityVC = [[UIViewController alloc] init];
    activityVC.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:activityVC title:@"活动" imageNamed:@"tabBar_activity"];
    
    UIViewController *findVC = [[UIViewController alloc] init];
    findVC.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:findVC title:@"发现" imageNamed:@"tabBar_find"];
    
    UIViewController *mineVC = [[UIViewController alloc] init];
    mineVC.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:mineVC title:@"我的" imageNamed:@"tabBar_mine"];
}

// 添加某个 childViewController
- (void)addChildViewController:(UIViewController *)vc title:(NSString *)title imageNamed:(NSString *)imageNamed
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    // 如果同时有navigationbar 和 tabbar的时候最好分别设置它们的title
    vc.navigationItem.title = title;
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageNamed];
    
    [self addChildViewController:nav];
}

//MARK:-YYTabBarDelegate
- (void)tabbar:(YYTabBar *)tabBar clickCenterButtonAction:(UIButton *)button {
    
    YYCenterViewController *centerCtrl = [[YYCenterViewController alloc] init];
    [self presentViewController:centerCtrl animated:true completion:nil];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:centerCtrl];
//    [self.navigationController pushViewController:centerCtrl animated:true];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
