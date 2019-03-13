//
//  LawViewerAppDelegate.h
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 4/19/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//



/*
 Esta app, la primera desarrollada en Gispert Media Group, S.A. de C.V., está dedicada a las personas que día a día se esfuerzan por que ésta empresa salga adelante.
 
 Por ustedes Cecilia Gispert Castañeda y Yeni Ivett Peña Sánchez.
 
 Saben que son parte importante de mi vida.
 
 Othmar
 */




#import <UIKit/UIKit.h>

#import "RootViewController.h"
#import "Appirater.h"


@interface LawViewerAppDelegate : NSObject <UIApplicationDelegate> {
  
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;



@end