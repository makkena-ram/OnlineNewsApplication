//
//  ViewController.m
//  OnlineNews App
//
//  Created by Chalamalla,Sarita on 3/10/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "MainViewController.h"
#import "NewsPapersTableViewController.h"
#import "NewsVideosTableViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"worldmap.jpg"]]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getNewsPapers:(id)sender {

}

- (IBAction)getNewsVideos:(id)sender {
}
@end
