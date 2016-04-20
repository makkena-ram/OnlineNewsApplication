//
//  AppDelegate.m
//  OnlineNews App
//
//  Created by Chalamalla,Sarita on 3/10/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //Initializing the NewsVideos URL
    self.newsVideosURL=[NSURL URLWithString:@"http://www.cbn.com/cbnnews/feed/"];
    
    //Initializing the NewspapersURLs with Categories
    papersList = [NSMutableArray
                  arrayWithObjects:
                  [[NewsPapers alloc]initWithName:@"Forbes"
                                     categoryList:[NSMutableArray arrayWithObjects:
                                                   [[NewsCategory alloc]initWithName:@"Latest News" categoryURL:[NSURL URLWithString:@"http://www.forbes.com/real-time/feed2/"]],
                                                   [[NewsCategory alloc]initWithName:@"Most Popular" categoryURL:[NSURL URLWithString:@"http://www.forbes.com/most-popular/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Market News" categoryURL:[NSURL URLWithString:@"http://www.forbes.com/markets/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Business" categoryURL:[NSURL URLWithString:@"http://www.forbes.com/business/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Sports" categoryURL:[NSURL URLWithString:@"http://www.forbes.com/sportsmoney/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"HealthCare" categoryURL:[NSURL URLWithString:@"http://www.forbes.com/healthcare/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Autos" categoryURL:[NSURL URLWithString:@"http://www.forbes.com/autos/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Technology" categoryURL:[NSURL URLWithString:@"http://www.forbes.com/technology/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Education" categoryURL:[NSURL URLWithString:@"http://www.forbes.com/education/feed/"]]
                                                   ,nil]],
                  [[NewsPapers alloc]initWithName:@"USA Today"
                                     categoryList:[NSMutableArray arrayWithObjects:
                                                   [[NewsCategory alloc]initWithName:@"Latest News" categoryURL:[NSURL URLWithString:@"http://rssfeeds.usatoday.com/usatoday-NewsTopStories"]],
                                                   [[NewsCategory alloc]initWithName:@"World News" categoryURL:[NSURL URLWithString:@"http://rssfeeds.usatoday.com/UsatodaycomWorld-TopStories"]],
                                                   [[NewsCategory alloc]initWithName:@"Health" categoryURL:[NSURL URLWithString:@"http://rssfeeds.usatoday.com/UsatodaycomHealth-TopStories"]],
                                                   [[NewsCategory alloc]initWithName:@"Techincal" categoryURL:[NSURL URLWithString:@"http://rssfeeds.usatoday.com/usatoday-TechTopStories"]],
                                                   [[NewsCategory alloc]initWithName:@"Entertainment" categoryURL:[NSURL URLWithString:@"http://rssfeeds.usatoday.com/usatoday-LifeTopStories"]],
                                                   [[NewsCategory alloc]initWithName:@"Sports" categoryURL:[NSURL URLWithString:@"http://rssfeeds.usatoday.com/UsatodaycomSports-TopStories"]]
                                                   ,nil]],
                  [[NewsPapers alloc]initWithName:@"Los Angeles Times"
                                     categoryList:[NSMutableArray arrayWithObjects:
                                                   [[NewsCategory alloc]initWithName:@"Latest News" categoryURL:[NSURL URLWithString:@"http://pipes.yahoo.com/pipes/pipe.run?_id=5dc8a87340794a992d374f7389268bc3&_render=rss"]],
                                                   [[NewsCategory alloc]initWithName:@"Business" categoryURL:[NSURL URLWithString:@"http://www.latimes.com/business/autos/rss2.0.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"Sports" categoryURL:[NSURL URLWithString:@"http://www.latimes.com/sports/sportsnow/rss2.0.xml"]]
                                                   ,nil]],
                  [[NewsPapers alloc]initWithName:@"Seattle Times"
                                     categoryList:[NSMutableArray arrayWithObjects:
                                                   [[NewsCategory alloc]initWithName:@"Latest News" categoryURL:[NSURL URLWithString:@"http://seattletimes.com/rss/home.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"Business And Technology" categoryURL:[NSURL URLWithString:@"http://seattletimes.com/rss/businesstechnology.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"Nation&World" categoryURL:[NSURL URLWithString:@"http://seattletimes.com/rss/nationworld.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"Living" categoryURL:[NSURL URLWithString:@"http://seattletimes.com/rss/living.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"Entertainment" categoryURL:[NSURL URLWithString:@"http://seattletimes.com/rss/entertainment.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"Politics" categoryURL:[NSURL URLWithString:@"http://seattletimes.com/rss/politics.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"Travel" categoryURL:[NSURL URLWithString:@"http://seattletimes.com/rss/travel.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"Sports" categoryURL:[NSURL URLWithString:@"http://seattletimes.com/rss/sports.xml"]]
                                                   ,nil]],
                  [[NewsPapers alloc]initWithName:@"The Wall Street Journal"
                                     categoryList:[NSMutableArray arrayWithObjects:
                                                   [[NewsCategory alloc]initWithName:@"World News" categoryURL:[NSURL URLWithString:@"http://online.wsj.com/xml/rss/3_7085.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"Business" categoryURL:[NSURL URLWithString:@"http://online.wsj.com/xml/rss/3_7014.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"Market News" categoryURL:[NSURL URLWithString:@"http://online.wsj.com/xml/rss/3_7031.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"Technology" categoryURL:[NSURL URLWithString:@"http://online.wsj.com/xml/rss/3_7455.xml"]],
                                                   [[NewsCategory alloc]initWithName:@"LifeStyle" categoryURL:[NSURL URLWithString:@"http://online.wsj.com/xml/rss/3_7201.xml"]],
                                                   nil]],
                  [[NewsPapers alloc]initWithName:@"NewYork Post"
                                     categoryList:[NSMutableArray arrayWithObjects:
                                                   [[NewsCategory alloc]initWithName:@"Latest News" categoryURL:[NSURL URLWithString:@"http://nypost.com/news/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Business" categoryURL:[NSURL URLWithString:@"http://nypost.com/business/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Technical" categoryURL:[NSURL URLWithString:@"http://nypost.com/tech/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Living" categoryURL:[NSURL URLWithString:@"http://nypost.com/living/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Entertainment" categoryURL:[NSURL URLWithString:@"http://nypost.com/entertainment/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Sports" categoryURL:[NSURL URLWithString:@"http://nypost.com/sports/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Metro" categoryURL:[NSURL URLWithString:@"http://nypost.com/metro/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Opinion" categoryURL:[NSURL URLWithString:@"http://nypost.com/opinion/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Fashion" categoryURL:[NSURL URLWithString:@"http://nypost.com/fashion/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Media" categoryURL:[NSURL URLWithString:@"http://nypost.com/media/feed/"]],
                                                   [[NewsCategory alloc]initWithName:@"Real Estate" categoryURL:[NSURL URLWithString:@"http://nypost.com/real-estate/feed/"]],nil]],
                  nil];
    
    
    
        return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
