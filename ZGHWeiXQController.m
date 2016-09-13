//
//  ZGHWeiXQController.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/2.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHWeiXQController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "Alldefined.h"
#import "ZGHWeighModel.h"
#import "ZGHGerenController.h"
#import "ZGHTimeModel.h"
#import "ZGHYuViewController.h"
#import "SVProgressHUD.h"

@interface ZGHWeiXQController ()
@property(nonatomic,strong)NSMutableArray *dataArry;
@property(nonatomic,strong)ZGHWeighModel *model;
@property(nonatomic,strong)NSMutableArray *yuArry;
@property(nonatomic,strong)NSString *path;

@end

@implementation ZGHWeiXQController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"专家详情";
     _yuArry = [NSMutableArray array];
      _dataArry = [NSMutableArray array];
    
    [self createData];
  //  [self addUrl];
}


-(void)createData{
   
    _path =[NSString stringWithFormat:@"%@?act=app&fun=doctor&source=xywy_app&id=%@&tag=app&sign=9b7da964e54e330952501c8b44c86f74",ZHUANJIA_URL,_wid];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:_path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self analyseJson:responseObject];
        [self analyseJson2:responseObject];
        

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];


}

-(void)analyseJson2:(NSData *)data{
   
   
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dict = dic[@"data"][@"schedule"];
  
    //判断如果是nil值得话，就这样OK
    if (![dict isEqual:@""]) {
        
        NSDictionary *arr = dict[@"rdtime"][0];
        
        ZGHTimeModel *yuModel =[[ZGHTimeModel alloc]init];
        yuModel.title2 = arr[@"title"];
        yuModel.address2 = arr[@"address"];
        yuModel.money2 = arr[@"money"];
        yuModel.date = arr[@"date"];
        [_yuArry addObject:yuModel];
        
        _label1.text = [NSString stringWithFormat:@"日期: %@ \n地址:%@ \n诊费:%@",yuModel.title2,yuModel.address2,yuModel.money2];
        //如果他没值返回空
        NSDictionary *arr1 = dict[@"rdtime"][1];
        
        if (![arr1 isEqual:@""]) {
            ZGHTimeModel *yuModel1 =[[ZGHTimeModel alloc]init];
            yuModel1.title2 = arr1[@"title"];
            yuModel1.address2 = arr1[@"address"];
            yuModel1.money2 = arr1[@"money"];
            yuModel1.date = arr1[@"date"];
            
            
            _label2.text =[NSString stringWithFormat:@"日期: %@ \n地址: %@ \n诊费: %@",yuModel1.title2,yuModel1.address2,yuModel1.money2];
        }else{
            return;
        }
       
    }else{
    
        return;
    }
 
}

-(void)analyseJson:(NSData *)data{
   [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeBlack];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dict = dic[@"data"];
    _model = [ZGHWeighModel modelWithDic:dict];
        
    [_img setImageWithURL:[NSURL URLWithString:_model.photo] placeholderImage:[UIImage imageNamed:@"docHeaderImage"]];
    _img.layer.cornerRadius = 30;
    _img.clipsToBounds = YES;
        _name.text = _model.name;
        _title1.text = _model.title;
        _teach.text = _model.teach;
        _depart.text = _model.depart;
        _hospital.text = _model.hospital;
        _goodat.text = _model.goodat;
    
    [SVProgressHUD showSuccessWithStatus:@"OK" maskType:SVProgressHUDMaskTypeBlack];
}



- (IBAction)geRenbtn:(id)sender {
    ZGHGerenController *geren = [[ZGHGerenController alloc]init];
    geren.ge_Id =_wid;
    [self.navigationController pushViewController:geren animated:YES];
    
}

//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"您还没有登录，暂时无法查看日期" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [alert show];

    
- (IBAction)yuYue:(id)sender {
    ZGHYuViewController *yuyue = [[ZGHYuViewController alloc]init];
    [self.navigationController pushViewController:yuyue animated:YES];
}
@end
