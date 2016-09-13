//
//  ZGHConsDataController.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/4.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHConsDataController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "Alldefined.h"
#import "ZGHConsModel.h"
#import "ZGHConsViewCell.h"
#import "MJRefresh.h"
#import "ZGHConsXQViewController.h"
#import "SVProgressHUD.h"
#import "ZGHCollectController.h"
#import "MJExtension.h"

@interface ZGHConsDataController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,assign) int page;//页数
@property (nonatomic,copy) NSString *category_id;//分类id
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArry;
@end

@implementation ZGHConsDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _page =1;
     _dataArry = [[NSMutableArray alloc]init];
    [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeBlack];
    [self createUI];
    [self createData];
    
    [SVProgressHUD showSuccessWithStatus:@"OK" maskType:SVProgressHUDMaskTypeBlack];
}



-(void)createData{
    
    NSString *path =[NSString stringWithFormat:_urlStr,_page];
    AFHTTPRequestOperationManager *manager= [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self analyseJson:responseObject];
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];




}

-(void)analyseJson:(NSData *)data{
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dic = dict[@"data"];
    NSArray *arr = dic[@"list"];
   self.dataArry = [ZGHConsModel mj_objectArrayWithKeyValuesArray:arr];
  //  NSLog(@"--%@",self.dataArry);
//    for (NSDictionary *array in arr) {
//        ZGHConsModel *model = [ZGHConsModel modelWithDic:array];
//        [_dataArry addObject:model];
//        UIImageView *img  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
//        [img setImageWithURL:[NSURL URLWithString:model.smallimg]];
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 180, WIDTH, 20)];
//        label.text = model.title;
//        label.textColor = [UIColor whiteColor];
//        [img addSubview:label];
//        self.tableView.tableHeaderView = img;
//        
//    }
    
    
    [self.tableView reloadData];
    
}



-(void)createUI{
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
    

    [self.tableView registerClass:[ZGHConsViewCell class] forCellReuseIdentifier:@"cellID"];
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
     ZGHConsModel *model =_dataArry[indexPath.row];
static NSString *cellID = @"cellID";
    ZGHConsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[ZGHConsViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    [cell fillCare:model];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 80;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZGHConsModel *model = _dataArry[indexPath.row];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
