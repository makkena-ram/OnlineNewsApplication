//
//  NewsPapersListTableViewController.h
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/27/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsPapers.h"
#import "UIPopoverController+iPhone.h"
#import "AppDelegate.h"
#import "Constants.h"
#import "AddOrCancel.h"

@interface NewsPapersListTableViewController : UITableViewController<UISearchBarDelegate,AddOrCancel>


- (IBAction)home:(id)sender;
@property (nonatomic,strong) IBOutlet UISearchBar *searchBar;
@property BOOL isSearch;
@property NSMutableArray *newsPapersList;

@end
