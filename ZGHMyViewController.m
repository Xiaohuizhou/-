//
//  ZGHMyViewController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHMyViewController.h"
#import "Alldefined.h"
#import "ZGHCollectController.h"
#import "ZGHCacheViewController.h"
#import "UIImageView+WebCache.h"

@interface ZGHMyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic) CGFloat cacheSize;
@end

@implementation ZGHMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUpView];
    [self createUI];
}
-(void)createUI{

}

-(void)createUpView{
    _tableView = [[UITableView alloc]initWithFrame:screenRect style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
    

    
    //上面的View
    UIView *upView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    upView.backgroundColor = [UIColor darkGrayColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(WIDTH/2-54, 0, 128, 148);
    
    UIImageView *img  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 108, 108)];
    img.image = [UIImage imageNamed:@"head_circle"];
    [button addSubview:img];
    UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(8, 8, 92, 92)];
    img1.image = [UIImage imageNamed:@"head_defaultt"];
    [img addSubview:img1];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 128, 108, 30)];
    label.text = @"登陆账号";
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [upView addSubview:button];
    self.tableView.tableHeaderView = upView;
    
    
}
-(void)buttonClick{
    NSLog(@"---");
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else{
        return 2;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
       if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    if (indexPath.section == 0) {
        
        cell.imageView.image = [UIImage imageNamed:@"personal_score"];
        cell.textLabel.text = @"缓存";
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-30, 20, 10, 20)];
        img.image = [UIImage imageNamed:@"sanjiaodc"];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-120, 20, 60, 20)];
        label.text = [NSString stringWithFormat:@"%.1fM",_cacheSize];
        [cell addSubview:label];
        
        [cell addSubview:img];
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"personal_doc"];
            cell.textLabel.text = @"我的医生";
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-30, 20, 10, 20)];
            img.image = [UIImage imageNamed:@"sanjiaodc"];
            [cell addSubview:img];

        }else{
            cell.imageView.image = [UIImage imageNamed:@"personal_order"];
            cell.textLabel.text = @"我的订单";
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-30, 20, 10, 20)];
            img.image = [UIImage imageNamed:@"sanjiaodc"];
            [cell addSubview:img];
        
        
        
        }
        
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"personal_pinlun"];
            cell.textLabel.text = @"我的评论";
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-30, 20, 10, 20)];
            img.image = [UIImage imageNamed:@"sanjiaodc"];
            [cell addSubview:img];

        }else{
        
            cell.imageView.image = [UIImage imageNamed:@"personal_shoucang"];
            cell.textLabel.text = @"我的收藏";
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-30, 20, 10, 20)];
            img.image = [UIImage imageNamed:@"sanjiaodc"];
            [cell addSubview:img];
        
        }
    
    
    }

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            NSLog(@"1");
        }else{
            ZGHCollectController *collect = [[ZGHCollectController alloc]init];
            [self.navigationController pushViewController:collect animated:YES];
        }
    }else if (indexPath.section == 0){
        //字节大小
        int byteSize = (int)[SDImageCache sharedImageCache].getSize;
        //M大小
        _cacheSize = byteSize / 1000.0 / 1000.0;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"清理缓存" message:[NSString stringWithFormat:@"缓存大小%.1fM",_cacheSize] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        

    
    }


}
#pragma mark -UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        //清除缓存
        [[SDImageCache sharedImageCache] clearDisk];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
