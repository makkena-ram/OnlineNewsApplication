//
//  NewsPapersListTableViewController.m
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/27/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "NewsPapersListTableViewController.h"
#import "NewsPapersTableViewController.h"
#import "NewsPapers.h"
#import  "MainViewController.h"
#import "AddNewsPaperViewController.h"


@interface NewsPapersListTableViewController ()

@property AppDelegate *appDelegate;

@property (strong,nonatomic) NSMutableArray *resultNewsPapers;
@property NSString *paperTitle;

@end

@implementation NewsPapersListTableViewController

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
    //set the background color to the table view
    [self.tableView setBackgroundColor:[UIColor grayColor]];
    //Initializing the all the Properties which we declared in this class interface
    self.isSearch = NO;
    self.appDelegate=[UIApplication sharedApplication].delegate;
    self.newsPapersList= papersList;
    self.resultNewsPapers=[[NSMutableArray alloc]init];
}

//To add the new News Paper to the Exisiting List of News Papers
-(void)add:(id)object
{
    //Adding the one object to the papersList array
    [papersList addObject:object];
    self.newsPapersList=papersList;
    
    //Reload the Table Data
    [self.tableView reloadData];
}


-(void)cancel
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//This is customized method is used to search The Data from the SearchBar and the Resulted Newspapers are displayed in the Table
-(void)searchThroughData
{
    self.resultNewsPapers=nil;
    
    //Check whether the text in the search bar is empty or not
    if (![self.searchBar.text isEqualToString:@""]) {
        
        //Get the Data by using search bar and store it into the Predicate Object
        NSPredicate *resultsPredicate=[NSPredicate predicateWithFormat:@"SELF.paperTitle BEGINSWITH[cd] %@",self.searchBar.text];
        
        //Store the Results array into the resultsNewsPapers object
        self.resultNewsPapers= [NSMutableArray arrayWithArray:[self.newsPapersList filteredArrayUsingPredicate:resultsPredicate]];

        self.isSearch = YES;
        
    }
    else{
        self.isSearch = NO;
    }
    //Reload the Table Data
    [self.tableView reloadData];
    
}

//Tells the delegate that the user changed the search text.
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self searchThroughData];
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
    if(!self.isSearch)
    {
        return self.newsPapersList.count;
    }
    else
    {
        return self.resultNewsPapers.count;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.backgroundColor=[UIColor clearColor];
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    //check is there is seacr is active or not
    if(!self.isSearch)
    {
        NewsPapers  *displayPaper = [self.newsPapersList objectAtIndex:indexPath.row];
        cell.textLabel.text = displayPaper.paperTitle;
        cell.textLabel.textColor=[UIColor whiteColor];
    }
    else{
        NewsPapers  *displayPaper = [self.resultNewsPapers objectAtIndex:indexPath.row];
        cell.textLabel.text=displayPaper.paperTitle;
        cell.textLabel.textColor=[UIColor whiteColor];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //If the Search bar is active then goto the Prepare segue method
    if(self.searchDisplayController.isActive)
    {
        [self performSegueWithIdentifier:@"newsPapersTableVC" sender:self];
    }
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
    if([segue.identifier isEqualToString:@"newsPapersTableVC"])
    {
        NewsPapersTableViewController * newsPapersTableVC;
        if(self.isSearch)
        {
            int index=(int)[self.tableView indexPathForSelectedRow].row;
            newsPapersTableVC = [segue destinationViewController];
            newsPaper=self.resultNewsPapers[index];
            
        }
        else
        {
            int index=(int)[self.tableView indexPathForSelectedRow].row;
             newsPapersTableVC= [segue destinationViewController];
           // NSLog(@"news Paper: %@",newsPapersTableVC.newsPapers.paperTitle);
            newsPaper=[self.newsPapersList objectAtIndex:index];
            
            
        }
        // Pass the selected object to the new view controller.
        newsPapersTableVC.newsPapers= newsPaper;

    }
    else{
        
        AddNewsPaperViewController *addNewsPaperVC=[segue destinationViewController];
        // Pass the selected object to the new view controller.
        addNewsPaperVC.newsPapersListTVC=self;
    }
    
}

- (IBAction)home:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
