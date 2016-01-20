//
//  UIViewController+sellDetailViewController.m
//  Jiayan Livelihood
//
//  Created by Lance on 1/20/16.
//  Copyright © 2016 bqm. All rights reserved.
//

#import "SellDetailViewController.h"
#import "RDVTabBarController/RDVTabBarController.h"

@interface SellDetailViewController()

@property (nonatomic,strong) UIScrollView *mainView;

@end



@implementation SellDetailViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self rmTabbar];     //去除tabbar
    [self loadMainView]; //加载主滚动页面
    [self loadProcutImg];//加载商品图片
    [self loadAbsInfoView];//加载产品概述信息
    
}

//去除tabbar
-(void)rmTabbar
{
    [self.parentViewController.rdv_tabBarController setTabBarHidden:true];
}


//加载主视图滚动条
-(void)loadMainView
{
    CGRect rect=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.mainView=[[UIScrollView alloc]initWithFrame:rect];
    [self.mainView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.mainView];
}

//加载商品图片
-(void)loadProcutImg
{
  CGRect rect=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.25f);
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:rect];
    [imgView setImage:[UIImage imageNamed:@"product1"]];
    [self.mainView addSubview:imgView];
}

//加载产品概述信息部分
-(void)loadAbsInfoView
{
    CGRect rect=CGRectMake(0,SCREEN_HEIGHT*0.25f, SCREEN_WIDTH, SCREEN_HEIGHT*0.6f);
    UIView *absView=[[UIView alloc]initWithFrame:rect];
    [self.mainView addSubview:absView];
    
    UILabel *title=[self loadTitle];
    UILabel *price=[self loadPrice];
    UILabel *source=[self loadSource];
    UILabel *date=[self loadDate];
    
    [absView addSubview:title];
    [absView addSubview:price];
    [absView addSubview:source];
    [absView addSubview:date];
}

//加载产品标题

-(UILabel*)  loadTitle
{
    CGRect rect=CGRectMake(SCREEN_WIDTH*0.05f,0, SCREEN_WIDTH*0.9, SCREEN_HEIGHT*0.05f);
    UILabel *labelTitle=[[UILabel alloc]initWithFrame:rect];
    NSString *str=@"山东潍坊县青萝卜，新鲜绿皮甜脆，1万斤出售";
    [labelTitle setFont:[UIFont fontWithName:@"Marion" size:16]];
    [labelTitle setNumberOfLines:0];

    
    [labelTitle setText:str];
    return labelTitle;
}

//加载产品价格
-(UILabel*) loadPrice
{
    CGRect rect=CGRectMake(SCREEN_WIDTH*0.05f, SCREEN_HEIGHT*0.05f, SCREEN_WIDTH*0.3, SCREEN_HEIGHT*0.05f);
    UILabel *labelPrice=[[UILabel alloc]initWithFrame:rect];
    CGFloat  price=3.0;
    NSString *strPrice=[NSString stringWithFormat:@"¥%.02f元／斤",price];
    [labelPrice setText:strPrice];
    [labelPrice setTextColor:[UIColor colorWithRed:8.0f/255.0f green:158.0f/255.0f blue:22.0f/255.0f alpha:1.0f]];
    return labelPrice;
}

//加载产地
-(UILabel*) loadSource
{
    CGRect rect=CGRectMake(SCREEN_WIDTH*0.05f, SCREEN_HEIGHT*0.10f, SCREEN_WIDTH*0.2, SCREEN_HEIGHT*0.02f);
    UILabel *sourceName=[[UILabel alloc]initWithFrame:rect];
    [sourceName setFont:[UIFont fontWithName:@"Marion" size:12]];
    [sourceName setTextColor:[UIColor lightGrayColor]];
    [sourceName setText:@"山东寿光"];
    return  sourceName;
}

//加载发送时间
-(UILabel*) loadDate
{
    CGRect rect=CGRectMake(SCREEN_WIDTH*0.7f, SCREEN_HEIGHT*0.10f, SCREEN_WIDTH*0.2, SCREEN_HEIGHT*0.02f);
    UILabel *labelDate=[[UILabel alloc]initWithFrame:rect];
    NSString *strDate=@"2015-10-10";
    [labelDate setText:strDate];
    [labelDate setFont:[UIFont fontWithName:@"Marion" size:12]];
    [labelDate setFont:[UIFont systemFontOfSize:13]];
    [labelDate setTextColor:[UIColor lightGrayColor]];
    return labelDate;
}




@end
