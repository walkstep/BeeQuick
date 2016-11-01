//
//  ScrollDetailsViewController.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/11/1.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "ScrollDetailsViewController.h"

@interface ScrollDetailsViewController ()

{
    UIWebView *webView;
}

@end

@implementation ScrollDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];
}

- (void)initData {
    
}

- (void)initView {
    self.navigationController.navigationBar.barTintColor = COLOR_WITH_HEX(kColorWhite);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_goback"] style:UIBarButtonItemStyleDone target:self action:@selector(clickLeftBtn)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_refresh"] style:UIBarButtonItemStyleDone target:self action:@selector(clickRightBtn)];
    
    webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    
    NSURL *url = [NSURL URLWithString:@"http://www.sfbest.com/html/zt/xianguoxinyu/index.html?device=2"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark - private method
- (void)clickLeftBtn {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickRightBtn {
    NSLog(@"刷新");
}

@end
