//
//  ZGHHeadViewController.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/9/27.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#define MKImageCount 4
#import "ZGHHeadViewController.h"
#import "ZGHHeadScrModel.h"
#import "ZGHScrXQControler.h"
#import "ZGHImage.h"
#import "ZGHWeighViewController.h"
#import "ZGHKeViewController.h"
#import "ZGHKe2ViewController.h"
#import "ZGHRecommendController.h"
#import "ZGHKe3ViewController.h"
#import "SVProgressHUD.h"
#import "ZGHCollectController.h"
#import "ZKButton.h"
#import "ZGHTwoViewController.h"

@interface ZGHHeadViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataScrArry;
@property(nonatomic,strong)NSMutableArray *imgArry;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)int page;
@end

@implementation ZGHHeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _page = 1;
       //加载滚视图详情
    [self addScroll];
    //添加滚视图
  //  [self createScroll];
    //2.设置
    ZKButton *configButton = [ZKButton buttonWithFrame:CGRectMake(0, 6, 40, 32) title:@"收藏" andBlock:^{
        ZGHCollectController *config = [[ZGHCollectController alloc]init];
        [self.navigationController pushViewController:config animated:YES];
    }];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:configButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    ZKButton *Button = [ZKButton buttonWithFrame:CGRectMake(0, 0, 50, 32) title:@"扫扫" andBlock:^{
        ZGHTwoViewController *con = [[ZGHTwoViewController alloc]init];
        con.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:con animated:YES];
    }];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:Button];
    self.navigationItem.leftBarButtonItem = leftItem;


    
}


-(void)addScroll{
   // [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeBlack];

    
    NSString *path = Scrch_URL;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self analyseJson:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"--%@",error);
    }];
    
    [self createScroll];
 [self createTimer];

}

-(void)analyseJson:(NSData *)data{

    _dataScrArry = [[NSMutableArray alloc]init];
    _imgArry = [NSMutableArray array];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dic = dict[@"data"];
    NSArray *arr = dic[@"list"];
    for (NSDictionary *array in arr) {
        ZGHHeadScrModel *model =[ZGHHeadScrModel modelWithDic:array];
//        model.imgurl = array[@"imgurl"];
//        model.siteurl = array[@"siteurl"];
        
        [_dataScrArry addObject:model];
        NSLog(@"-%@",_dataScrArry);
   }
    [self.tableView reloadData];

}
-(void)createScroll{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate =self;
    [self.view addSubview:_tableView];
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 120)];
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.delegate = self;
    self.tableView.tableHeaderView = _scrollView;
  //  if (_dataScrArry != nil) {
        for (int i = 0; i<MKImageCount; i++) {
            UIImageView *scrImg = [[UIImageView alloc]initWithFrame:CGRectMake(i*WIDTH, 0, WIDTH, 120)];
            ZGHHeadScrModel *model = _dataScrArry[i];
            [scrImg setImageWithURL:[NSURL URLWithString:model.imgurl]placeholderImage:[UIImage imageNamed:@"LoadingImage"]];
            NSLog(@"img:%@",model.imgurl);
            
            [_scrollView addSubview:scrImg];
            
            self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(_scrollView.frame.origin.x, 100, _scrollView.frame.size.width, 20)];
            //  self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
            //  _pageControl.alpha = 0.6;
            self.pageControl.currentPage =0;
            self.pageControl.numberOfPages = MKImageCount;
            self.pageControl.userInteractionEnabled =NO;
            [_tableView addSubview:_pageControl];
            //添加手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollClick:)];
            
            [scrImg addGestureRecognizer:tap];
            scrImg.tag = 100+i;
            scrImg.userInteractionEnabled =YES;
        }
        _scrollView.contentSize = CGSizeMake(WIDTH*MKImageCount, 120);
        // _scrollView.contentOffset = CGPointZero;
        // _scrollView.userInteractionEnabled =YES;
        _scrollView.showsHorizontalScrollIndicator =NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;

  //  }
   
    //  [self.view addSubview:_scrollView];
    
    
    
  //  [SVProgressHUD showSuccessWithStatus:@"加载成功" maskType:SVProgressHUDMaskTypeBlack];
}




//跳转页面
-(void)scrollClick:(UITapGestureRecognizer *)tap{
    ZGHImage * img = (ZGHImage *)tap.view;
    NSInteger i = img.tag-100;
    ZGHScrXQControler *scr = [[ZGHScrXQControler alloc]init];
    //隐藏tabBar
    scr.hidesBottomBarWhenPushed =YES;
    ZGHHeadScrModel *head = [[ZGHHeadScrModel alloc]init];
    head = _dataScrArry[i];
    scr.scrModel =head;
    [self.navigationController pushViewController:scr animated:YES];
}


