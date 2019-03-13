//
//  SCJNViewController.m
//  LawViewer
//
//  Created by Othmar Gispert on 26/7/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "SCJNViewController.h"

@implementation SCJNViewController

@synthesize latitude;
@synthesize longitude;


- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = 19.431912;  
    theCoordinate.longitude = -99.131860;
    return theCoordinate; 
}

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)title
{
    return @"S. Corte de Justicia de la Nación";
}

- (NSString *)subtitle
{
    return @"Pino Suárez #2, Col. Centro, Del. Cuauhtémoc";
}

@end
