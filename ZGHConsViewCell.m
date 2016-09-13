//
//  ZGHConsViewCell.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/5.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHConsViewCell.h"
#import "UIImageView+WebCache.h"
#import "Alldefined.h"
@interface ZGHConsViewCell ()
@property(strong,nonatomic)UILabel *title;//标题
@property(strong,nonatomic)UILabel *briefinfo;
@property(strong,nonatomic)UILabel *time;
@property(strong,nonatomic)UIImageView *smallimg;

@end
@implementation ZGHConsViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.smallimg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 50)];
        [self.contentView addSubview:_smallimg];
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, WIDTH-90, 20)];
        [self.contentView addSubview:_title];
        self.briefinfo = [[UILabel alloc]initWithFrame:CGRectMake(80, 40, WIDTH-90, 20)];
        self.briefinfo.font = UIFont(12);
        [self.contentView addSubview:_briefinfo];
        self.time = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-80, 60, 80, 10)];
        self.time.font =UIFont(12);
        [self.contentView addSubview:_time];
    }
    return self;
    
}

-(void)fillCare:(ZGHConsModel *)model{
    _model = model;
    [_smallimg setImageWithURL:[NSURL URLWithString:model.imgurl] placeholderImage:[UIImage imageNamed:@"select_photo_default_pic"]];
    _title.text = model.title;
    _briefinfo.text = model.briefinfo;
    _time.text = model.time;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
