//
//  AddNewsPaperViewController.h
//  OnlineNews App
//
//  Created by Sarita Chalamalla on 4/18/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddOrCancel.h"

@interface AddNewsPaperViewController : UIViewController<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *titleTF;

@property (weak, nonatomic) IBOutlet UITextField *categoryNamesTF;

@property (weak, nonatomic) IBOutlet UITextField *rssFeedsTF;

- (IBAction)cancel:(id)sender;

- (IBAction)addNewsPaper:(id)sender;

@property id<AddOrCancel>newsPapersListTVC;

@end
