//
//  ZGHDataBase.h
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/6.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "ZGHConsModel.h"

@interface ZGHDataBase : NSObject
//创建类方法,得到对象
+(ZGHDataBase *)defaultDataBase;
//1.增加数据
-(BOOL)addDataWithModel:(ZGHConsModel *)model;
//2.删除数据
-(BOOL)deleteDataWithModel:(ZGHConsModel *)model;
//3.查找数据
-(BOOL)findDataWithModel:(ZGHConsModel *)model;

//4.取数据
-(NSArray *)getData;
@end
