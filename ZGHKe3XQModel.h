//
//  ZGHKe3XQModel.h
//  雨露健康助手
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGHKe3XQModel : NSObject
@property(nonatomic,copy)NSString *special;
@property(nonatomic,copy)NSString *shortinfo;
@property(nonatomic,copy)NSString *words;
@property(nonatomic,copy)NSString *job;
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *subject;
@property(nonatomic,copy)NSString *hospital;


+(ZGHKe3XQModel *)modelWithDic:(NSDictionary *)dic;
@end
