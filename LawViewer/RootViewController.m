//
//  RootViewController.m
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 4/19/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "RootViewController.h"
#import "LeyesViewController.h"
#import "BuscadorViewController.h"

#define CONST_Cell_height 44.0f
#define CONST_Cell_width 270.0f
#define CONST_textLabelFontSize     17
#define CONST_detailLabelFontSize   15

static UIFont *subFont;
static UIFont *titleFont;

@implementation RootViewController

@synthesize cpeum;
@synthesize leyesController;
@synthesize detailText;


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)reminderViewControllerDidFinish:(ReminderViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mapViewControllerDidFinish:(MapViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showContactInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
    
    [controller release];
}

- (IBAction)showReminder:(id)sender
{
    ReminderViewController *controller = [[ReminderViewController alloc] initWithNibName:@"ReminderViewController" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
    
    [controller release];
}

- (IBAction)showMaps:(id)sender
{    
    MapViewController *controller = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
    
    [controller release];
}

- (IBAction)showTweet:(id)sender
{
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeTwitter];
    [tweetSheet setInitialText:@"Tweet enviado desde mi app 'Constitución MX' de #iLegis"];
    [self presentViewController:tweetSheet animated:YES completion:nil];
    
}
- (IBAction)buscar:(id)sender
{
    BuscadorViewController *bvController = [[BuscadorViewController alloc] initWithNibName:@"BuscadorViewController" bundle:[NSBundle mainBundle]];
    
    //rvController.CurrentLevel += 1;//Increment the Current View
    
    //rvController.CurrentTitle = [dictionary objectForKey:@"Title"];//Set the title
    
    [self.navigationController pushViewController:bvController animated:YES];//Push the new table view on the stack
    
    //bvController.tableView =nil;
    
    [bvController release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSArray *title = [[NSArray alloc] initWithObjects:@"Declaración", nil];
    
    NSArray *titleI = [[NSArray alloc] initWithObjects:@"I. De los Derechos Humanos y sus Garantías", @"II. De los Mexicanos", @"III. De los Extranjeros", @"IV. De los Ciudadanos Mexicanos", nil];
    
    NSArray *titleII = [[NSArray alloc] initWithObjects:@"I. De la Soberanía Nacional y de la Forma de Gobierno", @"II. De las Partes Integrantes de la Federación y del Territorio Nacional", nil];
    
    NSArray *titleIII = [[NSArray alloc] initWithObjects:@"I. De la División de Poderes", @"II. Del Poder Legislativo", @"II.I. De la Elección e Instalación del Congreso", @"II.II. De la Iniciativa y Formación de las Leyes", @"II.III. De las Facultades del Congreso", @"II.IV. De la Comisión Permanente", @"II.V. De la Fiscalización Superior de la Federación", @"III. Del Poder Ejecutivo", @"IV. Del Poder Judicial", nil];
    
    NSArray *titleIV = [[NSArray alloc] initWithObjects:@"De las Responsabilidades de los Servidores Públicos, Particulares Vinculados con faltas administrativas graves o hechos de Corrupción, y Patrimonial del Estado", nil];
    
    NSArray *titleV = [[NSArray alloc] initWithObjects:@"De los Estados de la Federación y del Distrito Federal", nil];
    
    NSArray *titleVI = [[NSArray alloc] initWithObjects:@"Del Trabajo y de la Previsión Social", nil];
    
    NSArray *titleVII = [[NSArray alloc] initWithObjects:@"Prevenciones Generales", nil];
    
    NSArray *titleVIII = [[NSArray alloc] initWithObjects:@"De las Reformas de la Constitución", nil];
    
    NSArray *titleIX = [[NSArray alloc] initWithObjects:@"De la Inviolabilidad de la Constitución", nil];
    
    NSArray *transit = [[NSArray alloc] initWithObjects:@"Artículos Transitorios", @"Decretos de Reforma", nil];
    
    NSArray *detail = [[NSArray alloc] initWithObjects:@"", nil];//Buscador
    
    NSArray *detailI = [[NSArray alloc] initWithObjects:@"Artículos 1 - 29",  @"Artículos 30 - 32", @"Artículo 33", @"Artículos 34 - 38", nil];
    
    NSArray *detailII = [[NSArray alloc] initWithObjects:@"Artículos 39 - 41", @"Artículos 42 - 48", nil];
    
    NSArray *detailIII = [[NSArray alloc] initWithObjects:@"Artículo 49", @"Artículo 50", @"Artículos 51 - 70", @"Artículos 71 - 72", @"Artículos 73 - 77", @"Artículo 78", @"Artículo 79", @"Artículos 80 - 93", @"Artículos 94 - 107", nil];
    
    NSArray *detailIV = [[NSArray alloc] initWithObjects:@"Artículos 108 - 114", nil];
    
    NSArray *detailV = [[NSArray alloc] initWithObjects:@"Artículos 115 - 122", nil];
    
    NSArray *detailVI = [[NSArray alloc] initWithObjects:@"Artículo 123", nil];
    
    NSArray *detailVII = [[NSArray alloc] initWithObjects:@"Artículos 124 - 134", nil];
    
    NSArray *detailVIII = [[NSArray alloc] initWithObjects:@"Artículo 135", nil];
    
    NSArray *detailIX = [[NSArray alloc] initWithObjects:@"Artículo 136", nil];
    
    NSArray *detailTransit = [[NSArray alloc] initWithObjects:@"", @"", nil];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:title, titleI, titleII, titleIII, titleIV, titleV, titleVI, titleVII, titleVIII, titleIX, transit, nil];
    
    NSMutableArray *detailArray = [[NSMutableArray alloc] initWithObjects:detail, detailI, detailII, detailIII, detailIV, detailV, detailVI, detailVII, detailVIII, detailIX, detailTransit, nil];
    
    [self setCpeum:array];
    [self setDetailText:detailArray];
    [array release], array = nil;
    [detailArray release], detailArray = nil;
    [title release], title = nil;
    [titleI release], titleI = nil;
    [titleII release], titleII = nil;
    [titleIII release], titleIII = nil;
    [titleIV release], titleIV = nil;
    [titleV release], titleV = nil;
    [titleVI release], titleVI = nil;
    [titleVII release], titleVII = nil;
    [titleVIII release], titleVIII = nil;
    [titleIX release], titleIX = nil;
    [transit release], transit = nil;
    [detail release], detail = nil;
    [detailI release], detailI = nil;
    [detailII release], detailII = nil;
    [detailIII release], detailIII = nil;
    [detailIV release], detailIV = nil;
    [detailV release], detailV = nil;
    [detailVI release],detailVI = nil;
    [detailVII release], detailVII = nil;
    [detailVIII release], detailVIII = nil;
    [detailIX release], detailIX = nil;
    [detailTransit release], detailTransit = nil;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
    {
    CGRect frame = CGRectMake(0, 0, 400, 44);
    UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:18.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor lightGrayColor];
    label.text = self.navigationItem.title;
    label.text = @"CONSTITUCIÓN MX";
    // emboss so that the label looks OK
    [label setShadowColor:[UIColor darkGrayColor]];
    [label setShadowOffset:CGSizeMake(0, -0.5)];
    self.navigationItem.titleView = label;
    }
    else
    {
    self.title = @"CONSTITUCIÓN MX";
    }
    [self.tableView reloadData];
    
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Regresar" style:UIBarButtonItemStylePlain target:nil action:nil] autorelease];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger sections = [[self cpeum] count];
    return sections;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"";
    }
    else if (section == 1) {
        return @"Título Primero";
    }
    else if (section == 2) {
        return @"Título Segundo";
    }
    else if (section == 3) {
        return @"Título Tercero";
    }
    else if (section == 4) {
        return @"Título Cuarto";
    }
    else if (section == 5) {
        return @"Título Quinto";
    }
    else if (section == 6) {
        return @"Título Sexto";
    }
    else if (section == 7) {
        return @"Título Séptimo";
    }
    else if (section == 8) {
        return @"Título Octavo";
    }
    else if (section == 9) {
        return @"Título Noveno";
    }
    else if (section == 10) {
        return @"";
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    NSArray *sectionContents = [[self cpeum] objectAtIndex:section];
    NSInteger rows = [sectionContents count];
    return rows;
}

