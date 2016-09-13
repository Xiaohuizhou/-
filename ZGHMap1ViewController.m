//
//  ZGHMap1ViewController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHMap1ViewController.h"
#import "ZGHdrugst1ViewController.h"
#import "Alldefined.h"
#import "AFNetworking.h"
#import "ZGHDrug1Model.h"
#import "TableView2Cell.h"
#import "ZGHYiyuanViewController.h"
#import "SVProgressHUD.h"

@interface ZGHMap1ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArry;

@end

@implementation ZGHMap1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:screenRect style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    //去线
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //去掉多余的线
    // self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableView2Cell" bundle:nil] forCellReuseIdentifier: @"cell"];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"mapchoice"] style:UIBarButtonItemStylePlain target:self action:@selector(ItemClick)];
    self.navigationItem.rightBarButtonItem = item;

    [self createData];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"<返回" style:UIBarButtonItemStylePlain target:self action:@selector(itemClick1)];
    self.navigationItem.leftBarButtonItem = item1;
    
}
-(void)itemClick1{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)ItemClick{
    ZGHdrugst1ViewController *drugst = [[ZGHdrugst1ViewController alloc]init];
    //隐藏Tabbar
    self.hidesBottomBarWhenPushed = YES;
    drugst.title = @"附近药店";
    [self.navigationController pushViewController:drugst animated:YES];
    
    
}

-(void)createData{
    [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeBlack];
    
    NSString *path =[NSString stringWithFormat:YAODIAN_URL];
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
    NSDictionary *dic = dict[@"list"];
    for (NSDictionary *dict in dic) {
        ZGHDrug1Model *model = [ZGHDrug1Model modelWithDic:dict];
        [_dataArry addObject:model];
    }
    
    
    [self.tableView reloadData];
    [SVProgressHUD showSuccessWithStatus:@"加载成功" maskType:SVProgressHUDMaskTypeBlack];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArry.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    TableView2Cell *cell =[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    ZGHDrug1Model *model = _dataArry[indexPath.row];
    [cell setModel1:model];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZGHYiyuanViewController *map = [[ZGHYiyuanViewController alloc]init];
    ZGHDrug1Model *model = _dataArry[indexPath.row];
    map.model =model;
    map.title = @"药店详情";
    map.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:map animated:YES];
}





@end
