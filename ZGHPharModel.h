//
//  ZGHPharModel.h
//  雨露健康助手
//
//  Created by qianfeng on 15/10/16.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGHPharModel : NSObject
/**
 *点击每个cell做什么
 */

@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)int first;
@property(nonatomic,copy)NSString *content;


+(ZGHPharModel *)modelWithDic:(NSDictionary *)dic;
@end
