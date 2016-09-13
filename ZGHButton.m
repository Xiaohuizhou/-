//
//  ZGHButton.m
//  SinaApp
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZGHButton.h"
@interface ZGHButton ()
//注意:声明block类型使用copy
@property (nonatomic,copy) buttonBlock tempBlock;
@end
@implementation ZGHButton
-(id)init{
    if (self = [super init]) {
        //这样写会让功能更加的严谨,不容易出问题.但是这里暂时不用
        //        if (_delegate != nil) {
        //            _delegate = nil;
        //        }
    }
    return self;
}


+(ZGHButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title andBlock:(buttonBlock)myblock{
    ZGHButton *button = [ZGHButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    [button addTarget:button action:@selector(buttonBlockClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    button.tempBlock = myblock;
    
    return button;
}

-(void)buttonBlockClicked:(UIButton *)btn{
    //调用block变量
    _tempBlock();
}

@end
