//
//  NewsRSSFeed.h
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/25/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsRSSFeed : NSObject


@property NSURL *feedURL;
@property NSArray *newsStories;

-(void)retrieveFromWeb;
-(void)saveFeed;
-(void)retrieveFromProperties;
-(void)deletePlist;
-(void)retrieveNewsvideosFromProperties;
-(void)retrieveNewsvideosFromWeb;

@end
