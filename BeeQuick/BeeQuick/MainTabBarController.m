//
//  MainTabBarController.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/27.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomePageViewController.h"
#import "FlashingMarketViewController.h"
#import "ShoppingCartViewController.h"
#import "UserCenterViewController.h"

@interface MainTabBarController ()

{
    NSInteger oldIndex;
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTabBar];
    [self setupTabBarItem];
    
}

- (void)setupTabBar {
    HomePageViewController *homePageVC = [[HomePageViewController alloc] init];
    UINavigationController *homePageNC = [[UINavigationController alloc] initWithRootViewController:homePageVC];
    
    FlashingMarketViewController *flashingMarketVC = [[FlashingMarketViewController alloc] init];
    UINavigationController *flashingMarketNC = [[UINavigationController alloc] initWithRootViewController:flashingMarketVC];
    
    ShoppingCartViewController *shoppingCartVC = [[ShoppingCartViewController alloc] init];
    UINavigationController *shoppingCartNV = [[UINavigationController alloc] initWithRootViewController:shoppingCartVC];
    
    UserCenterViewController *userCenterVC = [[UserCenterViewController alloc] init];
    
    self.viewControllers = @[homePageNC, flashingMarketNC, shoppingCartNV, userCenterVC];
}

- (void)setupTabBarItem {
    self.tabBar.tintColor = [UIColor grayColor];
    for (int i = 0; i < self.viewControllers.count; i++) {
        UIViewController *vc = self.viewControllers[i];
        if (i == 0) {
            UIImage *imageNormal = [UIImage imageNamed:@"tabbar_home_normal"];
            imageNormal = [imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UIImage *imageSelected = [UIImage imageNamed:@"tabbar_home_selected"];
            imageSelected = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:imageNormal selectedImage:imageSelected];
        }
        else if (i == 1) {
            UIImage *imageNormal = [UIImage imageNamed:@"tabbar_market_normal"];
            imageNormal = [imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UIImage *imageSelected = [UIImage imageNamed:@"tabbar_market_selected"];
            imageSelected = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"闪送超市" image:imageNormal selectedImage:imageSelected];
        }
        else if (i == 2) {
            UIImage *imageNormal = [UIImage imageNamed:@"tabbar_shoppingCart_normal"];
            imageNormal = [imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UIImage *imageSelected = [UIImage imageNamed:@"tabbar_shoppingCart_selected"];
            imageSelected = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"购物车" image:imageNormal selectedImage:imageSelected];
        }
        else {
            UIImage *imageNormal = [UIImage imageNamed:@"tabbar_me_normal"];
            imageNormal = [imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UIImage *imageSelected = [UIImage imageNamed:@"tabbar_me_selected"];
            imageSelected = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:imageNormal selectedImage:imageSelected];
        }
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger selectIndex = [tabBar.items indexOfObject:item];
    if (selectIndex != oldIndex) {
        [self animationWithIndex:selectIndex];
    }
}

- (void)animationWithIndex:(NSInteger)index {
    // 按钮动画(图片和文字)
//    NSMutableArray *animationArrayM = [NSMutableArray array];
//    for (UIView *tabBarButton in self.tabBar.subviews) {
//        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [animationArrayM addObject:tabBarButton];
//        }
//    }
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"transform.scale";
//    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
//    animation.duration = 1;
//    animation.calculationMode = kCAAnimationCubic;
//    // 添加动画
//    [[animationArrayM[index] layer] addAnimation:animation forKey:nil];
//    
//    oldIndex = index;
    
    
    // 图片动画(仅图片)
    NSMutableArray *animationArrayM = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIImageView *imageV in tabBarButton.subviews) {
                if ([imageV isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    [animationArrayM addObject:imageV];
                }
            }
        }
    }
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.calculationMode = kCAAnimationCubic;
    // 添加动画
    [[animationArrayM[index] layer] addAnimation:animation forKey:nil];
    
    oldIndex = index;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
