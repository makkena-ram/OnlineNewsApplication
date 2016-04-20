//
//  NewsVideosTableViewController.h
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/25/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsRSSFeed.h"
#import "NewsPapers.h"


@interface NewsVideosTableViewController : UITableViewController

- (IBAction)home:(id)sender;
//declaring a propery for NewsRSSFeed Class
@property (strong,nonatomic) NewsRSSFeed * rssFeed;
@end
