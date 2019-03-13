//
//  BuscadorViewController.h
//  LawViewer
//
//  Created by iMac-Iván on 17/08/12.
//  Copyright (c) 2012 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ArticleViewController.h"

//@class ArticleViewController;
@class OverlayViewController;
@interface BuscadorViewController : UITableViewController {
    NSArray *contenidoVacio;
    //ArticleViewController *articleViewController;
    
    NSMutableArray *listOfItems;        NSMutableArray *listOfItems2; NSMutableArray *listOfItems3Titles;
    NSMutableArray *copyListOfItems;    NSMutableArray *copyListOfItems3Titles;
    IBOutlet UISearchBar *searchBar;
    BOOL searching;
    BOOL letUserSelectRow;
    OverlayViewController *ovController; // !
    NSString *textForSearchBarHere;
}
@property (nonatomic, retain) NSArray *contenidoVacio;
//@property (nonatomic, retain) ArticleViewController *articleViewController;

@property (nonatomic, retain) NSString *textForSearchBarHere;

- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;
@end
