//
//  ZGHMapViewController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHMapViewController.h"
#import "Alldefined.h"
#import "ZGHdrugstViewController.h"
#import "ZGHDrugModel.h"
#import "AFNetworking.h"
#import "TableViewCell.h"
#import "ZGHMapXQViewController.h"
#import "ZGHCellViewController.h"
#import "SVProgressHUD.h"

@interface ZGHMapViewController ()<UITableViewDataSource,UITableViewDelegate,TableViewCellDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArry;

@end

@implementation ZGHMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc]initWithFrame:screenRect style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //去掉多余的线
    // self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier: @"cellID"];
    
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
    ZGHdrugstViewController *drugst = [[ZGHdrugstViewController alloc]init];
    //隐藏Tabbar
    self.hidesBottomBarWhenPushed = YES;
     drugst.title = @"附近医院";
    [self.navigationController pushViewController:drugst animated:YES];


}
-(void)createData{
    [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeBlack];
    
    NSString *path =[NSString stringWithFormat:YIYUAN_URL];
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
    NSDictionary *dic = dict[@"data"][@"list"];
    for (NSDictionary *dict in dic) {
        ZGHDrugModel *model = [ZGHDrugModel modelWithDic:dict];
        [_dataArry addObject:model];
    }
    
    
    [self.tableView reloadData];
    [SVProgressHUD showSuccessWithStatus:@"加载成功" maskType:SVProgressHUDMaskTypeBlack];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArry.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    TableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.delegate = self;
    if (!cell) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    ZGHDrugModel *model = _dataArry[indexPath.row];
    [cell setModel1:model];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZGHCellViewController *cell = [[ZGHCellViewController alloc]init];
    ZGHDrugModel *model = _dataArry[indexPath.row];
    cell.nid = model.id;
    cell.title= model.name;
    cell.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cell animated:YES];

}

- (void)didButtonWithChangeViewController:(TableViewCell *)cell model:(ZGHDrugModel *)model
{
    ZGHMapXQViewController *vc = [[ZGHMapXQViewController alloc]init];
    vc.model = model;
    vc.hidesBottomBarWhenPushed = YES;//yincang
    [self.navigationController pushViewController:vc animated:YES];
    
}




@end
