//
//  NewsVideosDetailViewController.h
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 4/13/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsVideosDetailViewController : UIViewController

@property NSString *link;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
