//
//  TableViewCell.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "TableViewCell.h"
#import "ZGHDrug1Model.h"
#import "Alldefined.h"
#import "UIImageView+WebCache.h"
#import "ZGHDrugModel.h"
#import "ZGHMapXQViewController.h"

@implementation TableViewCell



- (void)awakeFromNib {
    
}
//-(void)setModel:(ZGHDrug1Model *)model{
//    _model = model;
//    _store_name.text = model.store_name;
//    _address.text = model.address;
//    _distance.text = model.distance;
//   // [_img setImageWithURL:[NSURL URLWithString:model.i] placeholderImage:[UIImage imageNamed:@"docHeaderImage"]];
//    //圆角
//    _img.layer.borderWidth = 0.3;
//    _img.layer.borderColor = [UIColor blackColor].CGColor;
//    _img.layer.cornerRadius = 20;
//    _img.clipsToBounds = YES;
//
//    
//
//}

-(void)setModel1:(ZGHDrugModel *)model1{
    _model1 = model1;
    _store_name.text = model1.name;
    _address.text = model1.address;
    _distance.text = [NSString stringWithFormat:@"%@米",model1.distance];
    // [_img setImageWithURL:[NSURL URLWithString:model.i] placeholderImage:[UIImage imageNamed:@"docHeaderImage"]];
    //圆角
    _img.layer.borderWidth = 0.3;
    _img.layer.borderColor = [UIColor blackColor].CGColor;
    _img.layer.cornerRadius = 20;
    _img.clipsToBounds = YES;



}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onButtonUp:(id)sender {
  
    if ([self.delegate respondsToSelector:@selector(didButtonWithChangeViewController:model:)]) {
        [self.delegate didButtonWithChangeViewController:self model:self.model1];
    }

}

- (IBAction)onButtonService:(id)sender {
    //打电话
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",_model1.telephone]];
    NSLog(@"^%@",url);
    [[UIApplication sharedApplication]openURL:url];
    
       
}
@end
