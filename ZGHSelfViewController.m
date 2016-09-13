//
//  ZGHSelfViewController.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/9/27.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHSelfViewController.h"
#import "ZGHMapViewController.h"
#import "ZGHMap1ViewController.h"
#import "ZKButton.h"
#import "ZGHNewViewController.h"

@interface ZGHSelfViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArry;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)UIView * view1;
@property(nonatomic,strong)UIView * view2;
@property(nonatomic,strong)UIButton * button;
@property (nonatomic)BOOL isBool;

@end

@implementation ZGHSelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [NSArray array];
    _array = @[@"中医针灸",@"美容护肤",@"健康饮食",@"四季养生",@"老人养生",@"美容护肤",@"推拿按摩",@"运动减肥",@"健康饮食",@"养生堂视频"];

    [self createUI];
}
-(void)createUI{
    _tableView = [[UITableView alloc]initWithFrame:screenRect style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    //去掉多余的线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    
//    UIView *upView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 70)];
//    upView.backgroundColor = [UIColor whiteColor];
//    UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 10, WIDTH-20, 40)];
//    search.placeholder = @"搜索疾病、症状、药品、问题等";
//    search.showsBookmarkButton =YES;
// //   search.showsCancelButton = YES;
//    search.showsSearchResultsButton =YES;
//    search.delegate =self;
//    UILabel *downlabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 60, WIDTH, 10)];
//    downlabel.backgroundColor = [UIColor lightGrayColor];
//    [upView addSubview:downlabel];
//    [upView addSubview:search];
//    
//    //右下角变搜索
//    search.returnKeyType = UIReturnKeySearch;
    //搜索字会变暗
//    search.enablesReturnKeyAutomatically =YES;
//    
//    self.tableView.tableHeaderView = upView;
    
    ZKButton *configButton = [ZKButton buttonWithFrame:CGRectMake(0, 6, 40, 32) title:@"点我" andBlock:^{
        _view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT/2)];
        _view2.backgroundColor = [UIColor whiteColor];
        [self.view  addSubview:_view2];
        
        _view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 64+HEIGHT/2, WIDTH, 300)];
        _view1.backgroundColor = [UIColor blackColor];
        [self.navigationController.view  addSubview:_view1];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, WIDTH/3, 30)];
        label.text = @"点击添加栏目";
        [_view2 addSubview:label];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(WIDTH/2-45, HEIGHT/2-50, 90, 30);
        _button.backgroundColor = [UIColor darkGrayColor];
        [_button setTitle:@"完成添加" forState:UIControlStateNormal];
        [_button setTintColor:[UIColor whiteColor]];
        [_button addTarget:self action:@selector(btn1:) forControlEvents:UIControlEventTouchUpInside];
        [_view2 addSubview:_button];
        
        
        
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 40, WIDTH, 180) collectionViewLayout:flowLayout];
        self.collectionView.dataSource=self;
        self.collectionView.delegate=self;
        [self.collectionView setBackgroundColor:[UIColor clearColor]];
        
        //注册Cell，必须要有
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        
        [_view2 addSubview:self.collectionView];

    
    }];
    configButton.tag = 100;
    if ((configButton.tag != 100)) {
        _view1.hidden = false;
    }
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:configButton];
    self.navigationItem.rightBarButtonItem = rightItem;

  

}
//#pragma mark-searchBarDelegate
////点击标签按钮触发方法
//-(void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar{
//}
////点击移除按钮触发方法
//-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
//    
//}
////点击搜索按钮触发方法
//-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
////    ZKSearchViewController *search = [[ZKSearchViewController alloc]init];
////    search.searchString = searchBar.text;
////    [self.navigationController pushViewController:search animated:YES];
//    
//}
////当文字改变的时候触发的方法
//-(BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
//    return  YES;
//}

-(void)btn1:(UIButton *)btn{
    
    if (btn.selected == YES) {
        btn.backgroundColor = [UIColor redColor];
        [_view2 removeFromSuperview];
        [_view1 removeFromSuperview];
        
        
    }
    btn.selected = !btn.selected;



}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
//    if (indexPath.row == 0) {
//        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
//        img.image = [UIImage imageNamed:@"dis_check4"];
//        [cell addSubview:img];
//        UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(345, 30, 10, 20)];
//        img1.image = [UIImage imageNamed:@"cellrightItem"];
//        [cell addSubview:img1];
//        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 200, 20)];
//        lable.text = @"附近药店";
//        [cell addSubview:lable];
//        UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(80, 40, 200, 20)];
//        lable1.text = @"查看身边的药店";
//        lable1.font = UIFont(14);
//        lable1.textColor = [UIColor grayColor];
//        [cell addSubview:lable1];
//    }else
   if (indexPath.row == 1){
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
        img.image = [UIImage imageNamed:@"dis_check5"];
        [cell addSubview:img];
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(345, 30, 10, 20)];
        img1.image = [UIImage imageNamed:@"cellrightItem"];
        [cell addSubview:img1];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 200, 20)];
        lable.text = @"附近医院";
        [cell addSubview:lable];
        UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(80, 40, 200, 20)];
        lable1.text = @"查找附近的医院";
        lable1.font = UIFont(14);
        lable1.textColor = [UIColor grayColor];
        [cell addSubview:lable1];
        

     
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 0) {
//        ZGHMap1ViewController *map = [[ZGHMap1ViewController alloc]init];
//        map.title = @"附近药店";
//        
//        [self.navigationController pushViewController:map animated:YES];
//    }else
    if (indexPath.row == 1){
        ZGHMapViewController *map = [[ZGHMapViewController alloc]init];
        map.title = @"附近医院";
        [self.navigationController pushViewController:map animated:YES];
    }

}


#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _array.count;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UICollectionViewCell alloc]init];
    }
    cell.backgroundColor = [UIColor whiteColor];
    //[UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];

        UILabel * zlabel = [[UILabel alloc]init];
        zlabel.text = _array[indexPath.row];
        zlabel.font = [UIFont systemFontOfSize:15];
        zlabel.frame = CGRectMake(2, 2, 80, 25);
    zlabel.textAlignment = UITextAlignmentCenter;
        zlabel.textColor =[UIColor blackColor];
        [cell.contentView addSubview:zlabel];
 
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//    label.textColor = [UIColor redColor];
//    
//    
//    label.text = [NSString stringWithFormat:@"%d",indexPath.row];
//    
//    for (id subView in cell.contentView.subviews) {
//        [subView removeFromSuperview];
//    }
//    [cell.contentView addSubview:label];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 30);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
    
    if (!_isBool) {
        cell.backgroundColor = [UIColor greenColor];
        _button.backgroundColor = [UIColor redColor];
    }else{
        cell.backgroundColor = [UIColor clearColor];
        _button.backgroundColor = [UIColor grayColor];
    }
    
    NSLog(@"item======%d",indexPath.item);
    NSLog(@"row=======%d",indexPath.row);
    NSLog(@"section===%d",indexPath.section);
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}








-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
