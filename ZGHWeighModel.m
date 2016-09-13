//
//  ZGHWeighModel.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/1.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHWeighModel.h"

@implementation ZGHWeighModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

+(ZGHWeighModel *)modelWithDic:(NSDictionary *)dic{
    return [[ZGHWeighModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}
@end
