//
//  AddNewsPaperViewController.m
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 4/18/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "AddNewsPaperViewController.h"
#import "Constants.h"
#import "NewsPapers.h"
#import "NewsCategory.h"
#import "NewsPapersListTableViewController.h"

@interface AddNewsPaperViewController ()

@property NSMutableArray *categories;
@property NSMutableArray *rssFeeds;
@property NewsCategory *newsCategory;
@property NewsPapers *newsPaper;
@property NSMutableArray *newsCategories;

@end

@implementation AddNewsPaperViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//To cancel the data to be adding
- (IBAction)cancel:(id)sender {
    [self.newsPapersListTVC cancel];
    [self dismissViewControllerAnimated:YES completion:nil];
}

//Adding the NewsPaper to list
- (IBAction)addNewsPaper:(id)sender {
    
    self.categories=[[NSMutableArray alloc]init];
    self.rssFeeds=[[NSMutableArray alloc]init];
    self.newsCategories=[[NSMutableArray alloc]init];
    [self.categories addObjectsFromArray:[self.categoryNamesTF.text componentsSeparatedByString:@","]];
    [self.rssFeeds addObjectsFromArray:[self.rssFeedsTF.text componentsSeparatedByString:@","]];
    for(int i=0;i<self.categories.count;i++)
    {
        self.newsCategory=[[NewsCategory alloc]initWithName:self.categories[i] categoryURL:[NSURL URLWithString:self.rssFeeds[i]]];
        [self.newsCategories addObject:self.newsCategory];
        
    }
    
    self.newsPaper=[[NewsPapers alloc]initWithName:self.titleTF.text categoryList:self.newsCategories];
    [self.newsPapersListTVC add:self.newsPaper];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
