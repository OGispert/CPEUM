//
//  WebViewController.m
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 5/23/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

@synthesize gmgWebView;
@synthesize activityIndicator;
@synthesize delegate=_delegate;

- (void)dealloc
{
    gmgWebView.delegate = nil;
	[gmgWebView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [gmgWebView release];
    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [gmgWebView addSubview:activityIndicator];
    
    [gmgWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.gispertmediagroup.com"]]];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(tick) userInfo:nil repeats:YES];
	
    [super viewDidLoad];
}

- (void)tick{
    if (!gmgWebView.loading)
        [activityIndicator stopAnimating];
    else
        [activityIndicator startAnimating];
}

- (void)viewDidUnload
{
    self.delegate = nil;
    self.gmgWebView = nil;
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


- (IBAction)doneGMG:(id)sender
{
    [self.delegate webViewControllerDidFinish:self];
}

@end