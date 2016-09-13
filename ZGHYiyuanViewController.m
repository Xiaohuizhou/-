//
//  ZGHYiyuanViewController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHYiyuanViewController.h"
#import "SVProgressHUD.h"
#import "ZGHDrug1Model.h"

@interface ZGHYiyuanViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation ZGHYiyuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    
    [self loadData];//网页下载
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"<返回" style:UIBarButtonItemStylePlain target:self action:@selector(itemClick)];
    self.navigationItem.leftBarButtonItem = item;
    
}
-(void)itemClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_webView];
        
    }
    return _webView;
}

-(void)loadData{
    
    
    NSString *path =_model.url;
    // NSLog(@"path:%@",path);
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    
    
}



- (void)webViewDidStartLoad:(UIWebView *)webView {
    // NSLog(@"start ...");
    [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeBlack];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"error: %@", error);
}

//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    NSURL *url = request.URL;
//
//    if ([[url scheme] isEqualToString:@"http"]) {
//        NSLog(@"进入了要！");
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"确定要打开网页？" message:[url absoluteString] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
//        [alertView show];
//    }
//
//    return YES;
//}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //  NSLog(@"load end");
    [SVProgressHUD showSuccessWithStatus:@"加载成功" maskType:SVProgressHUDMaskTypeBlack];}


@end
