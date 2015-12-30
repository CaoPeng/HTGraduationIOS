//
//  CommonCell.m
//  QuestionNaire
//
//  Created by lch on 15/12/18.
//  Copyright © 2015年 HT. All rights reserved.
//

#import "CommonCell.h"

@implementation CommonCell

@synthesize Name;
@synthesize Password;
@synthesize YesOrNo;
@synthesize TestName;

- (void)awakeFromNib {
    
    //Name.text=@"1";
    // Initialization code
    TestName=@"1";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
