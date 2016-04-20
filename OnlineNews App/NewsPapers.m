//
//  NewsPapers.m
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/27/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "NewsPapers.h"

@implementation NewsPapers

-(id)initWithName:(NSString *)paperTitle categoryList:(NSMutableArray *)categoryList
{
    if(self = [super init])
    {
      self.paperTitle = paperTitle;
        self.categoryList = categoryList;
}
    return self;
}

@end

