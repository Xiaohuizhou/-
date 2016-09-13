//
//  ZGHWeiXQController.h
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/2.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZGHWeighModel;
@interface ZGHWeiXQController : UIViewController

@property(nonatomic,copy)NSString *wid;

@property(nonatomic,copy)NSString *wid2;
- (IBAction)geRenbtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *title1;
@property (weak, nonatomic) IBOutlet UILabel *teach;
@property (weak, nonatomic) IBOutlet UILabel *depart;
@property (weak, nonatomic) IBOutlet UILabel *hospital;
@property (weak, nonatomic) IBOutlet UILabel *goodat;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
- (IBAction)yuYue:(id)sender;

@end


