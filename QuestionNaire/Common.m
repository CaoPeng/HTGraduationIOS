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
    return [self.listTeams count]+1;
}

//设置每个单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier=@"CellIdentifier";
    
    CommonCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    BOOL  addCell=(indexPath.row==self.listTeams.count);
    
    //这个if语句没有，将导致错误
    if(cell==nil){
    
        cell=[[CommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    if(!addCell){
        NSUInteger row=[indexPath row];
        NSDictionary *rowDict=[self.listTeams objectAtIndex:row];
        cell.Name.text=[rowDict objectForKey:@"Name"];
        cell.Password.text=[rowDict objectForKey:@"Password"];
        cell.YesOrNo.text=[rowDict objectForKey:@"YesOrNo"];
    }else{
    
        self.txtName.frame=CGRectMake(10.0f, 10.0f, 70.0f, 30.0f);
        self.txtName.placeholder=@"Name";
        self.txtPassword.frame=CGRectMake(110.0f, 10.0f, 80.0f, 30.0f);
        self.txtPassword.placeholder=@"Password";
        
        self.txtYesOrNo.frame=CGRectMake(200.0f, 10.0f, 70.0f, 30.0f);
        self.txtYesOrNo.placeholder=@"Yes/No";
        
        [cell.contentView addSubview:self.txtName];
        [cell.contentView addSubview:self.txtPassword];
        [cell.contentView addSubview:self.txtYesOrNo];
        
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

@end
