//
//  ZGHDrug1Model.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHDrug1Model.h"

@implementation ZGHDrug1Model
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+(ZGHDrug1Model *)modelWithDic:(NSDictionary *)dic{
    return [[ZGHDrug1Model alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}


@end
