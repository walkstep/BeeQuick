//
//  HomePageViewController.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/27.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

{
    UIButton *leftButton;
    UIButton *rightButton;
}

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];
    [self bindingViewModel];
}

- (void)initData {
    
}

- (void)initView {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = COLOR_WITH_HEX(kColorNavigationYellow);
    
    // 导航栏按钮
    leftButton = [UISetupHelper setupButtonWithTitle:@"扫一扫"
                                          titleColor:COLOR_WITH_HEX(kColorFontBlack)
                                            fontSize:10.0f
                                         normalImage:[UIImage imageNamed:@"barbuttonitem_scancode"]
                                     titleEdgeInsets:UIEdgeInsetsMake(22, -25, 0, 0)
                                     imageEdgeInsets:UIEdgeInsetsMake(-12, 4, 0, 0)];
    
    leftButton.frame = CGRectMake(0, 0, 40, 40);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    rightButton = [UISetupHelper setupButtonWithTitle:@"搜索"
                                           titleColor:COLOR_WITH_HEX(kColorFontBlack)
                                             fontSize:10.0f
                                          normalImage:[UIImage imageNamed:@"barbuttonitem_search"]
                                      titleEdgeInsets:UIEdgeInsetsMake(22, -12, 0, 0)
                                      imageEdgeInsets:UIEdgeInsetsMake(-12, 15, 0, 0)];
    rightButton.frame = CGRectMake(0, 0, 40, 40);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
}

- (void)bindingViewModel {
    [[leftButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"扫一扫");
    }];
    
    [[rightButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"搜索");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
