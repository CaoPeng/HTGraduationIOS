//
//  RegisterViewController.h
//  QuestionNaire
//
//  Created by lch on 15/12/8.
//  Copyright © 2015年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassWord;

@property (weak, nonatomic) IBOutlet UITextField *txtAffirm;


- (IBAction)Done:(id)sender;



@end
