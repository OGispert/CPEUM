//
//  WebViewController.h
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 5/23/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol WebViewControllerDelegate;

@interface WebViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate>
{
	IBOutlet UIWebView *gmgWebView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    NSTimer *timer;
}

@property (nonatomic, retain) UIWebView	*gmgWebView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, assign) id <WebViewControllerDelegate> delegate;

- (IBAction)doneGMG:(id)sender;

@end

@protocol WebViewControllerDelegate
- (void)webViewControllerDidFinish:(WebViewController *)controller;

@end