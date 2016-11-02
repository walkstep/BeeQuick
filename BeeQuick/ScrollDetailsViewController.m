//
//  ScrollDetailsViewController.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/11/1.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "ScrollDetailsViewController.h"

@interface ScrollDetailsViewController ()<UIWebViewDelegate, NJKWebViewProgressDelegate>

{
    UIWebView *webView;
    NJKWebViewProgress *progressProxy;
    NJKWebViewProgressView *progressView;
}

@end

@implementation ScrollDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar addSubview:progressView];
}

- (void)initView {
    self.title = self.titleStr;
    self.navigationController.navigationBar.barTintColor = COLOR_WITH_HEX(kColorWhite);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_refresh"] style:UIBarButtonItemStyleDone target:self action:@selector(clickRightBtn)];
    
    webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    webView.backgroundColor = COLOR_WITH_HEX(kColorWhite);

    progressProxy = [[NJKWebViewProgress alloc] init];
    // 使用Masonry布局会导致进度条不显示
    progressView = [[NJKWebViewProgressView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 2)];
    
    webView.delegate = progressProxy;
    progressProxy.webViewProxyDelegate = self;
    progressProxy.progressDelegate = self;
    progressView.progress = 0;
    
    [self.view addSubview:webView];
    
    // 约束
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    NSURL *url = [NSURL URLWithString:self.requestUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

#pragma mark - private method
- (void)clickLeftBtn {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)clickRightBtn {
    [webView reload];
}

#pragma mark - NJKWebViewProgressDelegate
- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress {
    [progressView setProgress:progress animated:YES];
}

@end
