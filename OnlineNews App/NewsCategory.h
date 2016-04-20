//
//  Category.h
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 3/30/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsCategory : NSObject

@property NSString  * categoryName;
@property NSURL * categoryURL;

-(id)initWithName:(NSString *)categoryName categoryURL:(NSURL *)categoryURL;
@end
