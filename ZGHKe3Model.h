//
//  ZGHKe3Model.h
//  雨露健康助手
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGHKe3Model : NSObject
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *starscore;
@property(nonatomic,copy)NSString *subject;
@property(nonatomic,copy)NSString *onlinetime;
@property(nonatomic,copy)NSString *ordernum;
@property(nonatomic,copy)NSString *product;
@property(nonatomic,copy)NSString *free;
@property(nonatomic,copy)NSString *p_num;
@property(nonatomic,copy)NSString *total_num;
@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *hospital;
@property(nonatomic,copy)NSString *job;
@property(nonatomic,copy)NSString *speciality;
@property(nonatomic,copy)NSString *zdepart;
@property(nonatomic,copy)NSString *department;
@property(nonatomic,copy)NSString *isonline;
+(ZGHKe3Model *)modelWithDic:(NSDictionary *)dic;

@end
