//
//  NewsRSSFeed.m
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/25/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "NewsRSSFeed.h"
@interface NewsRSSFeed()

-(NSArray *)getHeaderAndSnippetFromSource:(NSString *)htmlSrc;
-(NSString *)getTitleFromItem:(NSString *)item;
-(NSString *)getDescriptionFromItem:(NSString *)item;
-(NSString *)getLinkFromItem:(NSString *)item;
-(NSArray *)getHeaderAndSnippetFromNewsvideosSource:(NSString *)htmlSrc;
-(NSString *)getTitleFromNewsvideosItem:(NSString *)item;
-(NSString *)getDescriptionFromNewsvideosItem:(NSString *)item;
-(NSString *)getThumbnailFromNewsVideosItem:(NSString *)item;

@end
@implementation NewsRSSFeed
//Declaring the Constants
const NSString * kNewsFeedProperties = @"nfprops";
const NSString * kTitle = @"title";
const NSString * kDescription = @"description";
const NSString * kLink = @"link";
const NSString * kImage = @"image";


//This method is used to retrive the data from the Web
-(void)retrieveFromWeb
{
    NSURLRequest *request=[NSURLRequest requestWithURL:self.feedURL];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *pageSource=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    [self setNewsStories:[self getHeaderAndSnippetFromSource:pageSource]];
}

//returns the titles and snippets from the item tag
-(NSArray *)getHeaderAndSnippetFromSource:(NSString *)htmlSrc
{
    NSArray * feedItems = [htmlSrc componentsSeparatedByString:@"<item>"];
    NSMutableArray * titlesAndSnippets = [[NSMutableArray alloc]init];
    for(NSString * item in feedItems)
    {
        NSMutableDictionary * newsItem = [[NSMutableDictionary alloc]init];
        [newsItem setObject:[self getTitleFromItem:item] forKey:kTitle];
        [newsItem setObject:[self getDescriptionFromItem:item] forKey:kDescription];
        [newsItem setObject:[self getLinkFromItem:item] forKey:kLink];
        [titlesAndSnippets addObject:newsItem];
    }
    return titlesAndSnippets;
}

//Get title from the item
-(NSString *)getTitleFromItem:(NSString *)item
{
    
    NSRange titleOpen = [item rangeOfString:@"<title>"];
    NSRange titleClose = [item rangeOfString:@"</title>"];
    NSRange titleContents;
    titleContents.location = titleOpen.location + titleOpen.length;
    titleContents.length = titleClose.location - titleContents.location;
    return [item substringWithRange:titleContents];
    
}

//Get the Description From the item
-(NSString *)getDescriptionFromItem:(NSString *)item
{
    
    NSRange descOpen = [item rangeOfString:@"<description>"];
    NSRange descClose = [item rangeOfString:@"</description>"];
   
    if(descOpen.location == NSNotFound)
        return  @"NO Description available!!";
     NSRange descRange;
    descRange.location = descOpen.location + descOpen.length;
    descRange.length = descClose.location - descRange.location;
    return [item substringWithRange:descRange];
}

//Get the Link From the item
-(NSString *)getLinkFromItem:(NSString *)item
{
    NSRange linkOpen = [item rangeOfString:@"<link>"];
    NSRange linkClose = [item rangeOfString:@"</link>"];
    
    if(linkOpen.location == NSNotFound)
        return  @"Sorry No Link available!!";
    NSRange linkRange;
    linkRange.location = linkOpen.location + linkOpen.length;
    linkRange.length = linkClose.location - linkRange.location;
    return [item substringWithRange:linkRange];
}

#pragma mark Data Persistence Methods.
-(NSURL *)newsFeedPath
{
    NSURL * docDirectory = [[[NSFileManager defaultManager]
                             URLsForDirectory:NSDocumentDirectory
                             inDomains:NSUserDomainMask] lastObject];
    NSURL * newsFeedPath = [docDirectory URLByAppendingPathComponent:(NSString *)kNewsFeedProperties];
return  newsFeedPath;
}


-(void)saveFeed
{
    [[self newsStories] writeToURL:[self newsFeedPath] atomically:YES];
    
}

