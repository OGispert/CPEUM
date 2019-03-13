//
//  OverlayViewController.h
//  LawViewer
//
//  Created by iMac on 22/08/12.
//  Copyright (c) 2012 Gispert Media Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BuscadorViewController;
@interface OverlayViewController : UIViewController {
    BuscadorViewController *bvController;
}
@property (nonatomic, retain) BuscadorViewController *bvController;

@end
