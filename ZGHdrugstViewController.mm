//
//  ZGHdrugstViewController.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHdrugstViewController.h"
#import "BMapKit.h"
@interface ZGHdrugstViewController ()<BMKMapViewDelegate,BMKPoiSearchDelegate>
@property (weak, nonatomic) BMKMapView *mapView;

@property (nonatomic, strong) BMKPoiSearch *searcher;

@end

@implementation ZGHdrugstViewController

- (void)loadView
{
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = mapView;
    
    
    self.mapView = mapView;
    [mapView setShowsUserLocation:YES];//显示定位的蓝点
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    
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
    option.pageCapacity = 10;
    option.location = CLLocationCoordinate2D{40.037816, 116.379436};
    option.keyword = @"医院";
    
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




@end
