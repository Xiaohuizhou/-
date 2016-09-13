//
//  ZGHNewViewController.m
//  雨露健康助手
//
//  Created by 周光辉 on 16/3/14.
//  Copyright © 2016年 周光辉. All rights reserved.
//

#import "ZGHNewViewController.h"

@interface ZGHNewViewController ()

@end

@implementation ZGHNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT/2)];
    view.backgroundColor = [UIColor grayColor];
    [self.view  addSubview:view];
    
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 64+HEIGHT/2, WIDTH, 300)];
    view1.backgroundColor = [UIColor blackColor];
    [self.navigationController.view  addSubview:view1];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, WIDTH/3, 30)];
    label.text = @"点击添加栏目";
    [view addSubview:label];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
