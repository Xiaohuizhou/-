//
//  ZGHConsultViewController.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/9/27.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHConsultViewController.h"
#import "SCNavTabBarController.h"
#import "ZGHConsDataController.h"
#import "Alldefined.h"

@interface ZGHConsultViewController ()
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation ZGHConsultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArr = [[NSMutableArray alloc]init];
    
    
    
    ZGHConsDataController *oneViewController = [[ZGHConsDataController alloc] init];
    oneViewController.title = @"头条";
    oneViewController.urlStr =HEADER_URL;
    oneViewController.view.backgroundColor = [UIColor brownColor];
    
    ZGHConsDataController *twoViewController = [[ZGHConsDataController alloc] init];
    twoViewController.title = @"两性";
    twoViewController.urlStr =TWO_URL;
    twoViewController.view.backgroundColor = [UIColor purpleColor];
    
    ZGHConsDataController *threeViewController = [[ZGHConsDataController alloc] init];
    threeViewController.title = @"母婴";
    threeViewController.urlStr =THREE_URL;
    threeViewController.view.backgroundColor = [UIColor orangeColor];
    
    ZGHConsDataController *fourViewController = [[ZGHConsDataController alloc] init];
    fourViewController.title = @"减肥";
    fourViewController.urlStr = FOUR_URL;
    fourViewController.view.backgroundColor = [UIColor magentaColor];
    
    ZGHConsDataController *fiveViewController = [[ZGHConsDataController alloc] init];
    fiveViewController.title = @"美容";
    fiveViewController.urlStr = FIVE_URL;
    fiveViewController.view.backgroundColor = [UIColor yellowColor];
   

    
    SCNavTabBarController *navTabBarController = [[SCNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[oneViewController, twoViewController, threeViewController, fourViewController, fiveViewController];
    navTabBarController.showArrowButton = YES;
    [navTabBarController addParentController:self];
    
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
