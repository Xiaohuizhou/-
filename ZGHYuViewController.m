//
//  ZGHYuViewController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHYuViewController.h"
#import "SVProgressHUD.h"
@interface ZGHYuViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;
@end

@implementation ZGHYuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;

    [self loadData];
    UIBarButtonItem *item =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"homeBack"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)itemClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_webView];
        
    }
    return _webView;
}

-(void)loadData{
    
    
    NSString *path = @"http://api.m.xywy.com/api/?m=User&act=appPrivacyPolicy&app=appointmentNotice";
   
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    
    
}



- (void)webViewDidStartLoad:(UIWebView *)webView {
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
     [SVProgressHUD showSuccessWithStatus:@"OK" maskType:SVProgressHUDMaskTypeBlack];
}




@end
