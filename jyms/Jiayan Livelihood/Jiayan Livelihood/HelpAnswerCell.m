//
//  HelpCell.m
//  Jiayan Livelihood
//
//  Created by bqm on 16/1/8.
//  Copyright © 2016年 bqm. All rights reserved.
//

#import "HelpAnswerCell.h"

@implementation HelpAnswerCell

-(void)refreshHelpCellWithModel:(HelpModel *)model
{
    self.questionLabel.text=model.questions;
    //头像暂无
    self.userNameLabel.text=model.username;
    //时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];//设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];
    //    [dm setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate * newdate = [formatter dateFromString:model.addtime];
    long dd = (long)[datenow timeIntervalSince1970] - [newdate timeIntervalSince1970];
    NSString *timeString=@"";
    if (dd/3600<1)
    {
        timeString = [NSString stringWithFormat:@"%ld", dd/60];
        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
    }
    if (dd/3600>1&&dd/86400<1)
    {
        timeString = [NSString stringWithFormat:@"%ld", dd/3600];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    }
    if (dd/86400>1)
    {
        timeString = [NSString stringWithFormat:@"%ld", dd/86400];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    }
    self.releasetimeLabel.text=timeString;
    self.answercountLabel.text=[NSString stringWithFormat:@"%@",model.question_status];
    
}


- (void)awakeFromNib {
    // Initialization code
   
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
