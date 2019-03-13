//
//  ArticleViewController.h
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 4/28/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>


@interface ArticleViewController : UIViewController <MFMailComposeViewControllerDelegate,UISearchBarDelegate>
{
    IBOutlet UIWebView *Article;
    NSString *textSelected;
    
    NSString *textForSearchBar;
    IBOutlet UISearchBar *searchBarDet;
}

@property (nonatomic, retain) UIWebView *Article;
@property (nonatomic, retain) NSString *textSelected;

@property (nonatomic, retain) NSString *textForSearchBar;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *myIndicator;

- (NSInteger)highlightAllOccurencesOfString:(NSString*)str;
- (void)removeAllHighlights;
@end