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
    
    [self initAdd];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


-(void)initAdd{
    
    CGRect rect=[UIScreen mainScreen].bounds;
    UIView *view1=[[UIView alloc]initWithFrame:rect];
    view1.tag=32;
    view1.hidden=YES;
    //设置view的背景颜色和不透明度
    view1.backgroundColor=[UIColor colorWithRed:0.2f green:0.2f  blue:0.2f  alpha:0.7f ];
    [self.view addSubview:view1];
    
    CGRect rect2=CGRectMake(75, 10, 230, 160);
    UIView *view2=[[UIView alloc]initWithFrame:rect2];
    view2.tag=33;
    view2.hidden=YES;
    view2. backgroundColor=[UIColor colorWithWhite:1.0 alpha:1.0];
    [view1 addSubview:view2];
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(70,10, 100, 20)];
    label1.font=[UIFont systemFontOfSize:15.0f];
    label1.text=@"添加新用户：";
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(10, 50,55, 30)];
    label2.text=@"用户名：";
    label2.font=[UIFont systemFontOfSize:13.0f];
    
    UITextField *txtOriginal=[[UITextField alloc]initWithFrame:CGRectMake(70,50, 150, 30)];
    txtOriginal.delegate=self;
    txtOriginal.placeholder=@"input userName...";
    txtOriginal.borderStyle=UITextBorderStyleRoundedRect;
    
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(10, 90,55, 20)];
    label3.text=@"密码：";
    label3.font=[UIFont systemFontOfSize:13.0f];
    
    UITextField *txtNew=[[UITextField alloc]initWithFrame:CGRectMake(70,90, 150, 30)];
    txtNew.delegate=self;
    txtNew.placeholder=@"input password...";
    txtNew.borderStyle=UITextBorderStyleRoundedRect;
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(100.0f, 130.0f, 20.0f, 20.0f);
    [button setTitle:@"OK" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.0f green:0.4f blue:0.8f alpha:1.0] forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:14.0f];
    button.backgroundColor=[UIColor clearColor];
    //给button添加委托方式，即点击触发事件
    [button addTarget:self action:@selector(touchButton) forControlEvents:UIControlEventTouchUpInside];
    
    [view2 addSubview:label1];
    [view2 addSubview:label2];
    [view2 addSubview:label3];
    [view2 addSubview:txtOriginal];
    [view2 addSubview:txtNew];
    [view2 addSubview:button];
    
}

-(void)touchButton{
    
    UIView *view1=(UIView *)[self.view viewWithTag:32];
    UIView *view2=(UIView *)[view1 viewWithTag:33];
    
    view1.hidden=YES;
    view2.hidden=YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)AddAdmin:(id)sender {
    
    UIView *view1=(UIView *)[self.view viewWithTag:32];
    UIView *view2=(UIView *)[view1 viewWithTag:33];
    
    view1.hidden=NO;
    view2.hidden=NO;
    
    
}
@end
