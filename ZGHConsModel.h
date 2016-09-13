//
//  ZGHConsModel.h
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/5.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGHConsModel : NSObject

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *categoryid;
@property(nonatomic,copy)NSString *briefinfo;
@property(nonatomic,copy)NSString *smallimg;
@property(nonatomic,copy)NSString *imgurl;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *commentcount;
@property(nonatomic,copy)NSString *url;

+(ZGHConsModel *)modelWithDic:(NSDictionary *)dic;


@end
