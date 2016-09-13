//
//  ZGHCellModel.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHCellModel.h"

@implementation ZGHCellModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+(ZGHCellModel *)modelWithDic:(NSDictionary *)dic{
    return [[ZGHCellModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

@end
