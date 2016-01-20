//
//  PersonalCenterViewController.m
//  Jiayan Livelihood
//
//  Created by bqm on 16/1/5.
//  Copyright © 2016年 bqm. All rights reserved.
/*
 关于分割线不存在是因为模拟器和电脑分辨率不同的关系，调试将模拟器的scale设为100%
 */

#import "PersonalCenterViewController.h"

@interface PersonalCenterViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *_imageArr;
    NSArray *_titleArr;
    UITableView *_tableView;
    NSMutableArray *_dataArr;
}

@end

@implementation PersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    // Do any additional setup after loading the view from its nib.
    _imageArr=@[[UIImage imageNamed:@"密码修改.png"],[UIImage imageNamed:@"密码修改.png"],[UIImage imageNamed:@"我的收藏.png"],[UIImage imageNamed:@"我的买卖.png"],[UIImage imageNamed:@"我的帮助.png"],[UIImage imageNamed:@"分享.png"],[UIImage imageNamed:@"客服.png"],[UIImage imageNamed:@"关于我们.png"]];
    _titleArr=@[@"用户昵称",@"密码修改",@"我的收藏",@"我的买卖",@"我的帮助",@"我要分享",@"客服电话:400-111-1111",@"关于我们"];
    [self creatUI];
   
}
-(void)creatUI{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor=GrayColor;
    _tableView.bounces=NO;
    _tableView.separatorInset=UIEdgeInsetsMake(1, 0, 1, 0);
    [self.view addSubview:_tableView];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else if (section==1) {
        return 3;
    }else
        return 3;
   
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[_tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.textLabel.font=[UIFont systemFontOfSize:14.0f];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
           cell.imageView.transform=CGAffineTransformMakeScale(2, 2);
           cell.textLabel.font=[UIFont systemFontOfSize:16.0f];
        }
        cell.imageView.image=_imageArr[indexPath.row];
        cell.textLabel.text=_titleArr[indexPath.row];
        
        return cell;
        
    }else if (indexPath.section==1){
        cell.imageView.image=_imageArr[indexPath.row+2];
        cell.textLabel.text=_titleArr[indexPath.row+2];
        return cell;
    }else if (indexPath.section==2){
        cell.imageView.image=_imageArr[indexPath.row+5];
        cell.textLabel.text=_titleArr[indexPath.row+5];
        return cell;
    }
    return nil;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==2) {
        return 50;
    }else
       return 5;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0000001;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0 && indexPath.row==0) {
        return 2*(SCREEN_HEIGHT-TABBAR_HEIGHT)/13;
    }
    return (SCREEN_HEIGHT-TABBAR_HEIGHT)/13;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==2) {
        UIView *view=[[UIView alloc]init];
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(20, 10, SCREEN_WIDTH-40, 40)];
        btn.layer.masksToBounds=YES;
        btn.layer.cornerRadius=10;
        btn.backgroundColor=UIColorWithRGBA(35, 165, 58, 1);
        [btn setTitle:@"退出登录" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(exitBtn:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        return view;
    }
    return nil;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BQMLog(@"点击cell");

}
#pragma mark --点击退出登录
-(void)exitBtn:(UIButton *)btn{
[btn setTitle:@"点击登录" forState:UIControlStateNormal];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
