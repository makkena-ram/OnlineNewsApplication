//
//  OptionsTableViewController.m
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/27/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "OptionsTableViewController.h"
#import "NewsPaperDetailViewController.h"

@interface OptionsTableViewController ()
@property NewsPaperDetailViewController *newsDVC;
@end

@implementation OptionsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.optionsName = [NSMutableArray arrayWithObjects:
                            @"Mail Article",@"Copy Link",@"Share in Facebook",@"Tweet",nil];
        self.clearsSelectionOnViewWillAppear = NO;
        
        //Calculate how tall the view should be by multiplying the individual row height
        //by the total number of rows.
        NSInteger rowsCount = [self.optionsName count];
        NSInteger singleRowHeight = [self.tableView.delegate tableView:self.tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        NSInteger totalRowsHeight = rowsCount * singleRowHeight;
        
        //Calculate how wide the view should be by finding how wide each string is expected to be
        CGFloat largestLabelWidth = 0;
        for (NSString * optionName in self.optionsName)
        {
            //Checks size of text using the default font for UITableViewCell's textLabel.
            UIFont *font = [UIFont boldSystemFontOfSize:20.0f];
            
            CGRect textRect;
            NSDictionary *attributes = @{NSFontAttributeName: font};
            
            // How big is this string when drawn in this font?
            CGSize labelSize = [optionName sizeWithAttributes:attributes];
            
            // Draw the string
            [optionName drawInRect:textRect withAttributes:attributes];
        
            if (labelSize.width > largestLabelWidth) {
                largestLabelWidth = labelSize.width;
            }
        }
        
        //Add a little padding to the width
        CGFloat popoverWidth = largestLabelWidth + 100;
        
        //Set the property to tell the popover container how big this view will be.
        self.preferredContentSize = CGSizeMake(popoverWidth, totalRowsHeight);
       }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.newsDVC=[[NewsPaperDetailViewController alloc]init];
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
    // Return the number of rows in the section.
    return self.optionsName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
     }
    cell.textLabel.text = [self.optionsName objectAtIndex:indexPath.row];

  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 NSString *selectedOption = [self.optionsName objectAtIndex:indexPath.row];
    if([selectedOption isEqualToString:@"Mail Article"])
    {
        
        NSArray *postItems = @[self.link];
        
        UIActivityViewController *activityVC = [[UIActivityViewController alloc]
                                                initWithActivityItems:postItems
                                                applicationActivities:nil];
        
        [self presentViewController:activityVC animated:YES completion:nil];
        
    }
    else if([selectedOption isEqualToString:@"Copy Link"])
    {
        UIPasteboard *pasteBoard=[UIPasteboard generalPasteboard];
        [pasteBoard setString:self.link];
        
    }
    else if([selectedOption isEqualToString:@"Share in Facebook"])
    {
        NSArray *postItems = @[self.link];
        
        UIActivityViewController *activityVC = [[UIActivityViewController alloc]
                                                initWithActivityItems:postItems
                                                applicationActivities:nil];
        
        [self presentViewController:activityVC animated:YES completion:nil];

    }
    else if([selectedOption isEqualToString:@"Tweet"])
    {
        
        NSArray *postItems = @[self.link];
        
        UIActivityViewController *activityVC = [[UIActivityViewController alloc]
                                                initWithActivityItems:postItems
                                                applicationActivities:nil];
        
        [self presentViewController:activityVC animated:YES completion:nil];

    }
    else
    {
        
    }
    if (self.delegate != nil)
        [self.delegate selectedOption:selectedOption];
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
