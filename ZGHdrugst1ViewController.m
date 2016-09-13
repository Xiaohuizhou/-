//
//  ZGHdrugst1ViewController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHdrugst1ViewController.h"
#import "BMapKit.h"
#import "Alldefined.h"
#import "ZGHDrug1Model.h"
@interface ZGHdrugst1ViewController ()<BMKMapViewDelegate,BMKPoiSearchDelegate>
@property (weak, nonatomic) BMKMapView *mapView;

@property (nonatomic, strong) BMKPoiSearch *searcher;


@end

@implementation ZGHdrugst1ViewController


- (void)loadView
{
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = mapView;
    self.mapView = mapView;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = nil; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化检索对象
    _searcher =[[BMKPoiSearch alloc]init];
    _searcher.delegate = self;
    // 周边搜索
    BMKNearbySearchOption *option = [[BMKNearbySearchOption alloc]init];
    // 分页显示默认第一页
    option.pageIndex = 0;
    // 搜索中心位置
    option.pageCapacity = 100;
    option.location = CLLocationCoordinate2DMake(40.037816, 116.379436);
   // option.location = CLLocationCoordinate2D{39.915, 116.404};
    option.keyword = @"药店";
    
    // 设置显示区域
    BMKCoordinateSpan span = BMKCoordinateSpanMake(0.03, 0.03);
    BMKCoordinateRegion region = BMKCoordinateRegionMake(option.location, span);
    [self.mapView setRegion:region animated:YES];
    
    // 开始搜索
    BOOL flag = [_searcher poiSearchNearBy:option];
    
    if(flag)
    {
        NSLog(@"周边检索发送成功");
    }
    else
    {
        NSLog(@"周边检索发送失败");
    }
    
    [self createView];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"<返回" style:UIBarButtonItemStylePlain target:self action:@selector(itemClick)];
    self.navigationItem.leftBarButtonItem = item;
    
}
-(void)itemClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(void)createView{

    UIView *downView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-100, WIDTH, 100)];
    downView.backgroundColor =[UIColor blackColor];
    downView.alpha = 0.3;
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH-20, 30)];
    label1.text = _model.store_name;
    [downView addSubview:label1];
    [self.view addSubview:downView];



}


- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult*)result errorCode:(BMKSearchErrorCode)error
{
    // 清楚屏幕中所有的annotation
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    
    if (error == BMK_SEARCH_NO_ERROR) {
        for (int i = 0; i < result.poiInfoList.count; i++) {
            // 取出BMKPoiInfo信息
            BMKPoiInfo* poi = [result.poiInfoList objectAtIndex:i];
            // 创建大头针
            BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
            // 给大头针设置位置
            item.coordinate = poi.pt;
            // 设置标题
            item.title = poi.name;
            // 添加大头针
            [_mapView addAnnotation:item];
            if(i == 0)
            {
                //将第一个点的坐标移到屏幕中央
                _mapView.centerCoordinate = poi.pt;
            }
        }
    } else if (error == BMK_SEARCH_AMBIGUOUS_ROURE_ADDR){
        NSLog(@"起始点有歧义");
    } else {
        // 各种情况的判断。。。
    }
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
