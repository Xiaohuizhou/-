//
//  ZGHKeModel.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHKeModel.h"

@implementation ZGHKeModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

+(ZGHKeModel *)modelWithDic:(NSDictionary *)dic{
    return [[ZGHKeModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

@end