//定时器
-(void)createTimer{
    
   _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(pageControlClick:) userInfo:nil repeats:YES];
    
}
-(void)pageControlClick:(UIPageControl *)pageControl
{
    if (_pageControl.currentPage == 3) {
        
        _pageControl.currentPage = 0;
        
    }else{
        _pageControl.currentPage++;
        
    }

    _scrollView.contentOffset = CGPointMake(_pageControl.currentPage*WIDTH, 0);
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        UIView *upView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 240)];
        [cell addSubview:upView];
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn1.backgroundColor =[UIColor whiteColor];
        btn1.frame = CGRectMake(0, 0, WIDTH, 110);
        [upView addSubview:btn1];
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-20, 10, 40, 50)];
        image.image =[UIImage imageNamed:@"header-icon2@2x"];
        [btn1 addSubview:image];
        [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2+20, 10, 30, 20)];
        image1.backgroundColor = [UIColor redColor];
        //设置圆角
        image1.clipsToBounds = YES;
        image1.layer.cornerRadius = 10;
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(2, 0, 40, 20)];
        label1.text = @"免费";
        label1.font =UIFont(13);
        label1.textColor = [UIColor whiteColor];
        [image1 addSubview:label1];
        [btn1 addSubview:image1];
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2-35, 60, 80, 25)];
        label2.text = @"预约挂号";
        label2.textColor = [UIColor blackColor];
        [btn1 addSubview:label2];
        
        UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2-70, 85, 150, 20)];
        label3.text = @"全国三甲医院专家免费约";
        label3.font = UIFont(13);
        [btn1 addSubview:label3];
        
        NSArray *imgArr =@[@"main-icon1@2x",@"main-icon2@2x"];
        NSArray *labArr = @[@"电话医生",@"家庭医生"];
        
        for (int i = 0; i<2; i++) {
            UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
            //加边框
            btn2.layer.borderColor =[UIColor grayColor].CGColor;
            btn2.layer.borderWidth = 0.5;//宽度
            UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/6, 10, WIDTH/6, 40)];
            image2.image = [UIImage imageNamed:imgArr[i]];
            [btn2 addSubview:image2];
            
            UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/6-14, 50, 80, 30)];
            label4.text = labArr[i];
            
            [btn2 addSubview:label4];
            
            btn2.frame = CGRectMake(i*WIDTH/2, 110, WIDTH/2, 90);
            btn2.tag = 100+i;
            [btn2 addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
            [upView addSubview:btn2];
        }
        
        
    }else{
        UIView *downView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 180)];
        downView.backgroundColor = [UIColor whiteColor];
        [cell addSubview:downView];
        //label
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 20)];
        label1.text = @"推荐专家";
        [downView addSubview:label1];
        NSArray *imgarr = @[@"recome_5",@"recome_3",@"recome_1",@"recome_2"];
        NSArray *labarr = @[@"儿科",@"妇产科",@"内科",@"外科"];
        int k=0;
        for (int i=0; i<2; i++) {
            for (int j=0; j<2; j++) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                
                UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(30, 20, 30, 30)];
                img.image = [UIImage imageNamed:imgarr[k]];
                [btn addSubview:img];
                UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(60, 20, 97, 30)];
                lab.text = labarr[k];
                lab.textAlignment = NSTextAlignmentCenter;
                [btn addSubview:lab];
                btn.tag=200+k;
                k++;
                btn.frame = CGRectMake(i*WIDTH/2, 70*j+40, WIDTH/2, 70);
                //btn.backgroundColor = [UIColor redColor];
                btn.layer.borderColor=[UIColor grayColor].CGColor;
                btn.layer.borderWidth=0.5;
                [btn addTarget:self action:@selector(btn3Click:) forControlEvents:UIControlEventTouchUpInside];
                [downView addSubview:btn];
            }
        }
        
        
    }
    
    
    
    return cell;
}
//更多
-(void)btn4Click{
    ZGHRecommendController *recommend = [[ZGHRecommendController alloc]init];
    [self.navigationController pushViewController:recommend animated:YES];

}
//推荐专家
-(void)btn3Click:(UIButton *)btn3{
    if (btn3.tag == 200) {
        
        ZGHKeViewController *ke = [[ZGHKeViewController alloc]init];
        ke.strUrl = ERKE_URL;
        ke.title = @"儿科专家";
        [self.navigationController pushViewController:ke animated:YES];
        
    }else if (btn3.tag == 201){
       // NSLog(@"200");
        ZGHKeViewController *ke = [[ZGHKeViewController alloc]init];
        ke.strUrl = FUCHAN_URL;
        ke.title = @"妇产科专家";
        [self.navigationController pushViewController:ke animated:YES];
        
    }else if(btn3.tag == 202){
      
        ZGHKeViewController *ke = [[ZGHKeViewController alloc]init];
        ke.strUrl = NEIKE_URL;
        ke.title = @"内科专家";
        [self.navigationController pushViewController:ke animated:YES];
        
    }else{
        ZGHKeViewController *ke = [[ZGHKeViewController alloc]init];
        ke.strUrl = WAIKE_URL;
        ke.title = @"外科专家";
        [self.navigationController pushViewController:ke animated:YES];
        
    }

}

//电话、家庭、专家医生
-(void)btn2Click:(UIButton *)btn2{
    if (btn2.tag == 100) {
        NSLog(@"100");
        ZGHKe2ViewController *wei = [[ZGHKe2ViewController alloc]init];
        wei.title = @"电话医生";
        wei.strUrl2 = IPOHE_URL;
        [self.navigationController pushViewController:wei animated:YES];
    }else if (btn2.tag ==101){
        NSLog(@"101");
        ZGHKe3ViewController *wei = [[ZGHKe3ViewController alloc]init];
        wei.title = @"家庭医生";
        wei.strUrl3 =JIATING_URL;
        [self.navigationController pushViewController:wei animated:YES];
    }
}
//预约挂号
-(void)btn1Click{

    ZGHWeighViewController *weigh = [[ZGHWeighViewController alloc]init];
    [self.navigationController pushViewController:weigh animated:YES];

}

//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return 220;
    }else
        return 180;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