- (UIFont*) TitleFont;
{
    if (!titleFont) titleFont = [UIFont boldSystemFontOfSize:CONST_textLabelFontSize];
    return titleFont;
}

- (UIFont*) SubFont;
{
    if (!subFont) subFont = [UIFont systemFontOfSize:CONST_detailLabelFontSize];
    return subFont;
}

- (UITableViewCell*) CreateMultilinesCell :(NSString*)cellIdentifier
{
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                                    reuseIdentifier:cellIdentifier] autorelease];
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [self TitleFont];
    
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.font = [self SubFont];
    
    return cell;
}

- (int) heightOfCellWithTitle :(NSString*)titleText andSubtitle:(NSString*)subtitleText
{
    CGSize titleSize = {0, 0};
    CGSize subtitleSize = {0, 0};
    
    if (titleText && ![titleText isEqualToString:@""]) 
        titleSize = [titleText sizeWithFont:[self TitleFont] 
                          constrainedToSize:CGSizeMake(CONST_Cell_width, 4000) 
                              lineBreakMode:NSLineBreakByWordWrapping];
    
    if (subtitleText && ![subtitleText isEqualToString:@""]) 
        subtitleSize = [subtitleText sizeWithFont:[self SubFont] 
                                constrainedToSize:CGSizeMake(CONST_Cell_width, 4000) 
                                    lineBreakMode:NSLineBreakByWordWrapping];
    
    return titleSize.height + subtitleSize.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *sectionContents = [[self cpeum] objectAtIndex:[indexPath section]];
    NSString *contentForThisRow = [sectionContents objectAtIndex:[indexPath row]];
    
    NSArray *sectionDetails = [[self detailText] objectAtIndex:[indexPath section]];
    NSString *detailForThisRow = [sectionDetails objectAtIndex:[indexPath row]];
    
    int height = 10 + [self heightOfCellWithTitle:contentForThisRow andSubtitle:detailForThisRow];
    return (height < CONST_Cell_height ? CONST_Cell_height : height);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [self CreateMultilinesCell:CellIdentifier];
    }

    NSArray *sectionContents = [[self someArray] objectAtIndex:[indexPath section]];
    NSString *contentForThisRow = [sectionContents objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:contentForThisRow];
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *sectionContents = [[self cpeum] objectAtIndex:[indexPath section]];//Sección que se elige
    self.leyesController.title = [sectionContents objectAtIndex: indexPath.row];//Renglón de la sección que se elige
    [self.navigationController pushViewController:self.leyesController animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.detailText = nil;
    self.cpeum = nil;
}

- (void)dealloc
{
    [detailText release]; detailText = nil;
    [cpeum release]; cpeum = nil;
    [super dealloc];
}


- (IBAction)postToFacebook:(id)sender {
    mySLComposerSheet = [[SLComposeViewController alloc] init];
    mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [mySLComposerSheet setInitialText:@"Les comparto mi app de #iLegis. http://www.facebook.com/iLegis"];
    [self presentViewController:mySLComposerSheet animated:YES completion:nil];
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