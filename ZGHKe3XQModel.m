//
//  ZGHKe3XQModel.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHKe3XQModel.h"

@implementation ZGHKe3XQModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    //手动赋值
    //    if ([key isEqualToString:@"id"]) {
    //        _nid = value;
    //    }
    
}

+(ZGHKe3XQModel *)modelWithDic:(NSDictionary *)dic{
    return [[ZGHKe3XQModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

@end
