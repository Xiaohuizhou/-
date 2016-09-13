//
//  ZGHPharModel.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHPharModel.h"

@implementation ZGHPharModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
+(ZGHPharModel *)modelWithDic:(NSDictionary *)dic{
    return [[ZGHPharModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}




@end
