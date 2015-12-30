//
//  Common.h
//  QuestionNaire
//
//  Created by lch on 15/12/17.
//  Copyright © 2015年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonCell.h"

@interface Common : UITableViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>

@property (nonatomic,strong) NSMutableArray *listTeams;
@property (nonatomic,strong) NSMutableArray *listFilterTeams;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;

@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtYesOrNo;

-(void)filterContentForSearText:(NSString *)seachText scope:(NSUInteger)scope;

@end
