//
//  ZGHHeadScrModel.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/9/27.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHHeadScrModel.h"

@implementation ZGHHeadScrModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

+(ZGHHeadScrModel *)modelWithDic:(NSDictionary *)dic{
    return [[ZGHHeadScrModel alloc]initWithDic:dic];
}

-(id)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}




@end
