//
//  ZGHCellModel.h
//  雨露健康助手
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGHCellModel : NSObject
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *level;
@property(nonatomic,copy)NSString *kind;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *telephone;
@property(nonatomic,copy)NSString *way;
@property(nonatomic,copy)NSString *info;
@property(nonatomic,copy)NSString *npid;
@property(nonatomic,copy)NSString *doctorNumForAsk;
@property(nonatomic,copy)NSString *doctorNumForOrder;
+(ZGHCellModel *)modelWithDic:(NSDictionary *)dic;

@end
