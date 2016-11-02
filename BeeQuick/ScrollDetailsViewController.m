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
    
    [self initData];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar addSubview:progressView];
}

- (void)initData {
    
}

- (void)initView {
    self.title = self.titleStr;
    self.navigationController.navigationBar.barTintColor = COLOR_WITH_HEX(kColorWhite);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_refresh"] style:UIBarButtonItemStyleDone target:self action:@selector(clickRightBtn)];
    
    webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    webView.backgroundColor = COLOR_WITH_HEX(kColorWhite);
    webView.delegate = self;

    progressProxy = [[NJKWebViewProgress alloc] init];
//    progressView = [[NJKWebViewProgressView alloc] initWithFrame:CGRectZero];
    
    CGRect navBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0,
                                 navBounds.size.height - 2,
                                 navBounds.size.width,
                                 2);
    progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    
    progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    webView.delegate = progressProxy;
    progressProxy.webViewProxyDelegate = self;
    progressProxy.progressDelegate = self;
    progressView.progress = 0;
    
    NSURL *url = [NSURL URLWithString:self.requestUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    
    [self.view addSubview:webView];
//    s[self.view addSubview:progressView];
    
    // 约束
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
//    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.and.top.and.right.mas_equalTo(0);
//        make.height.mas_equalTo(2);
//    }];
    
    [webView loadRequest:request];
}

#pragma mark - private method
- (void)clickLeftBtn {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)clickRightBtn {
    NSLog(@"刷新");
}

#pragma mark - NJKWebViewProgressDelegate
- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress {
    NSLog(@"----%f", progress);
    [progressView setProgress:progress animated:YES];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    //progressView.hidden = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //progressView.hidden = YES;
}

@end
