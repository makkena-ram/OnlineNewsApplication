//
//  NewsPaperDetailViewController.h
//  OnlineNews App
//
//  Created by Chalamalla,Sarita on 3/10/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "NewsRSSFeed.h"
#import "OptionsTableViewController.h"
#import "UIPopoverController+iPhone.h"

@interface NewsPaperDetailViewController : UIViewController<optionsDelegate>

@property NSString *link;
@property NSString *desc;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)showPopOver:(id)sender;


@property (nonatomic, strong) UIPopoverController *popOver;
@property (nonatomic, strong) OptionsTableViewController *optionPicker;
@property (nonatomic, strong) UIPopoverController *optionPickerPopover;
@end
