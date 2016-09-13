//
//  ZGHKeViewController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHKeViewController.h"
#import "Alldefined.h"
#import "AFNetworking.h"
#import "ZGHKeModel.h"
#import "ZGHKeCell.h"
#import "ZGHWeiXQController.h"
#import "MJRefresh.h"
#import "SVProgressHUD.h"

@interface ZGHKeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArry;
@property(nonatomic,assign)int page;

@end

@implementation ZGHKeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTable];
    _page = 1;

     _dataArry = [NSMutableArray array];
    [self createData];

}


-(void)createData{
   
    [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeBlack];
    NSString *path =[NSString stringWithFormat:_strUrl,_page];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self analyseJson:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}

-(void)analyseJson:(NSData *)data{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dict = dic[@"data"][@"list"];
    for (NSDictionary *arr in dict) {
        ZGHKeModel *model = [ZGHKeModel modelWithDic:arr];
        [_dataArry addObject:model];
        
    }
    
    [self.tableView reloadData];
    [SVProgressHUD showSuccessWithStatus:@"OK" maskType:SVProgressHUDMaskTypeBlack];
}




-(void)addTable{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    [self.view addSubview:_tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZGHKeCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    //下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self createData];//刷新结束结束
        [self.tableView.header endRefreshing];
    }];
    
    //上拉加载
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self createData];
        [self.tableView.footer endRefreshing];
    }];

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArry.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    ZGHKeCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    ZGHKeModel *model = _dataArry[indexPath.row];
    [cell setModel:model];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZGHWeiXQController *weixq = [[ZGHWeiXQController alloc]init];
    ZGHKeModel *model = _dataArry[indexPath.row];
    //隐藏tabbar
    weixq.hidesBottomBarWhenPushed = YES;
    weixq.wid = model.id;
    //  NSLog(@"--:%@",weixq.wid);
    [self.navigationController pushViewController:weixq animated:YES];
    


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
