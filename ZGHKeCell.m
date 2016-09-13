//
//  ZGHKeCell.m
//  雨露健康助手
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHKeCell.h"
#import "UIImageView+WebCache.h"
#import "ZGHKeModel.h"

@implementation ZGHKeCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(ZGHKeModel *)model{
    _model = model;
    [_docimage setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@"docHeaderImage"]];
    //圆角
    _docimage.layer.cornerRadius = 30;
    _docimage.clipsToBounds = YES;
    //    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 60, 65)];
    //    img.image = [UIImage imageNamed:@"head_circle"];
    //    [_image addSubview:img];
    //
    _img.layer.cornerRadius = 20;
    _img.clipsToBounds = YES;
    _img.layer.borderWidth = 0.3;
    _img.layer.borderColor = [UIColor blackColor].CGColor;
    _name.text = model.name;
    _title.text = model.title;
    _expert.text = model.expert;
    _hospital.text = model.hospital;
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
