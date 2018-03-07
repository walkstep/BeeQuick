//
//  ShoppingCartViewController.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/27.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "ShoppingCartViewController.h"

@interface ShoppingCartViewController ()

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];
    [self bindingViewModel];
}

- (void)initData {
    
}

- (void)initView {
    self.title = @"购物车";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)bindingViewModel {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
