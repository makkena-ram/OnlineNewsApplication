//
//  Category.m
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/30/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "NewsCategory.h"

@implementation NewsCategory

-(id)initWithName:(NSString *)categoryName categoryURL:(NSURL *)categoryURL
{
    if(self = [super init])
    {
        self.categoryName = categoryName;
        self.categoryURL = categoryURL;
    }
    return  self;
}

@end