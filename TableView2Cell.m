//
//  TableView2Cell.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/23.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "TableView2Cell.h"
#import "ZGHDrug1Model.h"
@implementation TableView2Cell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel1:(ZGHDrug1Model *)model{
    _model1 = model;
    _label.text = model.store_name;
    _label2.text = model.distance;
    _label3.text = model.address;
    //圆角
    _img.layer.borderWidth = 0.3;
    _img.layer.borderColor = [UIColor blackColor].CGColor;
    _img.layer.cornerRadius = 20;
    _img.clipsToBounds = YES;

}

- (IBAction)btn:(id)sender {
    NSURL *url1 = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",_model1.service]];
    NSLog(@"^%@",_model1.service);
    [[UIApplication sharedApplication]openURL:url1];

}
@end
