//
//  ZGHConsXQViewController.h
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/5.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGHConsModel;

@interface ZGHConsXQViewController : UIViewController
@property(nonatomic,copy)NSString *model;

@property(nonatomic,strong)ZGHConsModel *consModel;
@end
