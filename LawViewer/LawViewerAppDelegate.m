//
//  LawViewerAppDelegate.m
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 4/19/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "LawViewerAppDelegate.h"

@implementation LawViewerAppDelegate

@synthesize window=_window;
@synthesize navigationController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    sleep(2);
    
    [Appirater setAppId:@"447396826"];
    [Appirater setDaysUntilPrompt:7];
    [Appirater setUsesUntilPrompt:5];
    [Appirater setSignificantEventsUntilPrompt:-1];
    [Appirater setTimeBeforeReminding:3];
    [Appirater setDebug:NO];
    [Appirater appLaunched:YES];
    
    [self.window setRootViewController:navigationController]; //Allows Rotation
    
    [self.window addSubview:[navigationController view]];
    [self.window makeKeyAndVisible];
    
    [Appirater appLaunched:YES];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}

- (void)dealloc
{
    [_window release];
    [navigationController release];
    [super dealloc];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [Appirater appEnteredForeground:YES];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MeVoyABackground" object:nil];
}

@end