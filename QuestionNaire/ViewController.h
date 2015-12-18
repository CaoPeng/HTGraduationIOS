//
//  ViewController.h
//  QuestionNaire
//
//  Created by lch on 15/11/29.
//  Copyright © 2015年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    int flag1;
    int flag2;


}

@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *commonColor;
@property (weak, nonatomic) IBOutlet UIButton *administratorColor;




- (IBAction)Common:(id)sender;

- (IBAction)Administrator:(id)sender;

- (IBAction)ForgetPassWord:(id)sender;

- (IBAction)LogOn:(id)sender;

- (IBAction)Register:(id)sender;

@end

