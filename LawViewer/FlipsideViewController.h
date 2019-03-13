//
//  FlipsideViewController.h
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 6/27/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "WebViewController.h"
#import "IlegisViewController.h"
#import "GmgViewController.h"
#import "FbViewController.h"

@protocol FlipsideViewControllerDelegate;

@interface FlipsideViewController : UIViewController <WebViewControllerDelegate, IlegisViewControllerDelegate, GmgViewControllerDelegate, FbViewControllerDelegate, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate> {
    
    NSMutableArray *contactInfo;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *contactInfo;

- (IBAction)done:(id)sender;
- (IBAction)goGMG:(id)sender;

@end

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;

@end