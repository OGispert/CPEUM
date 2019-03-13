//
//  JFDFViewController.m
//  LawViewer
//
//  Created by Othmar Gispert on 26/7/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "JFDFViewController.h"

@implementation JFDFViewController

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = 19.433976; 
    theCoordinate.longitude = -99.143447;
    return theCoordinate; 
}

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)title
{
    return @"Juzgados Familiares del D.F.";
}

- (NSString *)subtitle
{
    return @"Av. Juárez #8, Col. Centro, Del. Cuauhtémoc";
}

@end
