//
//  CategoryTableViewController.m
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/29/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "NewsPapers.h"
#import "NewsPapersTableViewController.h"
#import "NewsCategory.h"
#import "AppDelegate.h"

@interface CategoryTableViewController ()

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property AppDelegate *appDelegate;

@end

@implementation CategoryTableViewController

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
    
    self.appDelegate=[UIApplication sharedApplication].delegate;
    self.papersList= papersList;
    
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
    
    return [self.categories count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NewsCategory *newsCategory=[newsPaper.categoryList objectAtIndex:indexPath.row];
    //NSLog(@"category Name:%@",newsCategory.categoryName);
    cell.textLabel.text = newsCategory.categoryName;
    
    //cell.textLabel.text = @"category";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NewsCategory  *category=[self.categories objectAtIndex:indexPath.row];
    categoryName = category.categoryName;
    categoryTemp=category;
    [self dismissViewControllerAnimated:YES completion:nil];

}

/*
// Override to support conditional editing of the table view
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    int index=[self.tableView indexPathForSelectedRow].row;
    NewsCategory *category=self.categories[index];
    NSLog(@"catNAme:%@",category.categoryName);
    LatestNewsCategoryTableViewController *latestNewsCategoryTVC=[segue destinationViewController];
    latestNewsCategoryTVC.category=category;
    
}
*/

@end
