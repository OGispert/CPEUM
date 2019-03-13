//
//  MapViewController.h
//  LawViewer
//
//  Created by Othmar Gispert on 26/7/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@protocol MapViewControllerDelegate;

@interface MapViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView *mapView;
    NSMutableArray *mapAnnotations;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, assign) id <MapViewControllerDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;

+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;

- (IBAction)SCJNAction:(id)sender;
- (IBAction)PJFAction:(id)sender;
- (IBAction)TSJDFAction:(id)sender;
- (IBAction)JFDFAction:(id)sender;
- (IBAction)JPenalDFAction:(id)sender;
- (IBAction)allAction:(id)sender;
- (IBAction)doneMap:(id)sender;

@end

@protocol MapViewControllerDelegate
- (void)mapViewControllerDidFinish:(MapViewController *)controller;

@end