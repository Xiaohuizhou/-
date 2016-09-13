//
//  ZGHKe2Cell.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//name;
//@property (weak, nonatomic) IBOutlet UILabel *title;
//@property (weak, nonatomic) IBOutlet UILabel *price;
//@property (weak, nonatomic) IBOutlet UILabel *goodat;
//@property (weak, nonatomic) IBOutlet UILabel *hospital;
//@property (weak, nonatomic) IBOutlet UILabel *depart;
//@property (weak, nonatomic) IBOutlet UILabel *help;

#import "ZGHKe2Cell.h"
#import "ZGHKe2Model.h"
#import "UIImageView+WebCache.h"
#import "ZGHKe3Model.h"

@implementation ZGHKe2Cell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(ZGHKe2Model *)model{
    _model = model;
    [_img setImageWithURL:[NSURL URLWithString:model.expert_pic] placeholderImage:[UIImage imageNamed:@"docHeaderImage"]];
    _img.layer.cornerRadius = 20;
    _img.clipsToBounds = YES;
    _name.text= model.name;
    _title.text = model.title;
    _goodat.text =model.goodat;
    _hospital.text = model.hospital;
    _depart.text = model.depart;
    _help.text = [NSString stringWithFormat:@"已帮助患者%@次",model.help];


}
-(void)setModel1:(ZGHKe3Model *)model1{
    _model1 = model1;
    [_img setImageWithURL:[NSURL URLWithString:model1.photo] placeholderImage:[UIImage imageNamed:@"docHeaderImage"]];
    _img.layer.cornerRadius = 20;
    _img.clipsToBounds = YES;
    _name.text = model1.nickname;
    _title.text = model1.job;
    _goodat.text = model1.speciality;
    _hospital.text = model1.hospital;
    _depart.text = model1.isonline;
    _help.text = [NSString stringWithFormat:@"%@分",model1.starscore];
    
    


}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
