//
//  YGHRootTableViewController.m
//  UIserachqqtableviewcontrol
//
//  Created by mac on 14-9-24.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHRootTableViewController.h"

@interface YGHRootTableViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UIPageControl *page;
}
@end

@implementation YGHRootTableViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    return cell;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *talbe=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    UIScrollView *scro=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    scro.delegate=self;
    
    scro.contentSize=CGSizeMake(320*4, 100) ;
    for (NSUInteger i=0; i<4; i++) {
        UIImageView *view=[[UIImageView alloc]initWithFrame:CGRectMake(320*i, 0,320 , 100)];
        view.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        view.contentMode=UIViewContentModeScaleAspectFit;
        [scro addSubview:view];
    }
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0, 200, 320, 10)];
    view1.backgroundColor=[UIColor redColor];
    scro.showsHorizontalScrollIndicator=NO;
    
    page=[[UIPageControl alloc]initWithFrame:CGRectMake(250, 100, 40, 20)];
    page.numberOfPages=4;
    page.currentPageIndicatorTintColor=[UIColor blueColor];
    page.pageIndicatorTintColor=[UIColor grayColor];
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 130)];
    
    [view addSubview:scro];
    [view addSubview:page];
    talbe.tableFooterView=view1;
    talbe.tableHeaderView=view;
    scro.pagingEnabled=YES;
    talbe.dataSource=self;
    talbe.delegate=self;
    [self.view addSubview:talbe];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    page.currentPage=scrollView.contentOffset.x/320;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
