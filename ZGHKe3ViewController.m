//
//  ZGHKe3ViewController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHKe3ViewController.h"
#import "ZGHKe3Model.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "Alldefined.h"
#import "ZGHKe2Cell.h"
#import "ViewController.h"

@interface ZGHKe3ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArry1;

@end

@implementation ZGHKe3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArry1 = [NSMutableArray array];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    //  self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    [self.view addSubview:_tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZGHKe2Cell" bundle:nil] forCellReuseIdentifier:@"cellID"];
 [self createData2];
    
}

-(void)createData2{
    NSString *path =[NSString stringWithFormat:@"%@",_strUrl3];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self analyseJson2:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
    
    
}
-(void)analyseJson2:(NSData *)data{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dict = dic[@"data"];
    for (NSDictionary *arr in dict) {
        ZGHKe3Model *model = [ZGHKe3Model modelWithDic:arr];
        
        [_dataArry1 addObject:model];
        NSLog(@"--%@",model);
      }
    
    [self.tableView reloadData];
    [SVProgressHUD showSuccessWithStatus:@"加载成功" maskType:SVProgressHUDMaskTypeBlack];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArry1.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    ZGHKe2Cell *cell =[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    ZGHKe3Model *model = _dataArry1[indexPath.row];
    [cell setModel1:model];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ViewController *weixq = [[ViewController alloc]init];
    ZGHKe3Model *model = _dataArry1[indexPath.row];
    //隐藏tabbar
    weixq.hidesBottomBarWhenPushed = YES;
    weixq.ge_Id = model.uid;
    weixq.title = @"家庭医生详情";
    NSLog(@"--:%@",weixq.ge_Id);
    [self.navigationController pushViewController:weixq animated:YES];
}



@end
