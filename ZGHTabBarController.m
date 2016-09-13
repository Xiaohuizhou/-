//
//  ZGHTabBarController.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/9/27.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHTabBarController.h"
#import "Alldefined.h"
#import "ZGHHeadViewController.h"
#import "ZGHSelfViewController.h"
#import "ZGHConsultViewController.h"
#import "ZGHMyViewController.h"
@interface ZGHTabBarController ()<UITabBarDelegate>

@end

@implementation ZGHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self prepareUI];
}

-(void)prepareUI{
    //shouye
    ZGHHeadViewController *headView  = [[ZGHHeadViewController alloc]init];
    UINavigationController *nvc1 = [[UINavigationController alloc]initWithRootViewController:headView];
    
    nvc1.tabBarItem.image =[[self image:[UIImage imageNamed:@"nav02@2x"]byScalingToSize:CGSizeMake(WIDTH/3, 42)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvc1.tabBarItem.selectedImage = [[self image:[UIImage imageNamed:@"nav_hov02@2x"]byScalingToSize:CGSizeMake(WIDTH/3, 42)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    headView.navigationItem.title = @"首页";
    
    
    //zicha
    ZGHSelfViewController *selfView  = [[ZGHSelfViewController alloc]init];
    UINavigationController *nvc2 = [[UINavigationController alloc]initWithRootViewController:selfView];
    
    nvc2.tabBarItem.image =[[self image:[UIImage imageNamed:@"nav03@2x"]byScalingToSize:CGSizeMake(WIDTH/3, 42)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvc2.tabBarItem.selectedImage = [[self image:[UIImage imageNamed:@"nav_hov03@2x"]byScalingToSize:CGSizeMake(WIDTH/3, 42)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selfView.navigationItem.title = @"自查";
    
    
    
    //咨询
    ZGHConsultViewController *consultView  = [[ZGHConsultViewController alloc]init];
    UINavigationController *nvc3 = [[UINavigationController alloc]initWithRootViewController:consultView];
    
    nvc3.tabBarItem.image =[[self image:[UIImage imageNamed:@"nav04@2x"]byScalingToSize:CGSizeMake(WIDTH/3, 42)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvc3.tabBarItem.selectedImage = [[self image:[UIImage imageNamed:@"nav_hov04@2x"]byScalingToSize:CGSizeMake(WIDTH/3, 42)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    consultView.navigationItem.title = @"健康咨询";
    
    
    
    //我的
    ZGHMyViewController *myView  = [[ZGHMyViewController alloc]init];
    UINavigationController *nvc4 = [[UINavigationController alloc]initWithRootViewController:myView];
    
    nvc4.tabBarItem.image =[[self image:[UIImage imageNamed:@"nav05@2x"]byScalingToSize:CGSizeMake(WIDTH/4, 42)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    nvc4.tabBar/Volumes/1/IOS/UIdaywork/day16 UICollectionView/code/3_UICollectionView/3_UICollectionView/TravelCell.hItem.selectedImage = [[self image:[UIImage imageNamed:@"nav_hov05@2x"]byScalingToSize:CGSizeMake(WIDTH/4, 42)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myView.navigationItem.title = @"我的";
    
    NSArray *array = @[nvc1,nvc2,nvc3,nvc4];
    
    self.viewControllers = array;
    //设置tabbar为白色；
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:bgView atIndex:0];
    self.tabBar.opaque = YES;

 
}



#pragma mark 改变图片尺寸
- (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize {
    UIImage *sourceImage = image;
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width  = WIDTH/4;
    thumbnailRect.size.height = 46;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage ;
}

@end
