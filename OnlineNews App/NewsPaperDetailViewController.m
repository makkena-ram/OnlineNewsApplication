//
//  NewsPaperDetailViewController.m
//  OnlineNews App
//
//  Created by Chalamalla,Sarita on 3/10/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "NewsPaperDetailViewController.h"
#import "OptionsTableViewController.h"

@interface NewsPaperDetailViewController ()

@end

@implementation NewsPaperDetailViewController

@synthesize link = _link;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Get the WebData using the NSURL
   [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.link]]];
    
    //Setting the Buutons Manually in the NavigationBarItem
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"<Articles" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *newButton = [[UIBarButtonItem alloc] initWithTitle:@"speak" style:UIBarButtonItemStyleBordered target:self action:@selector(speak:)];
    
    NSArray *navBarItems = [[NSArray alloc] initWithObjects:back, flexibleSpace, newButton,nil];
    self.navigationItem.leftBarButtonItems=navBarItems;
    

}

//To Get Back to the Previous ViewController
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//To dismiss the popover
-(void)selectedOption:(NSString *)newOption
{
    //Dismiss the popover if it's showing.
    if (self.popOver) {
        [self.popOver dismissPopoverAnimated:YES];
        self.popOver = nil;
    }
    
}

//This method is executed whent he Popover button is clicked is clicked
- (IBAction)showPopOver:(id)sender {
    
    if (self.optionPicker == nil) {
        //Create the ColorPickerViewController.
        self.optionPicker= [[OptionsTableViewController alloc] initWithStyle:UITableViewStylePlain];
        self.optionPicker.link=self.link;
        //Set this VC as the delegate.
        self.optionPicker.delegate = self;
    }
    
    if (self.popOver == nil)
    {
        //The color picker popover is not showing. Show it.
        self.popOver = [[UIPopoverController alloc] initWithContentViewController:self.optionPicker];
        
        [self.popOver presentPopoverFromBarButtonItem:sender  permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    } else {
        //The color picker popover is showing. Hide it.
        [self.popOver dismissPopoverAnimated:YES];
        self.popOver = nil;
    }
}


- (IBAction)speak:(id)sender {
    
    //To speak the data

        AVSpeechSynthesizer *speechSynthesizer = [[AVSpeechSynthesizer alloc]init];
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.description];
        [utterance setRate:0.3f];
        [speechSynthesizer speakUtterance:utterance];
      
}
@end
