//
//  ZGHWeighModel.h
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/1.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGHWeighModel : NSObject
/**
 *名字
 */
@property(nonatomic,copy)NSString *expert_id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *level;
@property(nonatomic,copy)NSString *teach;
@property(nonatomic,copy)NSString *hospital;
@property(nonatomic,copy)NSString *depart;
@property(nonatomic,copy)NSString *goodat;
@property(nonatomic,copy)NSString *doctorid;
@property(nonatomic,copy)NSString *help_num;
@property(nonatomic,copy)NSString *info;
@property(nonatomic,copy)NSString *plusNum;
@property(nonatomic,copy)NSString *schedule;
@property(nonatomic,copy)NSString *plus_require;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *rdtime;


@property(nonatomic,copy)NSString *wei_id;

+(ZGHWeighModel *)modelWithDic:(NSDictionary *)dic;

@end
