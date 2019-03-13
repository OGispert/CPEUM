//
//  LeyesViewController.h
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 4/19/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleViewController.h"

@class ArticleViewController;

@interface LeyesViewController : UITableViewController {
    NSArray *contenido;
    ArticleViewController *articleViewController;
    
}

@property (nonatomic, retain) NSArray *contenido;
@property (nonatomic, retain) ArticleViewController *articleViewController;

@end