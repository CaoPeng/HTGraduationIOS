//
//  ViewController.m
//  QuestionNaire
//
//  Created by lch on 15/11/29.
//  Copyright © 2015年 HT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize commonColor;
@synthesize administratorColor;
@synthesize userName;
@synthesize password;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //将textField协议的委托对象指向自身
    userName.delegate=self;
    password.delegate=self;
    
    [self initBtn];
    [self initForgetView];
    
    
    //接收注册界面发出的广播
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(registerCompletion:) name:@"registerCompletionNotifiction" object:nil];

}

//按钮的初始化操作
-(void)initBtn{

    flag1=-1;
    flag2=-1;
    
    //设置管理员按钮的状态
    [administratorColor setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [administratorColor setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
    //设置普通用户按钮的状态
    [commonColor setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [commonColor setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
}

-(void)initForgetView{
    CGRect rect=[UIScreen mainScreen].bounds;
    UIView *view1=[[UIView alloc]initWithFrame:rect];
    view1.tag=2;
    view1.hidden=YES;
    //设置view的背景颜色和不透明度
    view1.backgroundColor=[UIColor colorWithRed:0.2f green:0.2f  blue:0.2f  alpha:0.7f ];
    [self.view addSubview:view1];
    
    CGRect rect2=CGRectMake(55, 200, 200, 170);
    UIView *view2=[[UIView alloc]initWithFrame:rect2];
    view2.tag=3;
    view2.hidden=YES;
    view2. backgroundColor=[UIColor colorWithWhite:1.0 alpha:1.0];
    [view1 addSubview:view2];
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(30,20, 160, 30)];
    label1.text=@"请回答密码问题：";
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(50, 50, 160, 30)];
    label2.text=@"您的小学是...";
    label2.font=[UIFont systemFontOfSize:15.0f];
    
    UITextField *txtAnswer=[[UITextField alloc]initWithFrame:CGRectMake(20,80, 160, 30)];
    txtAnswer.delegate=self;
    txtAnswer.placeholder=@"input your answer...";
    txtAnswer.borderStyle=UITextBorderStyleRoundedRect;
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(80.0f, 120.0f, 30.0f, 30.0f);
    [button setTitle:@"OK" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.0f green:0.4f blue:0.8f alpha:1.0] forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:14.0f];
    button.backgroundColor=[UIColor clearColor];
    //给button添加委托方式，即点击触发事件
    [button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [view2 addSubview:label1];
    [view2 addSubview:label2];
    [view2 addSubview:txtAnswer];
    [view2 addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//textField控件放弃第一个响应者的身份
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

//设置普通用户按钮的响应
- (IBAction)Common:(id)sender {
    flag1=flag1*(-1);
    if(flag1==1){
        flag2=-1;
        commonColor.selected=YES;
        administratorColor.selected=NO;
        administratorColor.highlighted=NO;
        commonColor.highlighted=YES;
    }else{
        flag2=-1;
        commonColor.selected=NO;
        administratorColor.selected=NO;
    }
}

//设置管理员按钮的响应
- (IBAction)Administrator:(id)sender {
    flag2=flag2*(-1);
    if(flag2==1){
        flag1=-1;
        commonColor.selected=NO;
        administratorColor.selected=YES;
        administratorColor.highlighted=YES;
        commonColor.highlighted=NO;
    }else{
        flag1=-1;
        commonColor.selected=NO;
        administratorColor.selected=NO;
    }
}

- (IBAction)ForgetPassWord:(id)sender {
    
    UIView *view1=(UIView *)[self.view viewWithTag:2];
    UIView *view2=(UIView *)[view1 viewWithTag:3];
    
    view1.hidden=NO;
    view2.hidden=NO;
    
}

-(void)touchButton:(id)sender{
    UIView *view1=(UIView *)[self.view viewWithTag:2];
    UIView *view2=(UIView *)[view1 viewWithTag:3];
    
    view1.hidden=YES;
    view2.hidden=YES;
    
}


//跳转至登录界面
- (IBAction)LogOn:(id)sender {
    
    //获得故事版
    UIStoryboard *mainStoryBoard2=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //普通用户登录跳转
    //模态视图
    //获取基本信息界面ID
    UIViewController *basicInformationViewController=[mainStoryBoard2 instantiateViewControllerWithIdentifier:@"BasicInformation"];
    //设置界面跳转方式
    basicInformationViewController.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    
    if(flag1==1){
        //启动模式视图
        [self presentViewController:basicInformationViewController animated:YES completion:^{}];
        flag1=-1;
        flag2=-1;
        commonColor.selected=NO;
        administratorColor.selected=NO;
    }
    
    
    //管理员登录跳转
    //获取将要跳转的标签导航视图
    UITabBarController *tabViewController=[mainStoryBoard2 instantiateViewControllerWithIdentifier:@"TabView"];
    tabViewController.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    if(flag2==1){
        //启动模态视图
        [self presentViewController:tabViewController animated:YES completion:^{}];
        flag1=-1;
        flag2=-1;
        commonColor.selected=NO;
        administratorColor.selected=NO;
    
    }
}

//跳转至注册新用户界面
- (IBAction)Register:(id)sender {
    
    //获得故事版
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //获取注册界面ID
    UIViewController *registerViewController=[mainStoryBoard instantiateViewControllerWithIdentifier:@"registerViewController"];
    //设置界面跳转方式
    registerViewController.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    //启动模式视图
    [self presentViewController:registerViewController animated:YES completion:^{}];
    
}

//接收到注册界面发出的广播后，将要响应的操作
-(void)registerCompletion:(NSNotification *)notification{
    
    //定义一个字典，保存广播发出的数据
    NSDictionary *theData=[notification userInfo];
    //根据字典的key查找响应的value：
    userName.text=[theData objectForKey:@"userName"];
    password.text=[theData objectForKey:@"passWord"];
    
}



@end
