//
//  RootViewController.h
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 4/19/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <CoreData/CoreData.h>
#import "FlipsideViewController.h"
#import "MapViewController.h"
#import "WebViewController.h"
#import "ReminderViewController.h"

@class LeyesViewController;

@interface RootViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, FlipsideViewControllerDelegate, MapViewControllerDelegate, ReminderViewControllerDelegate> {
    
    NSMutableArray  *cpeum;
    NSMutableArray  *detailText;
    LeyesViewController *leyesController;
    SLComposeViewController *mySLComposerSheet;
}

@property (nonatomic, retain) IBOutlet LeyesViewController *leyesController;
@property (nonatomic, retain) NSMutableArray *cpeum;
@property (nonatomic, retain) NSMutableArray *detailText;

- (IBAction)postToFacebook:(id)sender;
- (IBAction)showTweet:(id)sender;
- (IBAction)showContactInfo:(id)sender;
- (IBAction)showMaps:(id)sender;

- (IBAction)buscar:(id)sender;
- (IBAction)showReminder:(id)sender;

@end