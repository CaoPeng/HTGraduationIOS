//
//  BasicInformationViewController.m
//  QuestionNaire
//
//  Created by lch on 15/12/8.
//  Copyright © 2015年 HT. All rights reserved.
//

#import "BasicInformationViewController.h"

@interface BasicInformationViewController ()

@end

@implementation BasicInformationViewController
@synthesize sun;
@synthesize cloudy;
@synthesize darkCloudy;
@synthesize rain;
@synthesize snow;
@synthesize health;
@synthesize ill;
@synthesize tired;
@synthesize femal;
@synthesize male;

@synthesize age;
@synthesize address;
@synthesize tall;
@synthesize weight;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initButton];
    
    [self initTxtField];
    
}

-(void)initTxtField{

    age.delegate=self;
    address.delegate=self;
    tall.delegate=self;
    weight.delegate=self;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;
}

//这大段代码都是在对界面中的按钮做设置
-(void)initButton{
    flagSun=-1;
    flagCloudy=-1;
    flagdarkCloudy=-1;
    flagrain=-1;
    flagsnow=-1;
    flagfemal=-1;
    flagmale=-1;
    flaghealth=-1;
    flagill=-1;
    flagtired=-1;
    
    [sun setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [sun setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
    
    [cloudy setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [cloudy setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
    
    [darkCloudy setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [darkCloudy setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
    
    [rain setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [rain setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
    
    [snow setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [snow setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
    
    [femal setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [femal setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
    
    [male setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [male setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
    
    [health setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [health setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
    
    [ill setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [ill setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
    
    [tired setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [tired setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Ill:(id)sender {
    flagill=flagill*(-1);
    if(flagill==1){
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagtired=-1;
        
        ill.selected=YES;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
    
    }else{
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagtired=-1;
    
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
    }
}

- (IBAction)Tired:(id)sender {
    flagtired=flagtired*(-1);
    if(flagtired==1){
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=YES;
        
    }else{
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
    }
}

- (IBAction)Health:(id)sender {
    
    flaghealth=flaghealth*(-1);
    if(flaghealth==1){
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=YES;
        tired.selected=NO;
        
    }else{
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
    }
}

- (IBAction)Male:(id)sender {
    flagmale=flagmale*(-1);
    if(flagmale==1){
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=YES;
        health.selected=NO;
        tired.selected=NO;
        
    }else{
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
    }
}

- (IBAction)Femal:(id)sender {
    flagfemal=flagfemal*(-1);
    if(flagfemal==1){
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=YES;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
        
    }else{
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
    }
}

- (IBAction)snow:(id)sender {
    flagsnow=flagsnow*(-1);
    if(flagsnow==1){
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=YES;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
        
    }else{
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
    }
}

- (IBAction)Rain:(id)sender {
    flagrain=flagrain*(-1);
    if(flagrain==1){
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=YES;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
        
    }else{
        
        flagSun=-1;
        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
    }
}

- (IBAction)DarkCloudy:(id)sender {
    flagdarkCloudy=flagdarkCloudy*(-1);
    if(flagdarkCloudy==1){
        
        flagSun=-1;
        flagCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=YES;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
        
    }else{
        
        flagSun=-1;
        flagCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
    }
}

- (IBAction)Cloudy:(id)sender {
    
    flagSun=-1;
    flagdarkCloudy=-1;
    flagrain=-1;
    flagsnow=-1;
    flagfemal=-1;
    flagmale=-1;
    flaghealth=-1;
    flagill=-1;
    flagtired=-1;
    
    flagCloudy=flagCloudy*(-1);
    if(flagCloudy==1){
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=YES;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
        
    }else{
        
        flagSun=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
    }
}

- (IBAction)Sun:(id)sender {
    
    flagSun=flagSun*(-1);
    if(flagSun==1){

        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=YES;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
        
    }else{

        flagCloudy=-1;
        flagdarkCloudy=-1;
        flagrain=-1;
        flagsnow=-1;
        flagfemal=-1;
        flagmale=-1;
        flaghealth=-1;
        flagill=-1;
        flagtired=-1;
        
        ill.selected=NO;
        sun.selected=NO;
        cloudy.selected=NO;
        darkCloudy.selected=NO;
        rain.selected=NO;
        snow.selected=NO;
        femal.selected=NO;
        male.selected=NO;
        health.selected=NO;
        tired.selected=NO;
    }
}

- (IBAction)Exit:(id)sender {
    
    //关闭模态视图
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}
@end
