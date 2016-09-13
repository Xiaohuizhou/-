//
//  ZKButton.m
//  01-爱限免-框架
//
//  Created by zhaokai on 15/8/4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZKButton.h"
/**
 有两个类A类与B类,关系:在导航里面先加载A界面,再从A界面跳转到B界面
 需求:通过代理实现反向传值(将值从B类传到A类)
 A类:被动类(实现需求的类)   完成功能:遵守协议,实现协议方法,将本类设置成代理类
 B类:主动类(有需求的类)     完成功能:声明协议,生成代表任意类的属性(delegate),调用协议的方法
 
 需求:通过block实现反向传值
 主动类:ZKButton    完成功能:block变量的定义,block变量的调用
 被动类:ZKAppListViewController   完成功能:生成代码块儿
 */
@interface ZKButton ()
@property (nonatomic,assign) id<ZKButtonDelegate> delegate;
//注意:声明block类型使用copy
@property (nonatomic,copy) buttonBlock tempBlock;
@end

@implementation ZKButton
-(id)init{
    if (self = [super init]) {
        //这样写会让功能更加的严谨,不容易出问题.但是这里暂时不用
//        if (_delegate != nil) {
//            _delegate = nil;
//        }
    }
    return self;
}

+(ZKButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title action:(SEL)sel andTarget:(id)target{
    ZKButton *button = [ZKButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];

    return button;
}

+(ZKButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title andDelegate:(id<ZKButtonDelegate>)delegate{
    ZKButton *button = [ZKButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button addTarget:button action:@selector(myButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //将delegate的值接过来
    button.delegate = delegate;
    
    return button;
}

//代理方法中点击按钮调用的方法
-(void)myButtonClicked:(UIButton *)btn{
    //容错处理
    //respondsToSelector:判断前面的对象是否响应后面的方法
    //performSelector:前面的对象执行后面的方法
    if([_delegate respondsToSelector:@selector(presentViewController)]){
        [_delegate performSelector:@selector(presentViewController)];
    }
}

+(ZKButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title andBlock:(buttonBlock)myblock{
    ZKButton *button = [ZKButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button addTarget:button action:@selector(buttonBlockClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    button.tempBlock = myblock;
    
    return button;
}

-(void)buttonBlockClicked:(UIButton *)btn{
    //调用block变量
    _tempBlock();
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
