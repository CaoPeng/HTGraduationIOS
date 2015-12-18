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
    
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
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
    
    NSLog(@"-->%d",(int)self.AdminList.count);
    
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

    return [self.AdminList count]+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier=@"AdminCell";
    
    AdminCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    BOOL  addCell=(indexPath.row==self.AdminList.count);
    
    //这个if语句没有，将导致错误
    if(cell==nil){
        
        cell=[[AdminCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AdminCell"];
    }
    if(!addCell){
        NSUInteger row=[indexPath row];
        NSDictionary *rowDict2=[self.AdminList objectAtIndex:row];
        cell.AdminName.text=[rowDict2 objectForKey:@"Name"];
        cell.AdminPassword.text=[rowDict2 objectForKey:@"Password"];

    }else{
        
        self.AdminName.frame=CGRectMake(30.0f, 10.0f, 90.0f, 30.0f);
        self.AdminName.placeholder=@"Name...";
        self.AdminPassword.frame=CGRectMake(150.0f, 10.0f, 90.0f, 30.0f);
        self.AdminPassword.placeholder=@"Password...";
        
        
        [cell.contentView addSubview:self.AdminName];
        [cell.contentView addSubview:self.AdminPassword];
        
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

@end
