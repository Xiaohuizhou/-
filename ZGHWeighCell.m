//
//  ZGHWeighCell.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/2.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHWeighCell.h"
#import "ZGHWeighModel.h"
#import "UIImageView+WebCache.h"

@implementation ZGHWeighCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(ZGHWeighModel *)model{
    _model = model;
    [_image setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@"docHeaderImage"]];
    //圆角
    _image.layer.cornerRadius = 30;
    _image.clipsToBounds = YES;
//    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 60, 65)];
//    img.image = [UIImage imageNamed:@"head_circle"];
//    [_image addSubview:img];
//
    _name.text = model.name;
    _title.text = model.title;
    _depart.text = model.depart;
    _hospital.text = model.hospital;
    _goodat.text = model.goodat;


}


@end
