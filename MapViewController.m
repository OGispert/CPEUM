//
//  MapViewController.m
//  LawViewer
//
//  Created by Othmar Gispert on 26/7/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "MapViewController.h"
#import "SCJNViewController.h"
#import "PJFViewController.h"
#import "TSJDFViewController.h"
#import "JFDFViewController.h"
#import "JPenalDFViewController.h"

enum
{
    kSCJNAnnotationIndex = 0,
    KPJFAnnotationIndex,
    KTSJDFAnnotationIntex,
    kJFDFAnnotationIndex,
    KJPenalDFAnnotationIndex
};

@implementation MapViewController
@synthesize mapView;
@synthesize mapAnnotations;
@synthesize delegate=_delegate;

#pragma mark -

+ (CGFloat)annotationPadding;
{
    return 10.0f;
}
+ (CGFloat)calloutHeight;
{
    return 40.0f;
}

- (void)gotoLocation
{
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 19.498438; 
    newRegion.center.longitude = -99.113891;
    newRegion.span.latitudeDelta = 0.122872;
    newRegion.span.longitudeDelta = 0.119863;
    
    [self.mapView setRegion:newRegion animated:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    
    [self.navigationController setToolbarHidden:NO animated:NO];
    
    self.mapView.mapType = MKMapTypeHybrid;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.mapType = MKMapTypeHybrid;
    
    self.mapAnnotations = [[NSMutableArray alloc] initWithCapacity:5];
    
    SCJNViewController *SCJNAnnotation = [[SCJNViewController alloc] init];
    [self.mapAnnotations insertObject:SCJNAnnotation atIndex:kSCJNAnnotationIndex];
    [SCJNAnnotation release]; SCJNAnnotation = nil;
    
    PJFViewController *PJFAnnotation = [[PJFViewController alloc] init];
    [self.mapAnnotations insertObject:PJFAnnotation atIndex:KPJFAnnotationIndex];
    [PJFAnnotation release]; PJFAnnotation = nil;
    
    TSJDFViewController *TSJFDAnnotation = [[TSJDFViewController alloc] init];
    [self.mapAnnotations insertObject:TSJFDAnnotation atIndex:KTSJDFAnnotationIntex];
    [TSJFDAnnotation release]; TSJFDAnnotation = nil;
    
    JFDFViewController *JFDFAnnotation = [[JFDFViewController alloc] init];
    [self.mapAnnotations insertObject:JFDFAnnotation atIndex:kJFDFAnnotationIndex];
    [JFDFAnnotation release]; JFDFAnnotation = nil;
    
    JPenalDFViewController *JPenalDFAnnotation = [[JPenalDFViewController alloc] init];
    [self.mapAnnotations insertObject:JPenalDFAnnotation atIndex:KJPenalDFAnnotationIndex];
    [JPenalDFAnnotation release]; JPenalDFAnnotation = nil;
    
    [self gotoLocation];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [mapAnnotations release]; mapAnnotations = nil;
    [mapView release]; mapView = nil;
}

- (void)dealloc 
{
    [mapView release];
    [mapAnnotations release];
    [super dealloc];
}


#pragma mark -
#pragma mark ButtonActions

- (IBAction)SCJNAction:(id)sender
{
    [self gotoLocation];
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotation:[self.mapAnnotations objectAtIndex:kSCJNAnnotationIndex]];
}

- (IBAction)PJFAction:(id)sender
{
    [self gotoLocation];
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotation:[self.mapAnnotations objectAtIndex:KPJFAnnotationIndex]];
}

- (IBAction)TSJDFAction:(id)sender
{
    [self gotoLocation];
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotation:[self.mapAnnotations objectAtIndex:KTSJDFAnnotationIntex]];
}

- (IBAction)JFDFAction:(id)sender
{
    [self gotoLocation];
    [self.mapView removeAnnotations:self.mapView.annotations];  
    [self.mapView addAnnotation:[self.mapAnnotations objectAtIndex:kJFDFAnnotationIndex]];
}

- (IBAction)JPenalDFAction:(id)sender
{
    [self gotoLocation];
    [self.mapView removeAnnotations:self.mapView.annotations];      
    [self.mapView addAnnotation:[self.mapAnnotations objectAtIndex:KJPenalDFAnnotationIndex]];
}

- (IBAction)allAction:(id)sender
{
    [self gotoLocation];
    [self.mapView removeAnnotations:self.mapView.annotations];     
    [self.mapView addAnnotations:self.mapAnnotations];
}

#pragma mark -
#pragma mark MKMapViewDelegate


- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    if ([annotation isKindOfClass:[JFDFViewController class]])
    {
        static NSString* JSDFAnnotationIdentifier = @"JSDFAnnotationIdentifier";
        MKPinAnnotationView* pinView1 = (MKPinAnnotationView *)
        [mapView dequeueReusableAnnotationViewWithIdentifier:JSDFAnnotationIdentifier];
        if (!pinView1)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
                                                   initWithAnnotation:annotation reuseIdentifier:JSDFAnnotationIdentifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            return customPinView;
        }
        else
        {
            pinView1.annotation = annotation;
        }
        return pinView1;
    }
    else if ([annotation isKindOfClass:[SCJNViewController class]])  
    {
        static NSString* SCJNAnnotationIdentifier = @"SCJNAnnotationIdentifier";
        MKPinAnnotationView* pinView2 =
        (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:SCJNAnnotationIdentifier];
        if (!pinView2)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
                                                   initWithAnnotation:annotation reuseIdentifier:SCJNAnnotationIdentifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorPurple;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            return customPinView;
        }
        else
        {
            pinView2.annotation = annotation;
        }
        return pinView2;
    }
    else if ([annotation isKindOfClass:[TSJDFViewController class]])  
    {
        static NSString* TSJDFAnnotationIdentifier = @"TSJDFAnnotationIdentifier";
        MKPinAnnotationView* pinView3 =
        (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:TSJDFAnnotationIdentifier];
        if (!pinView3)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
                                                   initWithAnnotation:annotation reuseIdentifier:TSJDFAnnotationIdentifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorGreen;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            return customPinView;
        }
        else
        {
            pinView3.annotation = annotation;
        }
        return pinView3;
    }
    else if ([annotation isKindOfClass:[JPenalDFViewController class]])  
    {
        static NSString* JPenalDFAnnotationIdentifier = @"JPenalDFAnnotationIdentifier";
        MKPinAnnotationView* pinView4 =
        (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:JPenalDFAnnotationIdentifier];
        if (!pinView4)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
                                                   initWithAnnotation:annotation reuseIdentifier:JPenalDFAnnotationIdentifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorRed;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            return customPinView;
        }
        else
        {
            pinView4.annotation = annotation;
        }
        return pinView4;
    }
    else if ([annotation isKindOfClass:[PJFViewController class]])  
    {
        static NSString* PJFAnnotationIdentifier = @"PJFAnnotationIdentifier";
        MKPinAnnotationView* pinView5 =
        (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:PJFAnnotationIdentifier];
        if (!pinView5)
        {
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
                                                   initWithAnnotation:annotation reuseIdentifier:PJFAnnotationIdentifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorPurple;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            return customPinView;
        }
        else
        {
            pinView5.annotation = annotation;
        }
        return pinView5;
    }
    return nil;
}

- (IBAction)doneMap:(id)sender
{
    [self.delegate mapViewControllerDidFinish:self];
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

@end