//
//  OptionsTableViewController.h
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/27/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "optionsDelegate.h"

@interface OptionsTableViewController : UITableViewController

@property (nonatomic, weak) id<optionsDelegate> delegate;
@property (nonatomic, strong) NSMutableArray * optionsName;
@property (nonatomic, strong)NSString *link;

@end
