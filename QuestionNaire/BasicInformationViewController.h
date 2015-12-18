//
//  BasicInformationViewController.h
//  QuestionNaire
//
//  Created by lch on 15/12/8.
//  Copyright © 2015年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicInformationViewController : UIViewController<UITextFieldDelegate>
{

    int flagSun;
    int flagCloudy;
    int flagdarkCloudy;
    int flagrain;
    int flagsnow;
    int flagfemal;
    int flagmale;
    int flaghealth;
    int flagill;
    int flagtired;

}
@property (weak, nonatomic) IBOutlet UIButton *sun;
@property (weak, nonatomic) IBOutlet UIButton *cloudy;
@property (weak, nonatomic) IBOutlet UIButton *darkCloudy;
@property (weak, nonatomic) IBOutlet UIButton *rain;
@property (weak, nonatomic) IBOutlet UIButton *snow;
@property (weak, nonatomic) IBOutlet UIButton *femal;
@property (weak, nonatomic) IBOutlet UIButton *male;
@property (weak, nonatomic) IBOutlet UIButton *health;
@property (weak, nonatomic) IBOutlet UIButton *ill;
@property (weak, nonatomic) IBOutlet UIButton *tired;

@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *tall;
@property (weak, nonatomic) IBOutlet UITextField *weight;

- (IBAction)Ill:(id)sender;

- (IBAction)Tired:(id)sender;

- (IBAction)Health:(id)sender;

- (IBAction)Male:(id)sender;

- (IBAction)Femal:(id)sender;

- (IBAction)snow:(id)sender;

- (IBAction)Rain:(id)sender;
- (IBAction)DarkCloudy:(id)sender;

- (IBAction)Cloudy:(id)sender;

- (IBAction)Sun:(id)sender;

- (IBAction)Exit:(id)sender;


@end
