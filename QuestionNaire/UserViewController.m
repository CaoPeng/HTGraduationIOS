//
//  UserViewController.m
//  QuestionNaire
//
//  Created by lch on 15/12/9.
//  Copyright © 2015年 HT. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initChangePassword];
}

-(void)initChangePassword{

    CGRect rect=[UIScreen mainScreen].bounds;
    UIView *view1=[[UIView alloc]initWithFrame:rect];
    view1.tag=12;
    view1.hidden=YES;
    //设置view的背景颜色和不透明度
    view1.backgroundColor=[UIColor colorWithRed:0.2f green:0.2f  blue:0.2f  alpha:0.7f ];
    [self.view addSubview:view1];
    
    CGRect rect2=CGRectMake(30, 200, 265, 200);
    UIView *view2=[[UIView alloc]initWithFrame:rect2];
    view2.tag=13;
    view2.hidden=YES;
    view2. backgroundColor=[UIColor colorWithWhite:1.0 alpha:1.0];
    [view1 addSubview:view2];
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(95,10, 100, 30)];
    label1.font=[UIFont systemFontOfSize:15.0f];
    label1.text=@"修改密码：";
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(10, 50,65, 30)];
    label2.text=@"原密码：";
    label2.font=[UIFont systemFontOfSize:13.0f];
    
    UITextField *txtOriginal=[[UITextField alloc]initWithFrame:CGRectMake(80,50, 170, 30)];
    txtOriginal.delegate=self;
    txtOriginal.placeholder=@"Original password...";
    txtOriginal.borderStyle=UITextBorderStyleRoundedRect;
    
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(10, 100,65, 30)];
    label3.text=@"新密码：";
    label3.font=[UIFont systemFontOfSize:13.0f];
    
    UITextField *txtNew=[[UITextField alloc]initWithFrame:CGRectMake(80,100, 170, 30)];
    txtNew.delegate=self;
    txtNew.placeholder=@"New password...";
    txtNew.borderStyle=UITextBorderStyleRoundedRect;
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(110.0f, 150.0f, 30.0f, 30.0f);
    [button setTitle:@"OK" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.0f green:0.4f blue:0.8f alpha:1.0] forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:14.0f];
    button.backgroundColor=[UIColor clearColor];
    //给button添加委托方式，即点击触发事件
    [button addTarget:self action:@selector(touchButton) forControlEvents:UIControlEventTouchUpInside];
    
    [view2 addSubview:label1];
    [view2 addSubview:label2];
    [view2 addSubview:label3];
    [view2 addSubview:txtOriginal];
    [view2 addSubview:txtNew];
    [view2 addSubview:button];

}

-(void)touchButton{
    
    UIView *view1=(UIView *)[self.view viewWithTag:12];
    UIView *view2=(UIView *)[view1 viewWithTag:13];
    
    view1.hidden=YES;
    view2.hidden=YES;
    
}

//textField控件放弃第一个响应者的身份
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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

- (IBAction)UserExit:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

- (IBAction)change:(id)sender {
    
    UIView *view1=(UIView *)[self.view viewWithTag:12];
    UIView *view2=(UIView *)[view1 viewWithTag:13];
    
    view1.hidden=NO;
    view2.hidden=NO;
    
}
@end
