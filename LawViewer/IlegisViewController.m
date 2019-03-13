//
//  IlegisViewController.m
//  OperacionesDeCredito
//
//  Created by Othmar Gispert on 6/10/11.
//  Copyright (c) 2011 Gispert Media Group. All rights reserved.
//

#import "IlegisViewController.h"

@implementation IlegisViewController

@synthesize ilegisWebView;
@synthesize activityIndicator;
@synthesize delegate=_delegate;

- (void)dealloc
{
    ilegisWebView.delegate = nil;
	[ilegisWebView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [ilegisWebView release];
    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [ilegisWebView addSubview:activityIndicator];
    
    [ilegisWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.twitter.com/ilegis_apps"]]];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(tick) userInfo:nil repeats:YES];
	
    [super viewDidLoad];
}

- (void)tick{
    if (!ilegisWebView.loading)
        [activityIndicator stopAnimating];
    else
        [activityIndicator startAnimating];
}

- (void)viewDidUnload
{
    self.delegate = nil;
    self.ilegisWebView = nil;
    [super viewDidUnload];
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


- (IBAction)doneIlegis:(id)sender
{
    [self.delegate ilegisViewControllerDidFinish:self];
}

@end