//
//  TSJDFViewController.m
//  LawViewer
//
//  Created by Othmar Gispert on 26/7/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "TSJDFViewController.h"

@implementation TSJDFViewController

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = 19.421268;
    theCoordinate.longitude = -99.149616;
    return theCoordinate; 
}

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)title
{
    return @"T. Superior de Justicia del D.F.";
}

- (NSString *)subtitle
{
    return @"Niños Heroes #132, Col. Doctores, Del. Cuauhtémoc";
}

@end
