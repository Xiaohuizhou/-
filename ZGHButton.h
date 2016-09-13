//
//  ZGHButton.h
//  SinaApp
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^buttonBlock)();
@interface ZGHButton : UIButton

//实现block的方法
+(ZGHButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title andBlock:(buttonBlock)myblock;

@end
