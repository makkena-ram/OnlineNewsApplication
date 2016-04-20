//
//  AppDelegate.h
//  OnlineNews App
//
//  Created by Chalamalla,Sarita on 3/10/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsPapers.h"
#import "Constants.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//Declaring Required Properties
@property NewsPapers *newsPapers;
@property NSURL * newsVideosURL;
@end
