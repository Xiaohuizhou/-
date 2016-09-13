//
//  HomeAppDelegate.h
//  Ask
//
//  Created by wanghao on 12-7-20.
//  Copyright (c) 2012年 _WWW.XYWY.COM_. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BMapKit.h"
#import "LocationManager.h"
#import "WXApi.h"
#import "WeiboSDK.h"


@class LeveyTabBarController;
@class AskHomePageViewController;
@class Disease_CheckViewController;
@class WKMyHospitalViewController;
@class InfoListViewController;
#import "AskUserCenterViewController.h"
#import "MyQuestionDetailViewController.h"
//Sina开发者key
#define kAppKey             @"4115360015"
//#define kAppSecret          @"2bf624236d3292c26c0c1e5896084f99"
//#define kAppRedirectURI     @"http://www.xywy.com"


@interface AskAppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate,UINavigationControllerDelegate,UITabBarControllerDelegate,WXApiDelegate,WeiboSDKDelegate>
{
    BMKMapManager         * _mapManager;
}

@property (strong, nonatomic) UIWindow *window;


//tabBar ViewController
@property (nonatomic, retain) LeveyTabBarController * leveyTabBarController;
//tabBar ViewControllers
@property (retain, nonatomic) AskHomePageViewController     * firstVC;  //问医生
@property (retain, nonatomic) Disease_CheckViewController   * fourthVC; //查疾病
@property (retain, nonatomic) WKMyHospitalViewController    * secondVC; //我的医院
@property (retain, nonatomic) InfoListViewController        * thirdVC;  //资讯
@property (retain, nonatomic) AskUserCenterViewController   * fifthVC;  //我的
//alipay ViewController
@property (retain, nonatomic) BaseUIViewController          * alipayVC;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (assign,nonatomic)NSString   *addScoreType;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
