//
//  CategoryTableViewController.h
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/29/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsPapers.h"
#import "NewsCategory.h"

#import "Constants.h"

@interface CategoryTableViewController : UITableViewController

@property NSMutableArray * papersList;
@property NSMutableArray *categories;

@end

