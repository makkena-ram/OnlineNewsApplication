//
//  NewsPapersTableViewController.m
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/25/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "CategoryTableViewController.h"
#import "NewsPapersTableViewController.h"
#import "NewsRSSFeed.h"
#import "NewsPaperDetailViewController.h"
#import "NewsCategory.h"


@interface NewsPapersTableViewController ()


@end

@implementation NewsPapersTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    flag = 0;
    
    //Initilizing the RSSFeed object and Loading of newsItems from RSSFeed
    self.rssFeed=[[NewsRSSFeed alloc]init];
    
    //Delelte the PList
    [self.rssFeed deletePlist];
    
    //Select the First Category from the selected Newspaper
    NewsCategory *newsCategory=[self.newsPapers.categoryList objectAtIndex:0];
    self.paperTitle=self.newsPapers.paperTitle;
    categoryTemp = newsCategory;
   
    //Set the given FeedURL to the to the NewsRSSFeed Class object.
    [self.rssFeed setFeedURL:categoryTemp.categoryURL];
    
    //Retrive the the data From the Properties
    [self.rssFeed retrieveFromProperties];
    
    //Just for Verification Purpose whether we are reading the newsitems really or not
    for(id newsItem in self.rssFeed.newsStories)
    {
        NSDictionary * dict = (NSDictionary *)newsItem;
        NSLog(@"title:%@ \n %@", [dict objectForKey:@"title"], [dict objectForKey:@"description"]);
    }
   
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.rssFeed.newsStories != nil) {
        flag++;
        if(flag != 0)
        [self.rssFeed deletePlist];

    }
    self.navigationItem.title=[NSString stringWithFormat:@"%@",categoryTemp.categoryName];
    //Set the given FeedURL to the to the NewsRSSFeed Class object.
    [self.rssFeed setFeedURL:categoryTemp.categoryURL];
    
    //Retrive the the data From the Properties
    [self.rssFeed retrieveFromProperties];
    
    //Just for Verification Purpose whether we are reading the newsitems really or not
    for(id newsItem in self.rssFeed.newsStories)
    {
        NSDictionary * dict = (NSDictionary *)newsItem;
        NSLog(@"title:%@ \n %@", [dict objectForKey:@"title"], [dict objectForKey:@"description"]);
    }
    
    //Reload the Table Data
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rssFeed.newsStories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //getting the news articles from the selected news paper
    if([self.paperTitle isEqualToString:@"NewYork Post"])
    {
        NSMutableDictionary *news=(NSMutableDictionary *)self.rssFeed.newsStories[indexPath.row];
        cell.textLabel.text=[news objectForKey:@"title"];
        cell.detailTextLabel.text=[news objectForKey:@"description"];

    }
    else
    {
        NSMutableDictionary *news=(NSMutableDictionary *)self.rssFeed.newsStories[indexPath.row+1];
        cell.textLabel.text=[news objectForKey:@"title"];
        cell.detailTextLabel.text=[news objectForKey:@"description"];
  
    }
    
    return cell;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    int index=(int)[self.tableView indexPathForSelectedRow].row;
    if([segue.identifier isEqualToString:@"newsDetailView"])
    {
        NewsPaperDetailViewController *newsDVC=[segue destinationViewController];
        NSMutableDictionary *news=(NSMutableDictionary *)self.rssFeed.newsStories[index];
        newsDVC.desc=[news objectForKey:@"description"];
        newsDVC.link=[news objectForKey:@"link"];
    }
    else{
        
        CategoryTableViewController *categoryTVC=[segue destinationViewController];
         // Pass the selected object to the new view controller.
        categoryTVC.categories=self.newsPapers.categoryList;
    }
   
}



@end
