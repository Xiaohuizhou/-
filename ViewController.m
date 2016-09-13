//
//  ViewController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ViewController.h"
#import "Alldefined.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "AFNetworking.h"
#import "ZGHKe3XQModel.h"
#import "UIImageView+WebCache.h"
#import "SVProgressHUD.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)ZGHKe3XQModel *model;
@property(nonatomic,strong)UILabel *label2;

@end

@implementation ViewController

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
    //http://api.wws.xywy.com/index.php?act=zhuanjia&did=40344527&fun=FamilyDoctorDetalis&tag=zj&sign=2e0d0887581be1c35794ee4c13b00cae
    NSString *path =[NSString stringWithFormat:@"%@&did=%@&fun=FamilyDoctorDetalis&tag=zj&sign=2e0d0887581be1c35794ee4c13b00cae",JIATINGXQ_URL,_ge_Id];
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
    NSDictionary *dict = dic[@"data"][@"userinfo"];
    
    _model = [ZGHKe3XQModel modelWithDic:dict];
    [_dataArr addObject:_model];
    [self.tableView reloadData];
    
    [SVProgressHUD showSuccessWithStatus:@"OK" maskType:SVProgressHUDMaskTypeBlack];
}




-(void)createUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //去掉多余的线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
    
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
        label1.text = _model.username;
        [cell addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(160, 15, 150, 20)];
        label2.font = UIFont(14);
        label2.text = _model.job;
        [cell addSubview:label2];
        
        UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(100, 45, 150, 20)];
        label4.text = _model.subject;
        label4.font = UIFont(14);
        [cell addSubview:label4];
        
        
        UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(100, 75, 120, 20)];
        label5.text = _model.hospital;
        label5.font = UIFont(14);
        [cell addSubview:label5];
    }else if (indexPath.row == 1){
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        img.image = [UIImage imageNamed:@"textfiledLeftView"];
        [cell addSubview:img];
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 100, 20)];
        label1.text = @"医生寄语";
        label1.font = UIFont(15);
        [cell addSubview:label1];
        
        //自定义行高
        _label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, WIDTH-20, 140)];
        _label2.font = UIFont(14);
        _label2.text = _model.words;
        _label2.numberOfLines = 0;//表示label可以多行显示
        
        _label2.lineBreakMode = NSLineBreakByWordWrapping;//换行模式，与上面的计算保持一致。
        [cell addSubview:_label2];
        
    }else if (indexPath.row == 2){
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        img.image = [UIImage imageNamed:@"jianjie"];
        [cell addSubview:img];
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 100, 20)];
        label1.text = @"简介";
        label1.font = UIFont(15);
        [cell addSubview:label1];
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, WIDTH-20, 100)];
        label2.text = _model.shortinfo;
        label2.font = UIFont(15);
        [cell addSubview:label2];

        
        
    }else if (indexPath.row == 3){
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        img.image = [UIImage imageNamed:@"shanchang@2x"];
        [cell addSubview:img];
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 100, 20)];
        label1.text = @"擅长";
        label1.font = UIFont(15);
        [cell addSubview:label1];
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, WIDTH-20, 100)];
        label2.text = _model.special;
        label2.font = UIFont(15);
        [cell addSubview:label2];
        

        
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
        return 100;
        
    }
    
    
    
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
