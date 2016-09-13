//
//  ZGHCellViewController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHCellViewController.h"
#import "Alldefined.h"
#import "AFNetworking.h"
#import "ZGHCellModel.h"

@interface ZGHCellViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArry;
@property(nonatomic,strong)ZGHCellModel *model;

@end

@implementation ZGHCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createData];
    
    _tableView = [[UITableView alloc]initWithFrame:screenRect style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
  //  [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
    image.image =[UIImage imageNamed:@"hospitalbackground"];
    self.tableView.tableHeaderView = image;
    
    UIBarButtonItem *litem = [[UIBarButtonItem alloc]initWithTitle:@"<返回" style:UIBarButtonItemStylePlain target:self action:@selector(itemClick)];
    self.navigationItem.leftBarButtonItem = litem;
    UIBarButtonItem *ritem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"homeBack"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick1)];
    self.navigationItem.rightBarButtonItem = ritem;
}
-(void)itemClick1{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
                              
-(void)itemClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}
                              

-(void)createData{
    NSString *path = [NSString stringWithFormat:@"%@&id=%@&tag=dreamonly&sign=dfbef3a89f387b498176498794c43996",YIYUANXQ2_URL,_nid];
    NSLog(@"path:%@",path);
    AFHTTPRequestOperationManager *manager= [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self analyseJson:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

-(void)analyseJson:(NSData *)data{
    _dataArry = [NSMutableArray array];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dic = dict[@"data"];
         _model= [ZGHCellModel modelWithDic:dic];
        [_dataArry addObject:_model];
        NSLog(@"--%@",_dataArry);
     [self.tableView reloadData];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
//    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
//    }
    if (indexPath.row == 0) {
        UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 300)];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH-20, 280)];
        
        label.text = [NSString stringWithFormat:@"医院介绍：%@",_model.info];
        NSLog(@"--%@",_model.info);
        
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.font = UIFont(13);
     
        [view addSubview:label];
        [cell addSubview:view];
        
    }else if (indexPath.row == 1){
        cell.textLabel.text = [NSString stringWithFormat:@"地址：%@",_model.address];
    }else if (indexPath.row == 2){
         cell.textLabel.text = [NSString stringWithFormat:@"电话：%@",_model.telephone];
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 300;
    }else{
        return 40;
    }

}

@end
