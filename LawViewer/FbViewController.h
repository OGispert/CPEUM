//
//  FbViewController.h
//  OperacionesDeCredito
//
//  Created by Othmar Gispert on 6/10/11.
//  Copyright (c) 2011 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol FbViewControllerDelegate;

@interface FbViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate>
{
	IBOutlet UIWebView *FbWebView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    NSTimer *timer;
}

@property (nonatomic, retain) UIWebView	*FbWebView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, assign) id <FbViewControllerDelegate> delegate;

- (IBAction)doneFb:(id)sender;

@end

@protocol FbViewControllerDelegate
- (void)fbViewControllerDidFinish:(FbViewController *)controller;

@end