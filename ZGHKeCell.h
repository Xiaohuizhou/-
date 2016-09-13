//
//  ZGHKeCell.h
//  雨露健康助手
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZGHKeModel;
@interface ZGHKeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *docimage;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *hospital;
@property (weak, nonatomic) IBOutlet UILabel *expert;

@property(nonatomic,strong)ZGHKeModel *model;
@end
