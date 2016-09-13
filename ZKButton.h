//
//  ZKButton.h
//  01-爱限免-框架
//
//  Created by zhaokai on 15/8/4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZKButtonDelegate <NSObject>
//通过点击实现界面的跳转
-(void)presentViewController;

@end

typedef void(^buttonBlock)();

@interface ZKButton : UIButton

//通过类方法得到一个按钮
//1.驼峰原则  2.做到见名知意
+(ZKButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title action:(SEL)sel andTarget:(id)target;

//实现代理使用的方法
+(ZKButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title andDelegate:(id<ZKButtonDelegate>)delegate;
//实现block的方法
+(ZKButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title andBlock:(buttonBlock)myblock;
@end
