//
//  Admin.m
//  QuestionNaire
//
//  Created by lch on 15/12/17.
//  Copyright © 2015年 HT. All rights reserved.
//

#import "Admin.h"

@interface Admin ()

@end

@implementation Admin

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.AdminSearchbar.delegate=self;
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    self.AdminName.delegate=self;
    self.AdminName.hidden=YES;
    
    self.AdminPassword.delegate=self;
    self.AdminPassword.hidden=YES;
    
    //读取数据源文件plist
    NSBundle *bundle2=[NSBundle mainBundle];
    NSString *plist2=[bundle2 pathForResource:@"AdminIn" ofType:@"plist"];
    //涉及到单元格的删除和添加，listTeams应设置成可变的Array
    self.AdminList=[[NSMutableArray alloc]initWithContentsOfFile:plist2];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if(tableView==self.tableView){
        return [self.AdminList count]+1;
    }else{
        return [self.AdminFilterList count];
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier=@"AdminCell";
    
    AdminCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    BOOL  addCell=(indexPath.row==self.AdminList.count);
    
    //这个if语句没有，将导致错误
    if(cell==nil){
        
        cell=[[AdminCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AdminCell"];
    }
    
    if(tableView==self.tableView){
        if(!addCell){
            NSUInteger row=[indexPath row];
            NSDictionary *rowDict=[self.AdminList objectAtIndex:row];
            cell.AdminName.text=[rowDict objectForKey:@"Name"];
            cell.AdminPassword.text=[rowDict objectForKey:@"Password"];
            
        }else{
            
            self.AdminName.frame=CGRectMake(30.0f, 10.0f, 90.0f, 30.0f);
            self.AdminName.placeholder=@"Name...";
            self.AdminPassword.frame=CGRectMake(150.0f, 10.0f, 90.0f, 30.0f);
            self.AdminPassword.placeholder=@"Password...";
            
            
            [cell.contentView addSubview:self.AdminName];
            [cell.contentView addSubview:self.AdminPassword];
        }
    }else{
    
        //删除cell中已经存在的控件，避免cell的内容的重叠
        while ([cell.contentView.subviews lastObject]!=nil){
            [(UIView *)[cell.contentView.subviews lastObject]removeFromSuperview];
        }
        
        NSUInteger row=[indexPath row];
        NSDictionary *rowDict=[self.AdminFilterList
                               objectAtIndex:row];
        UILabel *labelName=[[UILabel alloc]initWithFrame:CGRectMake(30, 10, 90, 30)];
        UILabel *labelPassword=[[UILabel alloc]initWithFrame:CGRectMake(150, 10, 90, 30)];
        
        labelName.text=[rowDict objectForKey:@"Name"];
        labelPassword.text=[rowDict objectForKey:@"Password"];

        [cell.contentView addSubview:labelName];
        [cell.contentView addSubview:labelPassword];
    }
    
    return cell;
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
    
    if(editing){
        
        self.AdminName.hidden=NO;
        self.AdminPassword.hidden=NO;
        
    }else{
        
        self.AdminName.hidden=YES;
        self.AdminPassword.hidden=YES;
    }
}

//当进行插入或者删除操作时，对单元格的图标进行设置
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==[self.AdminList count]){
        return UITableViewCellEditingStyleInsert;
    }
    
    return UITableViewCellEditingStyleDelete;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    if(editingStyle==UITableViewCellEditingStyleDelete){
        [self.AdminList removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
        
    }else if(editingStyle==UITableViewCellEditingStyleInsert){
        
        NSDictionary *addDict=[NSDictionary dictionaryWithObjectsAndKeys:self.AdminName.text,@"Name",self.AdminPassword.text,@"Password", nil];
        
        
        [self.AdminList insertObject:addDict atIndex:[self.AdminList count]];
        
        [self.tableView insertRowsAtIndexPaths:[NSArray  arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
        
    }
    
}

//使得单元格在被选择时处于高亮状态；
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    if(indexPath.row==[self.AdminList count]){
        return NO;
    }
    return YES;
    
}

//搜索
-(void)filterContentForSearText:(NSString *)searchText scope:(NSUInteger)scope{
    
    if([searchText length]==0){
        
        self.AdminFilterList=[NSMutableArray arrayWithArray:self.AdminList];
        return;
        
    }
    
    NSPredicate *scopePredicate;
    NSArray *tempArray;
    
    switch (scope) {
        case 0:
            scopePredicate=[NSPredicate predicateWithFormat:@"SELF.Name contains[c] %@",searchText];
            tempArray=[self.AdminList filteredArrayUsingPredicate:scopePredicate];
            self.AdminFilterList=[NSMutableArray arrayWithArray:tempArray];
            break;
        case 1:
            scopePredicate=[NSPredicate predicateWithFormat:@"SELF.Password contains[c] %@",searchText];
            tempArray=[self.AdminList filteredArrayUsingPredicate:scopePredicate];
            self.AdminFilterList=[NSMutableArray arrayWithArray:tempArray];
            break;
        default:
            self.AdminFilterList=[NSMutableArray arrayWithArray:self.AdminList];
            break;
    }
}

#pragma mark - UISearchDisplayController Delegate Methods
//当文本内容发生改变时候，向表视图数据源发出重新加载消息
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterContentForSearText:searchString scope:self.AdminSearchbar.selectedScopeButtonIndex];
    //YES情况下表视图可以重新加载
    return  YES;
}


@end
