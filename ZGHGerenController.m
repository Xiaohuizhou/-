//
//  ZGHGerenController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHGerenController.h"
#import "Alldefined.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "AFNetworking.h"
#import "ZGHWeighModel.h"
#import "UIImageView+WebCache.h"
#import "SVProgressHUD.h"

@interface ZGHGerenController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)ZGHWeighModel *model;
@property(nonatomic,strong)UILabel *label2;
@end

@implementation ZGHGerenController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    [self createData];
    
    UIBarButtonItem *item =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"homeBack"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)itemClick{
  
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)createData{
    [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeBlack];

NSString *path =[NSString stringWithFormat:@"%@?act=app&fun=doctor&source=xywy_app&id=%@&tag=app&sign=9b7da964e54e330952501c8b44c86f74",ZHUANJIA_URL,_ge_Id];
    NSLog(@"--%@",path);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self analyseJson:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];


}
-(void)analyseJson:(NSData *)data{
    _dataArr = [NSMutableArray array];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dict = dic[@"data"];
   
    _model = [ZGHWeighModel modelWithDic:dict];
    [_dataArr addObject:_model];
    [self.tableView reloadData];
    
    [SVProgressHUD showSuccessWithStatus:@"OK" maskType:SVProgressHUDMaskTypeBlack];
}




-(void)createUI{
    _tableView = [[UITableView alloc]initWithFrame:screenRect style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
//self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //去掉多余的线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (indexPath.row == 0) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(20, 15, 50, 60)];
        [img setImageWithURL:[NSURL URLWithString:_model.photo] placeholderImage:[UIImage imageNamed:@"UMS_account_normal_white"]];
        img.layer.cornerRadius = 30;
        img.clipsToBounds = YES;
        [cell addSubview:img];
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 15, 60, 20)];
        label1.text = _model.name;
        [cell addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(160, 15, 70, 20)];
        label2.font = UIFont(14);
        label2.text = _model.title;
        [cell addSubview:label2];
        
        UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(230, 15, 60, 20)];
        label3.text = _model.teach;
        label3.font = UIFont(14);
        [cell addSubview:label3];
        
        UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(100, 45, 100, 20)];
        label4.text = _model.depart;
        label4.font = UIFont(14);
        [cell addSubview:label4];
        
        
        UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(100, 75, 120, 20)];
        label5.text = _model.hospital;
        label5.font = UIFont(14);
        [cell addSubview:label5];
    }else if (indexPath.row == 1){
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        img.image = [UIImage imageNamed:@"jianjie"];
        [cell addSubview:img];
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 100, 20)];
        label1.text = @"简介";
        label1.font = UIFont(15);
        [cell addSubview:label1];
        
        //自定义行高
        _label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, WIDTH-20, 140)];
        _label2.font = UIFont(14);
        _label2.text = _model.info;
        _label2.numberOfLines = 0;//表示label可以多行显示
        
        _label2.lineBreakMode = NSLineBreakByWordWrapping;//换行模式，与上面的计算保持一致。
        [cell addSubview:_label2];
    
    }else if (indexPath.row == 2){
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        img.image = [UIImage imageNamed:@"shanchang@2x"];
        [cell addSubview:img];
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 100, 20)];
        label1.text = @"擅长";
        label1.font = UIFont(15);
        [cell addSubview:label1];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, WIDTH-20, 20)];
        label.text = _model.plus_require;
        label.font = UIFont(14);
        [cell addSubview:label];
    
    
    
    }else if (indexPath.row == 3){
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        img.image = [UIImage imageNamed:@"mydoctor_health"];
        [cell addSubview:img];
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 100, 20)];
        label1.text = @"预约要求";
        label1.font = UIFont(15);
        [cell addSubview:label1];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, WIDTH-20, 20)];
        label.text = _model.plus_require;
        label.font = UIFont(14);
        [cell addSubview:label];

    
    }else{
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        img.image = [UIImage imageNamed:@"noURLFlag"];
        [cell addSubview:img];
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 100, 20)];
        label1.text = @"其他信息";
        label1.font = UIFont(15);
        [cell addSubview:label1];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, WIDTH-20, 20)];
        label.text = _model.address;
        label.font = UIFont(14);
        [cell addSubview:label];

    
    
    }
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        return 110;
    }else if (indexPath.row == 1){
//       return  [self.tableView fd_heightForCellWithIdentifier:@"cellID" configuration:^(id cell) {
//           
//        }];
    return 180;
    
    }else{
        return 60;
    
    }



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
