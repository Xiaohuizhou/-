//
//  AppDelegate.h
//  雨露健康助手
//
//  Created by 周凯辉 on 15/9/27.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//kGkQl9GjBnLHR3bMOdYlTvus 百度Key

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BMapKit.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(nonatomic,strong)BMKMapManager *mapManager;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

