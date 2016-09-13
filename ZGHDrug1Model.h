//
//  ZGHDrug1Model.h
//  雨露健康助手
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGHDrug1Model : NSObject
@property(nonatomic,copy)NSString *store_id;
@property(nonatomic,copy)NSString *store_name;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *service;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *is_send;
@property(nonatomic,copy)NSString *longitude;
@property(nonatomic,copy)NSString *latitude;
@property(nonatomic,copy)NSString *distance;

+(ZGHDrug1Model *)modelWithDic:(NSDictionary *)dic;
@end
