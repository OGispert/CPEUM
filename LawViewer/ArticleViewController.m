//
//  ArticleViewController.m
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 4/28/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "ArticleViewController.h"
    #import "RootViewController.h"

@implementation ArticleViewController

@synthesize Article;
@synthesize textSelected;
@synthesize textForSearchBar;
@synthesize myIndicator;

- (void)dealloc
{
    [textSelected release];
    [Article release];
    
    [textForSearchBar release];
    [myIndicator release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}
#pragma mark - View lifecycle
/* Search A string inside UIWebView with the use of the javascript function */
- (NSInteger)highlightAllOccurencesOfString:(NSString*)str
{
    // The JS File                                                  //EYE//
    NSString *filePath  = [[NSBundle mainBundle] pathForResource:@"UIWebViewSearch2" ofType:@"js" inDirectory:@""];
    NSData *fileData    = [NSData dataWithContentsOfFile:filePath];
    NSString *jsString  = [[NSMutableString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
    [Article stringByEvaluatingJavaScriptFromString:jsString];
    [jsString release];
    
    // The JS Function
    NSString *startSearch   = [NSString stringWithFormat:@"uiWebview_HighlightAllOccurencesOfString('%@')",str];
    [Article stringByEvaluatingJavaScriptFromString:startSearch];
    
    // Search Occurence Count, uiWebview_SearchResultCount - is a javascript var
    NSString *result = [Article stringByEvaluatingJavaScriptFromString:@"uiWebview_SearchResultCount"];
    return [result integerValue];
}
/* Removes all highlighted string searched before */
- (void)removeAllHighlights
{
    // calls the javascript function to remove html highlights
    [Article stringByEvaluatingJavaScriptFromString:@"uiWebview_RemoveAllHighlights()"];
}
#pragma mark - UISearchBarDelegate
int resultCount2;
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self removeAllHighlights];
    
    self.navigationItem.hidesBackButton=YES; self.navigationItem.rightBarButtonItem.enabled=NO; //self.searchDisplayController.searchBar.scopeButtonTitles = nil;
    [myIndicator startAnimating];
    
    int resultCount = [self highlightAllOccurencesOfString:searchBar.text];
    // If no occurences of string, show alert message
    if (resultCount <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"¡No Encontrado!"
                                                        message:[NSString stringWithFormat:@"Intente revisar la puntuación del término:%@",searchBar.text]
                                                       delegate:nil
                                              cancelButtonTitle:@"Acepto"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        [myIndicator stopAnimating];
        self.navigationItem.hidesBackButton=NO; self.navigationItem.rightBarButtonItem.enabled=YES;// !!
    }
    if (resultCount > 0) {
        [self performSelector:@selector(doTHis2) withObject:nil afterDelay:0.5]; //segundos hasta mostrar Alerta
    }
    resultCount2=resultCount;
    
    [searchBar resignFirstResponder]; // remove keyboard
}
-(void)doTHis2 {
    [myIndicator stopAnimating];
    if (resultCount2==1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"¡Encontrado!"
            message:[NSString stringWithFormat:@"El término '%@' obtuvo %d coincidencia, utilice las flechas de la barra superior para desplazarse al resultado",searchBarDet.text,resultCount2]
            delegate:nil
            cancelButtonTitle:@"Ok"
            otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    if(resultCount2>1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"¡Encontrado!"
        message:[NSString stringWithFormat:@"El término '%@' obtuvo %d coincidencias, utilice las flechas de la barra superior para desplazarse de un resultado a otro",searchBarDet.text,resultCount2]
            delegate:nil
            cancelButtonTitle:@"Ok"
            otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    self.navigationItem.hidesBackButton=NO; self.navigationItem.rightBarButtonItem.enabled=YES;// !!
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
//#pragma mark - View lifecycle
- (void)viewDidLoad
{
    //[Article setText:[self textSelected]];
    //self.title = @"";
    
    //[super viewDidLoad];
}
-(void)doTHis{
    searchBarDet.delegate = self;
    searchBarDet.text = textForSearchBar;//self.search;
    [self searchBarSearchButtonClicked:searchBarDet];
    self.navigationItem.hidesBackButton=NO; self.navigationItem.rightBarButtonItem.enabled=YES;// !!
}
//Se cambian las funciones de javascript (scrollToDesiredHeight/Back) Debido al tipo de archivo que se maneja aqui (.txt)
//////////// Button Next ///////////////
- (void)sigButtonClicked{
    //NSString * js = @"uiWebview_SearchResultCount++;";
    NSString *js = [NSString stringWithFormat:@"scrollToDesiredHeightBack()"];
    [Article stringByEvaluatingJavaScriptFromString:js];
}
//////////// Button Back ///////////////
- (void)backButtonClicked{
    
    NSString *js = [NSString stringWithFormat:@"scrollToDesiredHeight()"];
    [Article stringByEvaluatingJavaScriptFromString:js];
}

- (void)sendButtonClicked{
    
    NSString *artString = [Article stringByEvaluatingJavaScriptFromString:@"document.body.innerText"];
    
    UIActivityViewController * avc = [[UIActivityViewController alloc] initWithActivityItems:@[artString] applicationActivities:nil];
    
    [self presentViewController:avc animated:YES completion:nil];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:[NSString stringWithFormat:@"Error %@", [error description]]
                                                       delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    //[super viewWillAppear:animated];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
    {
        CGRect frame = CGRectMake(0, 0, 400, 44);
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont boldSystemFontOfSize:20.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor lightGrayColor];
        label.text = self.navigationItem.title;
        label.text = textSelected;
        // emboss so that the label looks OK
        [label setShadowColor:[UIColor darkGrayColor]];
        [label setShadowOffset:CGSizeMake(0, -0.5)];
        self.navigationItem.titleView = label;
    }
    else
    {
        self.title =textSelected;
    }
    
    UIToolbar* tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 110, 45)];
    
    NSMutableArray* buttons = [[NSMutableArray alloc] initWithCapacity:3];
    /////////Jumpers /////////
    UIImage *buscaback = [UIImage imageNamed:@"back.png"];
    UIBarButtonItem *buscaButtonback = [[UIBarButtonItem alloc] initWithImage:buscaback style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked)];
    [buttons addObject:buscaButtonback];
    [buscaButtonback release];
    
    buscaButtonback = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [buttons addObject:buscaButtonback];
    [buscaButtonback release];
    
    UIImage *busca = [UIImage imageNamed:@"next.png"];
    UIBarButtonItem *buscaButton = [[UIBarButtonItem alloc] initWithImage:busca style:UIBarButtonItemStylePlain target:self action:@selector(sigButtonClicked)];
    [buttons addObject:buscaButton];
    [buscaButton release];
    /////////Jumpers ///////
    
    UIBarButtonItem *sendButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(sendButtonClicked)];
    [buttons addObject:sendButton];
    [sendButton release];
    
    [tools setItems:buttons animated:NO];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tools];
    [tools release];
    [buttons release];
    //self.navigationItem.rightBarButtonItem = sendButton;
    
    Article = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 109.0, self.view.bounds.size.width,self.view.bounds.size.height-140)];
    Article.backgroundColor = [UIColor whiteColor];
    Article.scalesPageToFit = YES;
    Article.multipleTouchEnabled = YES;
    Article.clipsToBounds = YES;
    //[Article setCenter:CGPointMake(160.0, 280.0+30.0)];
    Article.autoresizesSubviews= YES;
    Article.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
    [self.view addSubview:Article];
    
    NSURL *fileURL;
    fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:textSelected ofType:@"txt"]];//nil
    [Article loadRequest:[NSURLRequest requestWithURL:fileURL]];
    
    

    //myIndicator.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);//(160,180->240)
    searchBarDet.placeholder = @"Buscar en este Artículo";
    myIndicator.color=[UIColor blueColor];
	myIndicator.hidesWhenStopped = YES;
    myIndicator.center=self.view.center;//myIndicator.center=CGPointMake (self.view.bounds.size.width * 0.5F, self.view.bounds.size.height * 0.8F);
    [self.view addSubview:myIndicator];
    
    if([textForSearchBar length]>0){
        self.navigationItem.hidesBackButton=YES; self.navigationItem.rightBarButtonItem.enabled=NO;
        [myIndicator startAnimating];
        [self performSelector:@selector(doTHis) withObject:nil afterDelay:1.5]; //segundos hasta la carga del documento
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
   self.Article = nil;
    
    [Article release];//vin
    
    [self setMyIndicator:nil];
    [textForSearchBar release]; textForSearchBar=nil;
    NSLog(@"ViewDid Unload -Article");
}

//> iOS 6.0
-(BOOL)shouldAutorotate
{
    return YES;
}

//< iOS 5.0
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


@end