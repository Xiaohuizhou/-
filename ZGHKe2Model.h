//
//  ZGHKe2Model.h
//  雨露健康助手
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGHKe2Model : NSObject

@property(nonatomic,copy)NSString *doctor_id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *depart;
@property(nonatomic,copy)NSString *hospital;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *docimage;
@property(nonatomic,copy)NSString *teach;
@property(nonatomic,copy)NSString *goodat;
@property(nonatomic,copy)NSString *info;
@property(nonatomic,copy)NSString *uuidHospital;
@property(nonatomic,copy)NSString *uuidDepart;
@property(nonatomic,copy)NSString *expert_pic;
@property(nonatomic,copy)NSString *is_plus;
@property(nonatomic,copy)NSString *help;

@property(nonatomic,copy)NSString *id;
+(ZGHKe2Model *)modelWithDic:(NSDictionary *)dic;
@end
