//
//  ReminderViewController.h
//  LawViewer
//
//  Created by GMG on 26/7/13.
//  Copyright (c) 2013 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>

@protocol ReminderViewControllerDelegate;

@interface ReminderViewController : UIViewController

@property (strong, nonatomic) EKEventStore *eventStore;

@property (retain, nonatomic) IBOutlet UITextField *reminderTextField;
@property (retain, nonatomic) IBOutlet UIDatePicker *reminderPickDate;

@property (nonatomic, assign) id <ReminderViewControllerDelegate> delegate;

- (IBAction)setReminder:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)verReminders:(id)sender;

@end

@protocol ReminderViewControllerDelegate
- (void)reminderViewControllerDidFinish:(ReminderViewController *)controller;

@end