//
//  PaperViewController.m
//  QuestionNaire
//
//  Created by lch on 15/12/9.
//  Copyright © 2015年 HT. All rights reserved.
//

#import "PaperViewController.h"

@interface PaperViewController ()

@end

@implementation PaperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)PaperExit:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}
@end
