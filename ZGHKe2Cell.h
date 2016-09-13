//
//  ZGHKe2Cell.h
//  雨露健康助手
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZGHKe2Model,ZGHKe3Model;
@interface ZGHKe2Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *goodat;
@property (weak, nonatomic) IBOutlet UILabel *hospital;
@property (weak, nonatomic) IBOutlet UILabel *depart;
@property (weak, nonatomic) IBOutlet UILabel *help;

@property(nonatomic,strong)ZGHKe2Model *model;
@property(nonatomic,strong)ZGHKe3Model *model1;
@end
