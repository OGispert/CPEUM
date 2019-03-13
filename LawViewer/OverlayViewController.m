//
//  OverlayViewController.m
//  LawViewer
//
//  Created by iMac on 22/08/12.
//  Copyright (c) 2012 Gispert Media Group. All rights reserved.
//

#import "OverlayViewController.h"
#import "BuscadorViewController.h"

@interface OverlayViewController ()

@end

@implementation OverlayViewController
@synthesize bvController;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[bvController doneSearching_Clicked:nil];
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 // Do any additional setup after loading the view from its nib.
 }
 - (void)viewDidUnload
 {
 [super viewDidUnload];
 // Release any retained subviews of the main view.
 // e.g. self.myOutlet = nil;
 }*/
@end

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end */
