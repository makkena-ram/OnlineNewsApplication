//
//  NewsPapers.h
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/27/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsCategory.h"

@interface NewsPapers : NSObject
@property NSString * paperTitle;
@property NSMutableArray * categoryList;



-(id)initWithName:(NSString *)paperTitle categoryList:(NSMutableArray *)categoryList;

@end
