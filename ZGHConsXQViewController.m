//
//  ZGHConsXQViewController.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/5.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHConsXQViewController.h"
#import "SVProgressHUD.h"
#import "Alldefined.h"
#import "ZGHButton.h"
#import "UMSocial.h"
#import "ZGHDataBase.h"
#import "ZGHConsModel.h"

@interface ZGHConsXQViewController ()<UIWebViewDelegate>

@property (nonatomic) UIWebView *webView;
@end

@implementation ZGHConsXQViewController
- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView.delegate = self;
    [self loadData];
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

 __block  BOOL isHas = [[ZGHDataBase defaultDataBase]findDataWithModel:_consModel];
   
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
   // [btn1 setImage:[UIImage imageNamed:@"news_notcollect"] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(0, 0, 30, 30);

    if (!isHas) {
        [btn1 setImage:[UIImage imageNamed:@"news_notcollect"] forState:UIControlStateNormal];
        btn1.selected = !btn1.selected;
        
    }else{
        [btn1 setImage:[UIImage imageNamed:@"news_collect"] forState:UIControlStateNormal];
    
    }
    
    [btn1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    [Naview addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"news_share_img"] forState:UIControlStateNormal];
    btn2.frame = CGRectMake(50, 0, 30, 30);
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    [Naview addSubview:btn2];
    // Naview.backgroundColor =[UIColor whiteColor];添加到nav上
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
-(void)btn1Click:(UIButton *)btn{
    
    
    if (btn.selected == YES) {
        [btn setImage:[UIImage imageNamed:@"news_collect"] forState:UIControlStateNormal];
        
        [[ZGHDataBase defaultDataBase]addDataWithModel:_consModel];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 420, WIDTH/2-20, 40)];
        label.text = @"收藏成功";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = UIFont(18);
        [label setTextColor:[UIColor whiteColor]];
        label.alpha = 0.5;
        label.layer.cornerRadius = 10;
        label.clipsToBounds =YES;
        label.backgroundColor = [UIColor blackColor];
        
        [self.view addSubview:label];
        
        [UIView animateWithDuration:4.5 animations:^{
            label.alpha = 0.0;
        }completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];

    }else{
        [btn setImage:[UIImage imageNamed:@"news_notcollect"] forState:UIControlStateNormal];
        [[ZGHDataBase defaultDataBase]deleteDataWithModel:_consModel];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 420, WIDTH/2-20, 40)];
        label.text = @"取消收藏";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = UIFont(18);
        [label setTextColor:[UIColor whiteColor]];
        label.alpha = 0.5;
        label.layer.cornerRadius = 10;
        label.clipsToBounds =YES;
        label.backgroundColor = [UIColor blackColor];
        
        [self.view addSubview:label];
        
        [UIView animateWithDuration:2.5 animations:^{
            label.alpha = 0.0;
        }completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    
    }
     btn.selected = !btn.selected;

}



-(void)loadData{
    
    
    NSString *path = _model;
    NSLog(@"path:%@",path);
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
     [SVProgressHUD showSuccessWithStatus:@"OK" maskType:SVProgressHUDMaskTypeBlack];
}

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
