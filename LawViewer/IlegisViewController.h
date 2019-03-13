//
//  IlegisViewController.h
//  OperacionesDeCredito
//
//  Created by Othmar Gispert on 6/10/11.
//  Copyright (c) 2011 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol IlegisViewControllerDelegate;

@interface IlegisViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate>
{
	IBOutlet UIWebView *ilegisWebView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    NSTimer *timer;
}

@property (nonatomic, retain) UIWebView	*ilegisWebView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, assign) id <IlegisViewControllerDelegate> delegate;

- (IBAction)doneIlegis:(id)sender;

@end

@protocol IlegisViewControllerDelegate
- (void)ilegisViewControllerDidFinish:(IlegisViewController *)controller;

@end