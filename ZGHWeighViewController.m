//
//  ZGHWeighViewController.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/2.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHWeighViewController.h"
#import "AFNetworking.h"
#import "Alldefined.h"
#import "ZGHWeighModel.h"
#import "ZGHWeighCell.h"
#import "ZGHWeiXQController.h"
#import "SVProgressHUD.h"
#import "MJRefresh.h"

@interface ZGHWeighViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArry;
@property(nonatomic,assign)int page;
@end

@implementation ZGHWeighViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addTable];
    
    self.title = @"预约挂号";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.rowHeight = 120;
    _page = 1;
      _dataArry = [NSMutableArray array];
    [self createData];
    
 
}

-(void)addTable{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZGHWeighCell" bundle:nil] forCellReuseIdentifier:@"cellID"];

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


-(void)createData{
     [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeBlack];
   
    NSString *path =[NSString stringWithFormat:@"%@&PageNum=%d",WEIGH_URL,_page];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self analyseJson:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}
-(void)analyseJson:(NSData *)data{
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dict = dic[@"data"];
    for (NSDictionary *arr in dict) {
        ZGHWeighModel *model = [ZGHWeighModel modelWithDic:arr];
        [_dataArry addObject:model];
       //  NSLog(@"%@",model);
    }
        [self.tableView reloadData];
    [SVProgressHUD showSuccessWithStatus:@"OK" maskType:SVProgressHUDMaskTypeBlack];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArry.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *cellID = @"cellID";
    ZGHWeighCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    ZGHWeighModel *model = _dataArry[indexPath.row];

    [cell setModel:model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ZGHWeiXQController *weixq = [[ZGHWeiXQController alloc]init];
    ZGHWeighModel *model = _dataArry[indexPath.row];
    //隐藏tabbar
    weixq.hidesBottomBarWhenPushed = YES;
    weixq.wid = model.doctorid;
  //  NSLog(@"--:%@",weixq.wid);
    [self.navigationController pushViewController:weixq animated:YES];


}



@end
