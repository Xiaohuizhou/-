//
//  TableView2Cell.h
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/23.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGHDrug1Model;
@interface TableView2Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *label2;
- (IBAction)btn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@property(nonatomic,strong)ZGHDrug1Model *model1;

@end
