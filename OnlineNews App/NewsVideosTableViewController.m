//
//  NewsVideosTableViewController.m
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/25/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "NewsVideosTableViewController.h"
#import "AppDelegate.h"
#import "NewsVideosDetailViewController.h"
#import "MainViewController.h"


@interface NewsVideosTableViewController ()

//declare the property for AppDelegate class for getting the required data
@property AppDelegate * videosDelegate;

@end

@implementation NewsVideosTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Set the BackgroundColor to the Table view
    [self.tableView setBackgroundColor:[UIColor grayColor]];
    //initializing the delegate object by using the UIApplication delegate object.
    self.videosDelegate =[UIApplication sharedApplication].delegate;
    
    //Initilizing the RSSFeed object and Loading of newsItems from RSSFeed
    self.rssFeed=[[NewsRSSFeed alloc]init];
    
    //Delelte the PList
    [self.rssFeed deletePlist];
    
    //Set the given FeedURL to the to the NewsRSSFeed Class object.
    [self.rssFeed setFeedURL:self.videosDelegate.newsVideosURL];
    
    //Retrive the the data From the Properties
    [self.rssFeed retrieveNewsvideosFromProperties];
    
    //Just for Verification Purpose whether we are reading the newsitems really or not
    for(id newsItem in self.rssFeed.newsStories)
    {
        NSDictionary * dict = (NSDictionary *)newsItem;
        NSLog(@"title:%@ \n %@", [dict objectForKey:@"title"], [dict objectForKey:@"description"]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

// Return the number of sections.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

//Return the number of rows in the section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rssFeed.newsStories.count;
}

//Populating the Each Cell data in the Table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];
    //Getting the one Object Data form the newsStories array one object and store them into the NSMutableDictionary Object and set the color to text
    NSMutableDictionary *news=(NSMutableDictionary *)self.rssFeed.newsStories[indexPath.row+1];
    cell.textLabel.text=[news objectForKey:@"title"];
    cell.detailTextLabel.text=[news objectForKey:@"description"];
    cell.imageView.image=[UIImage imageNamed:[news objectForKey:@"image"]];
    cell.textLabel.textColor=[UIColor whiteColor];
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
    NSMutableDictionary *news=(NSMutableDictionary *)self.rssFeed.newsStories[index];
    NewsVideosDetailViewController *newsPaperDVC=[segue destinationViewController];
    
    // Pass the selected object to the new view controller.
    newsPaperDVC.link=[news objectForKey:@"link"];
}

//To Navigate Back to the MainViewController
- (IBAction)home:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
