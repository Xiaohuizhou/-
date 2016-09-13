//
//  ZGHDrugModel.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHDrugModel.h"

@implementation ZGHDrugModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+(ZGHDrugModel *)modelWithDic:(NSDictionary *)dic{
    return [[ZGHDrugModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

@end