//To retrive the Data from Prperties
-(void)retrieveFromProperties
{
    NSData * newsFeedData = [NSData dataWithContentsOfURL:[self newsFeedPath]];

    if(newsFeedData != nil)
    {
        NSLog(@"Retrives data from properties");
        NSMutableArray * newsFeeds = [NSPropertyListSerialization propertyListWithData:newsFeedData options:NSPropertyListMutableContainers format:nil error:nil];
        [self setNewsStories:[NSArray arrayWithArray:newsFeeds]];
    }
    else{
        NSLog(@"Retrieving from internet because no persisted stories were found");
        [self retrieveFromWeb];
        [self saveFeed];
    }

}

//To delete the list
-(void)deletePlist
{
    [[NSFileManager defaultManager]removeItemAtURL:[self newsFeedPath] error:nil];
}

//Get the Title From the newsvideos item
-(NSString *)getTitleFromNewsvideosItem:(NSString *)item
{
    
    NSRange titleOpen = [item rangeOfString:@"<title><![CDATA["];
    NSRange titleClose = [item rangeOfString:@"]]></title>"];
    NSRange titleContents;
    titleContents.location = titleOpen.location + titleOpen.length;
    titleContents.length = titleClose.location - titleContents.location;
    return [item substringWithRange:titleContents];
    
}

//Get the Description From the newsvideos item
-(NSString *)getDescriptionFromNewsvideosItem:(NSString *)item
{
    
    NSRange descOpen = [item rangeOfString:@"<description><![CDATA["];
    NSRange descClose = [item rangeOfString:@"]]></description>"];
    
    if(descOpen.location == NSNotFound)
        return  @"NO Description available!!";
    NSRange descRange;
    descRange.location = descOpen.location + descOpen.length;
    descRange.length = descClose.location - descRange.location;
    return [item substringWithRange:descRange];
}

//Get the Thumbnails From the newsvideos item
-(NSString *)getThumbnailFromNewsVideosItem:(NSString *)item
{
    NSRange thumbnailOpen = [item rangeOfString:@"<thumbnail><![CDATA["];
    NSRange thumbnailClose = [item rangeOfString:@"]]></thumbnail>"];
    
    if(thumbnailOpen.location == NSNotFound)
        return  @"NO Thumbnail available!!";
    NSRange thumbnailRange;
    thumbnailRange.location = thumbnailOpen.location + thumbnailOpen.length;
    thumbnailRange.length = thumbnailClose.location - thumbnailRange.location;
    return [item substringWithRange:thumbnailRange];
    
}

//returns the titles and snippets from the newsvideositem tag
-(NSArray *)getHeaderAndSnippetFromNewsvideosSource:(NSString *)htmlSrc
{
    NSArray * feedItems = [htmlSrc componentsSeparatedByString:@"<item>"];
    NSMutableArray * titlesAndSnippets = [[NSMutableArray alloc]init];
    for(int i=1;i<feedItems.count;i++)
    {
        NSMutableDictionary * newsItem = [[NSMutableDictionary alloc]init];
        [newsItem setObject:[self getTitleFromNewsvideosItem:[feedItems objectAtIndex:i]] forKey:kTitle];
        [newsItem setObject:[self getDescriptionFromNewsvideosItem:[feedItems objectAtIndex:i]] forKey:kDescription];
        [newsItem setObject:[self getLinkFromItem:[feedItems objectAtIndex:i]] forKey:kLink];
        [newsItem setObject:[self getThumbnailFromNewsVideosItem:[feedItems objectAtIndex:i]] forKey:kImage];
        [titlesAndSnippets addObject:newsItem];
    }
    return titlesAndSnippets;
}

//This method is used to retrive the data from the Web
-(void)retrieveNewsvideosFromWeb
{
    NSURLRequest *request=[NSURLRequest requestWithURL:self.feedURL];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *pageSource=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    [self setNewsStories:[self getHeaderAndSnippetFromNewsvideosSource:pageSource]];
}

//To retrive the Data from Prperties
-(void)retrieveNewsvideosFromProperties
{
    NSData * newsFeedData = [NSData dataWithContentsOfURL:[self newsFeedPath]];
    
    if(newsFeedData != nil)
    {
        NSLog(@"Retrives data from properties");
        NSMutableArray * newsFeeds = [NSPropertyListSerialization propertyListWithData:newsFeedData options:NSPropertyListMutableContainers format:nil error:nil];
        [self setNewsStories:[NSArray arrayWithArray:newsFeeds]];
    }
    else{
        NSLog(@"Retrieving from internet because no persisted stories were found");
        [self retrieveNewsvideosFromWeb];
        [self saveFeed];
    }
    
}


@end