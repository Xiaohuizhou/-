//
//  ZGHCollectController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHCollectController.h"
#import "ZGHConsViewCell.h"
#import "ZGHDataBase.h"
#import "Alldefined.h"
#import "ZGHConsXQViewController.h"

@interface ZGHCollectController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArr;

@end

@implementation ZGHCollectController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收藏";
    
    _dataArr = [[ZGHDataBase defaultDataBase]getData];
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT)];;
    _tableView.delegate =self;
    _tableView.dataSource =self;
    _tableView.rowHeight = 100;
    [self.view addSubview:_tableView];
    
    [self.tableView registerClass:[ZGHConsViewCell class] forCellReuseIdentifier:@"cellID"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZGHConsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    ZGHConsModel *model = _dataArr[indexPath.row];
    
    [cell fillCare:model];
   
    
    //创建长按手势
    UILongPressGestureRecognizer * longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)];
    
    [cell addGestureRecognizer:longPressGesture];
    
    //设置长按前的点击次数(必须要点够指定的次数后,才能触发长按,否则不能触发)
  //  longPressGesture.numberOfTapsRequired = 1;
    //设置长按触发的时间
    longPressGesture.minimumPressDuration = 2;
    //长按时,手指允许移动 的范围
    longPressGesture.allowableMovement = 20;
    

    
    return cell;
}
//手势的响应方法
-(void)longPressAction:(UILongPressGestureRecognizer *)longPress
{
    
    if (longPress.state == UIGestureRecognizerStateBegan) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确定删除吗？" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:@"取消", nil];
        [alert show];
    }
    
}

#pragma marks -- UIAlertViewDelegate --
//根据被点击按钮的索引处理点击事件
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [[ZGHDataBase defaultDataBase]deleteDataWithModel:_model];
         [self.tableView reloadData];
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZGHConsModel *model = _dataArr[indexPath.row];
    ZGHConsXQViewController *xq = [[ZGHConsXQViewController alloc]init];
    xq.consModel = model;
    xq.model = model.url;
    xq.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:xq animated:YES];

   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
