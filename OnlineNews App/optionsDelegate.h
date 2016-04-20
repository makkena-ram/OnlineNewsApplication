//
//  optionsDelegate.h
//  OnlineNews App
//
//  Created by Makkena,Ramakrishna on 4/15/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol optionsDelegate <NSObject>

@required
-(void)selectedOption:(NSString *)newOption;

@end
