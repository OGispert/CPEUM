//
//  SCJNViewController.h
//  LawViewer
//
//  Created by Othmar Gispert on 26/7/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface SCJNViewController : NSObject <MKAnnotation>
{
    NSNumber *latitude;
    NSNumber *longitude;
}

@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;

@end