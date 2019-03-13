//
//  FbViewController.m
//  OperacionesDeCredito
//
//  Created by Othmar Gispert on 6/10/11.
//  Copyright (c) 2011 Gispert Media Group. All rights reserved.
//

#import "FbViewController.h"

@implementation FbViewController

@synthesize FbWebView;
@synthesize activityIndicator;
@synthesize delegate=_delegate;

- (void)dealloc
{
    FbWebView.delegate = nil;
	[FbWebView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [FbWebView release];
    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [FbWebView addSubview:activityIndicator];
    
    [FbWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.facebook.com/GispertMG"]]];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(tick) userInfo:nil repeats:YES];
	
    [super viewDidLoad];
}

- (void)tick{
    if (!FbWebView.loading)
        [activityIndicator stopAnimating];
    else
        [activityIndicator startAnimating];
}

- (void)viewDidUnload
{
    self.delegate = nil;
    self.FbWebView = nil;
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


- (IBAction)doneFb:(id)sender
{
    [self.delegate fbViewControllerDidFinish:self];
}

@end