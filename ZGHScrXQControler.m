//
//  ZGHScrXQControler.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/9/27.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHScrXQControler.h"
#import "ZGHHeadScrModel.h"
#import "SVProgressHUD.h"
#import "Alldefined.h"
#import "ZGHButton.h"
#import "UMSocial.h"


@interface ZGHScrXQControler ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic)BOOL isHas;

@end

@implementation ZGHScrXQControler

- (void)viewDidLoad {
    [super viewDidLoad];
     self.webView.delegate = self;

    _isHas =YES;
    [self loadData];//网页下载
    [self createNav];//上边的nav
    [self createDowntfn];//下边的field
    [self registerObserver];//注册监听者
    
}

-(void)createDowntfn{
    UIView *downView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-60, WIDTH, 60)];
    downView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:downView];
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, WIDTH-100, 40)];
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.placeholder = @"说两句把~~~";
    field.clearButtonMode = UITextFieldViewModeAlways;
    field.clearsOnBeginEditing = YES;
    field.autocapitalizationType = UITextAutocapitalizationTypeNone;
    field.autocorrectionType = UITextAutocorrectionTypeNo;
    [downView addSubview:field];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(WIDTH-80, 10, 70, 40);
    [btn setImage:[UIImage imageNamed:@"news_comment"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btn3Click) forControlEvents:UIControlEventTouchUpInside];
    [downView addSubview:btn];

}
//评论
-(void)btn3Click{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请登录后发表内容" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
    
}

//收藏、分享
-(void)createNav{

    
    UIView *Naview = [[UIView alloc]initWithFrame:CGRectMake(0, 5, 80, 30)];
    
//   __block ZGHButton *btn1 = [ZGHButton buttonWithFrame:CGRectMake(0, 0, 30, 30) title:@"" andBlock:^{
//       if (_isHas == YES) {
//           [btn1 setImage:[UIImage imageNamed:@"news_notcollect"] forState:UIControlStateNormal];
//           _isHas = !_isHas;
//           [Naview addSubview:btn1];
//       }else{
//           [btn1 setImage:[UIImage imageNamed:@"news_collect"] forState:UIControlStateNormal];
//           _isHas = !_isHas;
//           [Naview addSubview:btn1];
//       
//       }
//    }];
//    //判断第一次进来的时候
//    if (_isHas) {
//        [btn1 setBackgroundImage:[UIImage imageNamed:@"news_notcollect"] forState:UIControlStateNormal];
//        _isHas = !_isHas;
//        [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
//        
//        [Naview addSubview:btn1];
//    }
//    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"news_share_img"] forState:UIControlStateNormal];
    btn2.frame = CGRectMake(50, 0, 30, 30);
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    [Naview addSubview:btn2];
   // Naview.backgroundColor =[UIColor whiteColor];
    UIBarButtonItem *item =[[UIBarButtonItem alloc]initWithCustomView:Naview];
    self.navigationItem.rightBarButtonItem = item;
    

}
-(void)btn2Click{
    //NSLog(@"分享");
    [UMSocialSnsService presentSnsIconSheetView:self appKey:nil shareText:nil shareImage:nil shareToSnsNames:@[UMShareToTencent,UMShareToTwitter,UMShareToSms,UMShareToRenren,UMShareToSina,UMShareToQzone,UMShareToEmail,UMShareToDouban] delegate:nil];
}

//实现回调方法
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}
-(void)btn1Click{
    NSLog(@"shoucang");
    

}



- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:_webView];
       
    }
    return _webView;
}

-(void)loadData{

   
    NSString *path = _scrModel.siteurl;
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

//向通知中心,注册观察者
//用来观察键盘有没有显示或隐藏
-(void)registerObserver
{
    
    //首先获取通知中心,这个通知中心对象是一个单例对象
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    //向通知中心去注册两个观察消息,
    //第一个用来观察键盘是不是升起
    [notificationCenter addObserver:self selector:@selector(keyboardShow) name:UITextFieldTextDidBeginEditingNotification object:nil];
    //第二个用来观察键盘是不是隐藏
    [notificationCenter addObserver:self selector:@selector(keyboardHidden) name:UITextFieldTextDidEndEditingNotification object:nil];
}
//这两个方法是观察者响应的方法
-(void)keyboardShow
{
    __block CGRect bounds = self.view.bounds;
    [UIView animateWithDuration:0.5 animations:^{
        bounds.origin.y = 220;
        self.view.bounds  = bounds;
    }];
}
-(void)keyboardHidden
{
    //因为局部变量,在block里是不允许更改的,如果想要更改需要在变量定义前加到 __block 进行修饰
    __block CGRect bounds = self.view.bounds;
    [UIView animateWithDuration:0.5 animations:^{
        bounds.origin.y = 0;
        self.view.bounds  = bounds;
    }];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];

}


@end
