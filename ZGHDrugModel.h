//
//  ZGHDrugModel.h
//  雨露健康助手
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGHDrugModel : NSObject
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *longitude;
@property(nonatomic,copy)NSString *latitude;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *kind;
@property(nonatomic,copy)NSString *level;
@property(nonatomic,copy)NSString *telephone;
@property(nonatomic,copy)NSString *distance;
@property(nonatomic,copy)NSString *province;
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *info;
@property(nonatomic,copy)NSString *plus_expert;
@property(nonatomic,copy)NSString *ask_expert;

+(ZGHDrugModel *)modelWithDic:(NSDictionary *)dic;
@end
