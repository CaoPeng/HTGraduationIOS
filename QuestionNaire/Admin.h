//
//  Admin.h
//  QuestionNaire
//
//  Created by lch on 15/12/17.
//  Copyright © 2015年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"AdminCell.h"

@interface Admin : UITableViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>

@property(strong,nonatomic) NSMutableArray *AdminList;
@property(strong,nonatomic) NSMutableArray *AdminFilterList;

@property (weak, nonatomic) IBOutlet UISearchBar *AdminSearchbar;

@property (strong, nonatomic) IBOutlet UITextField *AdminName;
@property (strong, nonatomic) IBOutlet UITextField *AdminPassword;

@property (weak, nonatomic) IBOutlet UINavigationItem *AdminNavigation;

-(void)filterContentForSearText:(NSString *)seachText scope:(NSUInteger)scope;

@end
