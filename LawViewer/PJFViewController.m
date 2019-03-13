//
//  PJFViewController.m
//  LawViewer
//
//  Created by Othmar Gispert on 2/8/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "PJFViewController.h"

@implementation PJFViewController

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = 19.427906; 
    theCoordinate.longitude = -99.115412;
    return theCoordinate; 
}

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)title
{
    return @"Palacio de Justicia Federal";
}

- (NSString *)subtitle
{
    return @"Av. Eduardo Molina, Col. El Parque, Del. Ven. Carranza";
}

@end