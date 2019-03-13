//
//  FlipsideViewController.m
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 6/27/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "FlipsideViewController.h"
#import "WebViewController.h"
#import "IlegisViewController.h"
#import "GmgViewController.h"
#import "FbViewController.h"

@implementation FlipsideViewController

@synthesize delegate=_delegate;
@synthesize contactInfo;

- (void)dealloc
{
    [contactInfo release]; contactInfo = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.1];
    
    NSArray *contactF = [[NSArray alloc] initWithObjects:@"/GispertMG", nil];
    
    NSArray *contactT = [[NSArray alloc] initWithObjects:@"@GispertMG", nil];
    
    NSArray *contactT2 = [[NSArray alloc] initWithObjects:@"@iLegis_Apps", nil];
    
    NSArray *contactM = [[NSArray alloc] initWithObjects:@"E-Mail", nil];
    
    NSMutableArray *contacts = [[NSMutableArray alloc] initWithObjects:contactF, contactT, contactT2, contactM, nil];
    
    [self setContactInfo:contacts];
    [contacts release], contacts = nil;
    [contactF release], contactF = nil;
    [contactT release], contactT = nil;
    [contactT2 release], contactT2 = nil;
    [contactM release], contactM = nil;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.delegate = nil;
    self.contactInfo = nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger sections = [[self contactInfo] count];
    return sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionContents = [[self contactInfo] objectAtIndex:section];
    NSInteger rows = [sectionContents count];
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSArray *sectionContents = [[self contactInfo] objectAtIndex:[indexPath section]];
    NSString *contentForThisRow = [sectionContents objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:contentForThisRow];
    
    if (indexPath.section == 0) {
        UIImage *cellImage = [UIImage imageNamed:@"Logo-facebook.png"];
        cell.imageView.image = cellImage;
    }
    else if (indexPath.section == 1) {
        UIImage *cellImage = [UIImage imageNamed:@"Logo-twitter.png"];
        cell.imageView.image = cellImage;
    }
    else if (indexPath.section == 2) {
        UIImage *cellImage = [UIImage imageNamed:@"Logo-twitter.png"];
        cell.imageView.image = cellImage;
    }
    else if (indexPath.section == 3) {
        UIImage *cellImage = [UIImage imageNamed:@"Logo-mail.png"];
        cell.imageView.image = cellImage;
    }
    
    return cell;
}

#pragma mark - Actions

- (void)webViewControllerDidFinish:(WebViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)fbViewControllerDidFinish:(FbViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)gmgViewControllerDidFinish:(GmgViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)ilegisViewControllerDidFinish:(IlegisViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *sectionContents = [[self contactInfo] objectAtIndex:[indexPath section]];
    NSString *contentForThisRow = [sectionContents objectAtIndex:[indexPath row]];
    
    if ([contentForThisRow isEqualToString:@"/GispertMG"]) {
        FbViewController *controller = [[FbViewController alloc] initWithNibName:@"FbViewController" bundle:nil];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:controller animated:YES completion:nil];
        [controller release];}
    else if ([contentForThisRow isEqualToString:@"@GispertMG"]) {
        GmgViewController *controller = [[GmgViewController alloc] initWithNibName:@"GmgViewController" bundle:nil];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:controller animated:YES completion:nil];
        [controller release];}
    else if ([contentForThisRow isEqualToString:@"@iLegis_Apps"]) {
        IlegisViewController *controller = [[IlegisViewController alloc] initWithNibName:@"ilegisViewController" bundle:nil];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:controller animated:YES completion:nil];
        [controller release];}
    else if ([contentForThisRow isEqualToString:@"E-Mail"]) {
        MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
        [composer setMailComposeDelegate:self];
        if ([MFMailComposeViewController canSendMail]) {
            [composer setToRecipients:[NSArray arrayWithObjects:@"iLegis@gispertmediagroup.com", nil]];
            [composer setSubject:@"Constitución MX"];
            [composer setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
            [self presentViewController:composer animated:YES completion:nil];
            [composer release];}
        else
            [composer release];}
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:[NSString stringWithFormat:@"Error %@", [error description]]
                                                       delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
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


- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)goGMG:(id)sender
{
    WebViewController *controller = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:controller animated:YES completion:nil];
    [controller release];
}

@end