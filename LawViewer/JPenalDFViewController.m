//
//  JPenalDFViewController.m
//  LawViewer
//
//  Created by Othmar Gispert on 26/7/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "JPenalDFViewController.h"

@implementation JPenalDFViewController

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = 19.546586;
    theCoordinate.longitude = -99.148951;
    return theCoordinate; 
}

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)title
{
    return @"Juzgados Penales del D.F.";
}

- (NSString *)subtitle
{
    return @"Jaime Nunó #205, Col. Cuautepec Barrio Bajo, Del. GAM";
}

@end