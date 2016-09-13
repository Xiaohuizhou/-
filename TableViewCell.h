//
//  TableViewCell.h
//  雨露健康助手
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGHDrugModel,TableViewCell;

@protocol TableViewCellDelegate <NSObject>

-(void)didButtonWithChangeViewController:(TableViewCell *)cell model:(ZGHDrugModel *)model;

@end

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *store_name;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *address;
- (IBAction)onButtonUp:(id)sender;
- (IBAction)onButtonService:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@property(nonatomic,strong)ZGHDrugModel *model1;

@property (nonatomic, weak)id<TableViewCellDelegate>delegate;

@end
