//
//  NewsPapersTableViewController.h
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/25/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsRSSFeed.h"
#import "NewsPapers.h"
#import "NewsCategory.h"


@interface NewsPapersTableViewController : UITableViewController
{
    int flag;
}

@property (strong,nonatomic) NewsRSSFeed * rssFeed;
@property NSString *paperTitle;
@property NewsPapers *newsPapers;

@end
