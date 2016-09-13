//
//  ZGHKeModel.h
//  雨露健康助手
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGHKeModel : NSObject
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *hospitalid;
@property(nonatomic,copy)NSString *docimage;
@property(nonatomic,copy)NSString *department;
@property(nonatomic,copy)NSString *teach;
@property(nonatomic,copy)NSString *hospital;
@property(nonatomic,copy)NSString *department1;
@property(nonatomic,copy)NSString *expert;
@property(nonatomic,copy)NSString *synopsis;
@property(nonatomic,copy)NSString *info_open;
@property(nonatomic,copy)NSString *departmentid;
@property(nonatomic,copy)NSString *plus_num;
@property(nonatomic,copy)NSString *ask_num;
@property(nonatomic,copy)NSString *is_consult;
@property(nonatomic,copy)NSString *is_plus;
@property(nonatomic,copy)NSString *plusRequire;
@property(nonatomic,copy)NSString *eid;
@property(nonatomic,copy)NSString *photo;

@property(nonatomic,copy)NSString *wei_id;
+(ZGHKeModel *)modelWithDic:(NSDictionary *)dic;

@end
