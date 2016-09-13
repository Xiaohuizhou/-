//
//  ZGHKe3Model.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHKe3Model.h"

@implementation ZGHKe3Model
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    //手动赋值
    //    if ([key isEqualToString:@"id"]) {
    //        _nid = value;
    //    }
    
}

+(ZGHKe3Model *)modelWithDic:(NSDictionary *)dic{
    return [[ZGHKe3Model alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

@end
