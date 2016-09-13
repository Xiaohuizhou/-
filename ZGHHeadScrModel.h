//
//  ZGHHeadScrModel.h
//  雨露健康助手
//
//  Created by 周凯辉 on 15/9/27.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGHHeadScrModel : NSObject
/**
 *图片
 */
@property(nonatomic,copy)NSString *imgurl;
@property(nonatomic,copy)NSString *siteurl;
@property(nonatomic,copy)NSString *type;
//@property(nonatomic,copy)NSString *payload;
+(ZGHHeadScrModel *)modelWithDic:(NSDictionary *)dic;

@end
