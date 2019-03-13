//
//  GmgViewController.m
//  OperacionesDeCredito
//
//  Created by Othmar Gispert on 6/10/11.
//  Copyright (c) 2011 Gispert Media Group. All rights reserved.
//

#import "GmgViewController.h"

@implementation GmgViewController

@synthesize gispertWebView;
@synthesize activityIndicator;
@synthesize delegate=_delegate;

- (void)dealloc
{
    gispertWebView.delegate = nil;
	[gispertWebView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [gispertWebView release];
    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [gispertWebView addSubview:activityIndicator];
    
    [gispertWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.twitter.com/GispertMG"]]];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(tick) userInfo:nil repeats:YES];
	
    [super viewDidLoad];
}

- (void)tick{
    if (!gispertWebView.loading)
        [activityIndicator stopAnimating];
    else
        [activityIndicator startAnimating];
}

- (void)viewDidUnload
{
    self.delegate = nil;
    self.gispertWebView = nil;
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


- (IBAction)doneGispert:(id)sender
{
    [self.delegate gmgViewControllerDidFinish:self];
}

@end