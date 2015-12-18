//
//  RegisterViewController.m
//  QuestionNaire
//
//  Created by lch on 15/12/8.
//  Copyright © 2015年 HT. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize txtUserName;
@synthesize txtPassWord;
@synthesize txtAffirm;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    txtUserName.delegate=self;
    txtPassWord.delegate=self;
    txtAffirm.delegate=self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;
    
}


//关闭模态视图，回到原始登录界面
- (IBAction)Done:(id)sender {
    
    if([txtAffirm.text isEqual:@""]||[txtPassWord isEqual:@""]||[txtUserName.text isEqual:@""]){
        
        
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"输入不能为空,请检查..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }else{
        if(txtAffirm.text==txtPassWord.text){
            //关闭模态视图，返回登录界面
            [self dismissViewControllerAnimated:YES completion:^{}];
            
            //将注册的textField保存在字典data中，通过广播发送给出去；
            NSDictionary *data= [NSDictionary dictionaryWithObjectsAndKeys:txtUserName.text,@"userName" ,txtPassWord.text,@"passWord",nil];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"registerCompletionNotifiction" object:nil userInfo:data];
            
        }else{
            txtPassWord.text=@"";
            txtAffirm.text=@"";
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"密码与确认密码不一致,请重新..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }

    }
}
@end
