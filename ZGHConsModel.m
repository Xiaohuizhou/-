//
//  ZGHConsModel.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/5.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHConsModel.h"

@implementation ZGHConsModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

+(ZGHConsModel *)modelWithDic:(NSDictionary *)dic{
    return [[ZGHConsModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}



@end
