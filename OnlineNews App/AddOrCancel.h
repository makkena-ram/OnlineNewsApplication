//
//  AddOrCancel.h
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 4/19/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AddOrCancel <NSObject>
-(void)add:(id)object;
@optional
-(void)cancel;
@end
