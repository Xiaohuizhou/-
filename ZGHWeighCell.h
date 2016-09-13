//
//  ZGHWeighCell.h
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/2.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGHWeighModel;

@interface ZGHWeighCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *depart;
@property (weak, nonatomic) IBOutlet UILabel *hospital;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *goodat;

@property(nonatomic,strong)ZGHWeighModel *model;

@end
