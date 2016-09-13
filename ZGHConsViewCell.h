//
//  ZGHConsViewCell.h
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/5.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGHConsModel.h"
@interface ZGHConsViewCell : UITableViewCell
@property(nonatomic,strong)ZGHConsModel *model;
-(void)fillCare:(ZGHConsModel *)model;

@end
