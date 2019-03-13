//
//  GmgViewController.h
//  OperacionesDeCredito
//
//  Created by Othmar Gispert on 6/10/11.
//  Copyright (c) 2011 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol GmgViewControllerDelegate;

@interface GmgViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate>
{
	IBOutlet UIWebView *gispertWebView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    NSTimer *timer;
}

@property (nonatomic, retain) UIWebView	*gispertWebView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, assign) id <GmgViewControllerDelegate> delegate;

- (IBAction)doneGispert:(id)sender;

@end

@protocol GmgViewControllerDelegate
- (void)gmgViewControllerDidFinish:(GmgViewController *)controller;

@end