//
//  Common.m
//  QuestionNaire
//
//  Created by lch on 15/12/17.
//  Copyright © 2015年 HT. All rights reserved.
//

#import "Common.h"

@interface Common ()

@end

@implementation Common

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.searchBar setShowsScopeBar:NO];
    [self.searchBar sizeToFit];
    
    self.searchBar.delegate=self;
    
    self.navigationItem.rightBarButtonItem=self.editButtonItem;
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    self.txtName.hidden=YES;
    self.txtName.delegate=self;
    
    self.txtPassword.hidden=YES;
    self.txtPassword.delegate=self;
    
    self.txtYesOrNo.hidden=YES;
    self.txtYesOrNo.delegate=self;
    
    
    //读取数据源文件plist
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *plist=[bundle pathForResource:@"CommonIn" ofType:@"plist"];
    //涉及到单元格的删除和添加，listTeams应设置成可变的Array
    self.listTeams=[[NSMutableArray alloc]initWithContentsOfFile:plist];
    
    [self filterContentForSearText:@"" scope:-1];
    
}

- (void)viewDidUnload
{
    [self setSearchBar:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//textField控件放弃第一个响应者的身份
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Table view data source
//返回单元格的总数目
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView==self.tableView){
        return [self.listTeams count]+1;
    }else{
        return [self.listFilterTeams count];
    }

}

//设置每个单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    //这个if语句没有，将导致显示错误
    if(cell==nil){
        cell=[[CommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }

    BOOL  addCell=(indexPath.row==self.listTeams.count);

    if(tableView==self.tableView){
        if(!addCell){
            NSUInteger row=[indexPath row];
            NSDictionary *rowDict=[self.listTeams
                                   objectAtIndex:row];
            cell.Name.text=[rowDict objectForKey:@"Name"];
            cell.Password.text=[rowDict objectForKey:@"Password"];
            cell.YesOrNo.text=[rowDict objectForKey:@"YesOrNo"];

        }else{
            
            self.txtName.frame=CGRectMake(10.0f, 10.0f, 70.0f, 30.0f);
            self.txtName.placeholder=@"Name";
            self.txtPassword.frame=CGRectMake(95.0f, 10.0f, 80.0f, 30.0f);
            self.txtPassword.placeholder=@"Password";
            self.txtYesOrNo.frame=CGRectMake(190.0f, 10.0f, 70.0f, 30.0f);
            self.txtYesOrNo.placeholder=@"Yes/No";
            
            [cell.contentView addSubview:self.txtName];
            [cell.contentView addSubview:self.txtPassword];
            [cell.contentView addSubview:self.txtYesOrNo];
            
        }
  
    }else{
        //删除cell中已经存在的控件，避免cell的内容的重叠
        while ([cell.contentView.subviews lastObject]!=nil) {
            [(UIView *)[cell.contentView.subviews lastObject]removeFromSuperview];
        }
        
        NSUInteger row=[indexPath row];
        NSDictionary *rowDict=[self.listFilterTeams
                               objectAtIndex:row];
        UILabel *labelName=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 70, 30)];
        UILabel *labelPassword=[[UILabel alloc]initWithFrame:CGRectMake(90, 10, 80, 30)];
        UILabel *labelYesOrNo=[[UILabel alloc]initWithFrame:CGRectMake(180, 10, 130, 30)];
        labelName.text=[rowDict objectForKey:@"Name"];
        labelPassword.text=[rowDict objectForKey:@"Password"];
        labelYesOrNo.text=[rowDict objectForKey:@"YesOrNo"];
        [cell.contentView addSubview:labelName];
        [cell.contentView addSubview:labelPassword];
        [cell.contentView addSubview:labelYesOrNo];

        
        
    }
    
    return cell;
}


-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
    
    if(editing){
        
        self.txtName.hidden=NO;
        self.txtPassword.hidden=NO;
        self.txtYesOrNo.hidden=NO;
        
    }else{
        
        self.txtName.hidden=YES;
        self.txtPassword.hidden=YES;
        self.txtYesOrNo.hidden=YES;
    }
}

//当进行插入或者删除操作时，对单元格的图标进行设置
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.row==[self.listTeams count]){
        return UITableViewCellEditingStyleInsert;
    }
    
    return UITableViewCellEditingStyleDelete;

}

//插入删除操作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    if(editingStyle==UITableViewCellEditingStyleDelete){
        [self.listTeams removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    
    }else if(editingStyle==UITableViewCellEditingStyleInsert){
    
        NSDictionary *addDict=[NSDictionary dictionaryWithObjectsAndKeys:self.txtName.text,@"Name",self.txtPassword.text,@"Password",self.txtYesOrNo.text,@"YesOrNo", nil];
        
        
        [self.listTeams insertObject:addDict atIndex:[self.listTeams count]];

        [self.tableView insertRowsAtIndexPaths:[NSArray  arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    
    }

}

//使得单元格在被选择时处于高亮状态；
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(nonnull NSIndexPath *)indexPath{

    if(indexPath.row==[self.listTeams count]){
        return NO;
    }
    return YES;

}

//搜索
-(void)filterContentForSearText:(NSString *)searchText scope:(NSUInteger)scope{

    if([searchText length]==0){
    
        self.listFilterTeams=[NSMutableArray arrayWithArray:self.listTeams];
        return;
        
    }
    
    NSPredicate *scopePredicate;
    NSArray *tempArray;
    
    switch (scope) {
        case 0:
            scopePredicate=[NSPredicate predicateWithFormat:@"SELF.Name contains[c] %@",searchText];
            tempArray=[self.listTeams filteredArrayUsingPredicate:scopePredicate];
            self.listFilterTeams=[NSMutableArray arrayWithArray:tempArray];
            break;
        case 1:
            scopePredicate=[NSPredicate predicateWithFormat:@"SELF.Password contains[c] %@",searchText];
            tempArray=[self.listTeams filteredArrayUsingPredicate:scopePredicate];
            self.listFilterTeams=[NSMutableArray arrayWithArray:tempArray];
            break;
        default:
            self.listFilterTeams=[NSMutableArray arrayWithArray:self.listTeams];
            break;
    }
}

#pragma mark - UISearchDisplayController Delegate Methods
//当文本内容发生改变时候，向表视图数据源发出重新加载消息
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterContentForSearText:searchString scope:self.searchBar.selectedScopeButtonIndex];
    //YES情况下表视图可以重新加载
    return  YES;
}

@end
