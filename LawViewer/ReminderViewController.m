//
//  ReminderViewController.m
//  LawViewer
//
//  Created by GMG on 26/7/13.
//  Copyright (c) 2013 Gispert Media Group. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController ()

@end

@implementation ReminderViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_reminderTextField release];
    [_reminderPickDate release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setReminderTextField:nil];
    [self setReminderPickDate:nil];
    [self setReminder:nil];
    [super viewDidUnload];
}

- (IBAction)setReminder:(id)sender {
    
    if (_eventStore == nil)
    {
        _eventStore = [[EKEventStore alloc]init];
        
        [_eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
            
            if (!granted)
                NSLog(@"Access to store not granted");
        }];
    }
    
    if (_eventStore != nil)
        [self createReminder];
        NSLog(@"Access to store granted");
}

-(void)createReminder
{
    
    EKReminder *reminder = [EKReminder
                            reminderWithEventStore:self.eventStore];
    
    [reminder setCalendar:[_eventStore defaultCalendarForNewReminders]];
    
    reminder.title = _reminderTextField.text;
    
    reminder.calendar = [_eventStore defaultCalendarForNewReminders];
    
    NSDate *date = [_reminderPickDate date];
    
    EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:date];
    
    [reminder addAlarm:alarm];
    
    NSLog(@"alarm set");
    
    NSError *error = nil;
    
    [_eventStore saveReminder:reminder commit:YES error:&error];
    
    if (error)
        NSLog(@"error = %@", error);
}

- (IBAction)hideKeyboard:(id)sender {
    [_reminderTextField resignFirstResponder];
}

//> iOS 6.0
-(BOOL)shouldAutorotate
{
    return YES;
}


//< iOS 5.0
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (IBAction)done:(id)sender
{
    [self.delegate reminderViewControllerDidFinish:self];
}

- (IBAction)verReminders:(id)sender {
    
    NSString *stringURL = @"x-apple-reminder://";
    NSURL *url = [NSURL URLWithString:stringURL];
    [[UIApplication sharedApplication] openURL:url];
}

@end
