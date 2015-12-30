//
//  CommonCell.h
//  QuestionNaire
//
//  Created by lch on 15/12/18.
//  Copyright © 2015年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *Name;

@property (weak, nonatomic) IBOutlet UILabel *Password;

@property (weak, nonatomic) IBOutlet UILabel *YesOrNo;

@property(weak,nonatomic) NSString *TestName;

@end
