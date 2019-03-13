//
//  LeyesViewController.m
//  LawViewer
//
//  Created by Othmar Gispert Peláez on 4/19/11.
//  Copyright 2011 Gispert Media Group. All rights reserved.
//

#import "LeyesViewController.h"

@implementation LeyesViewController

@synthesize contenido;
@synthesize articleViewController;


- (void)dealloc {
    [contenido release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row%2 == 0) {
        UIColor *altCellColor = [UIColor colorWithWhite:0.7 alpha:0.1];
        cell.backgroundColor = altCellColor;
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
    {
    
        CGRect frame = CGRectMake(0, 0, 400, 44);
        UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
        label.backgroundColor = [UIColor clearColor];
        if ([self.title length]> 28) { //De la vivisión de poderres
        label.font = [UIFont boldSystemFontOfSize:16.0];
        }
        else
        {
        label.font = [UIFont boldSystemFontOfSize:20.0];
        }
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor lightGrayColor];
        label.text = self.navigationItem.title;
        //label.text = textSelected;
        // emboss so that the label looks OK
        [label setShadowColor:[UIColor darkGrayColor]];
        [label setShadowOffset:CGSizeMake(0, -0.5)];
        self.navigationItem.titleView = label;
        
        
    }
    else
    {
        //self.title =textSelected;
    }
    
    if ([self.title isEqualToString:@"Declaración"])
        contenido = [[NSArray alloc ] 
                 initWithObjects:@"Texto Vigente", nil];
    
    if ([self.title isEqualToString:@"I. De los Derechos Humanos y sus Garantías"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 1", @"Artículo 2", @"Artículo 3", @"Artículo 4", @"Artículo 5", @"Artículo 6", @"Artículo 7", @"Artículo 8", @"Artículo 9", @"Artículo 10", @"Artículo 11", @"Artículo 12", @"Artículo 13", @"Artículo 14", @"Artículo 15", @"Artículo 16", @"Artículo 17", @"Artículo 18", @"Artículo 19", @"Artículo 20", @"Artículo 21", @"Artículo 22", @"Artículo 23", @"Artículo 24", @"Artículo 25", @"Artículo 26", @"Artículo 27", @"Artículo 28", @"Artículo 29", nil];
    
    if ([self.title isEqualToString:@"II. De los Mexicanos"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 30", @"Artículo 31", @"Artículo 32", nil];
    
    if ([self.title isEqualToString:@"III. De los Extranjeros"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 33", nil];
    
    if ([self.title isEqualToString:@"IV. De los Ciudadanos Mexicanos"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 34", @"Artículo 35", @"Artículo 36", @"Artículo 37", @"Artículo 38", nil];
    
    if ([self.title isEqualToString:@"I. De la Soberanía Nacional y de la Forma de Gobierno"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 39", @"Artículo 40", @"Artículo 41", nil];
    
    if ([self.title isEqualToString:@"II. De las Partes Integrantes de la Federación y del Territorio Nacional"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 42", @"Artículo 43", @"Artículo 44", @"Artículo 45", @"Artículo 46", @"Artículo 47", @"Artículo 48", nil];
    
    if ([self.title isEqualToString:@"I. De la División de Poderes"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 49", nil];
    
    if ([self.title isEqualToString:@"II. Del Poder Legislativo"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 50", nil];
    
    if ([self.title isEqualToString:@"II.I. De la Elección e Instalación del Congreso"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 51", @"Artículo 52", @"Artículo 53", @"Artículo 54", @"Artículo 55", @"Artículo 56", @"Artículo 57", @"Artículo 58", @"Artículo 59", @"Artículo 60", @"Artículo 61", @"Artículo 62", @"Artículo 63", @"Artículo 64", @"Artículo 65", @"Artículo 66", @"Artículo 67", @"Artículo 68", @"Artículo 69", @"Artículo 70", nil];
    
    if ([self.title isEqualToString:@"II.II. De la Iniciativa y Formación de las Leyes"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 71", @"Artículo 72", nil];
    
    if ([self.title isEqualToString:@"II.III. De las Facultades del Congreso"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 73", @"Artículo 74", @"Artículo 75", @"Artículo 76", @"Artículo 77", nil];
    
    if ([self.title isEqualToString:@"II.IV. De la Comisión Permanente"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 78", nil];
    
    if ([self.title isEqualToString:@"II.V. De la Fiscalización Superior de la Federación"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 79", nil];
    
    if ([self.title isEqualToString:@"III. Del Poder Ejecutivo"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 80", @"Artículo 81", @"Artículo 82", @"Artículo 83", @"Artículo 84", @"Artículo 85", @"Artículo 86", @"Artículo 87", @"Artículo 88", @"Artículo 89", @"Artículo 90", @"Artículo 91", @"Artículo 92", @"Artículo 93", nil];
    
    if ([self.title isEqualToString:@"IV. Del Poder Judicial"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 94", @"Artículo 95", @"Artículo 96", @"Artículo 97", @"Artículo 98", @"Artículo 99", @"Artículo 100", @"Artículo 101", @"Artículo 102", @"Artículo 103", @"Artículo 104", @"Artículo 105", @"Artículo 106", @"Artículo 107", nil];
    
    if ([self.title isEqualToString:@"De las Responsabilidades de los Servidores Públicos, Particulares Vinculados con faltas administrativas graves o hechos de Corrupción, y Patrimonial del Estado"])
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 108", @"Artículo 109", @"Artículo 110", @"Artículo 111", @"Artículo 112", @"Artículo 113", @"Artículo 114", nil];
    
    if ([self.title isEqualToString:@"De los Estados de la Federación y del Distrito Federal"])
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 115", @"Artículo 116", @"Artículo 117", @"Artículo 118", @"Artículo 119", @"Artículo 120", @"Artículo 121", @"Artículo 122", nil];
    
    if ([self.title isEqualToString:@"Del Trabajo y de la Previsión Social"])
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 123", nil];
    
    if ([self.title isEqualToString:@"Prevenciones Generales"])
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 124", @"Artículo 125", @"Artículo 126", @"Artículo 127", @"Artículo 128", @"Artículo 129", @"Artículo 130", @"Artículo 131", @"Artículo 132", @"Artículo 133", @"Artículo 134", nil];
    
    if ([self.title isEqualToString:@"De las Reformas de la Constitución"])
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 135", nil];
    
    if ([self.title isEqualToString:@"De la Inviolabilidad de la Constitución"])
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo 136", nil];
    
    if ([self.title isEqualToString:@"Artículos Transitorios"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"Artículo Primero", @"Artículo Segundo", @"Artículo Tercero", @"Artículo Cuarto", @"Artículo Quinto", @"Artículo Sexto", @"Artículo Séptimo", @"Artículo Octavo", @"Artículo Noveno", @"Artículo Décimo", @"Artículo Decimoprimero", @"Artículo Decimosegundo", @"Artículo Decimotercero", @"Artículo Decimocuarto", @"Artículo Decimoquinto", @"Artículo Decimosexto", @"Artículo Decimoséptimo", @"Artículo Decimoctavo", @"Artículo Decimonoveno", @"Firmas", nil];
    
    if ([self.title isEqualToString:@"Decretos de Reforma"]) 
        contenido = [[NSArray alloc ] 
                    initWithObjects:@"29 de enero de 2016", @"27 de enero de 2016", @"10 de julio de 2015", @"2 de julio de 2015", @"27 de mayo de 2015", @"26 de mayo de 2015", @"22 de mayo de 2015", @"7 de julio de 2014", @"17 de junio de 2014 (1)", @"17 de junio de 2014 (2)", @"17 de junio de 2014 (3)", @"10 de febrero de 2014", @"7 de febrero de 2014", @"27 de diciembre de 2013", @"20 de diciembre de 2013", @"8 de octubre de 2013", @"30 de septiembre de 2013", @"19 de julio de 2013", @"11 de junio de 2013", @"26 de febrero de 2013", @"30 de noviembre de 2012", @"15 de octubre de 2012", @"9 de agosto de 2012", @"9 de febrero de 2012", @"8 de febrero de 2012", @"12 de octubre de 2011-2", @"12 de octubre de 2011", @"17 de agosto de 2011", @"14 de julio de 2011", @"10 de junio de 2011", @"6 de junio de 2011", @"13 de abril de 2011", @"29 de julio de 2010", @"27 de abril de 2010", @"24 de agosto de 2009", @"14 de agosto de 2009", @"25 de junio de 2009", @"1 de junio de 2009", @"4 de mayo de 2009", @"30 de abril de 2009-2", @"30 de abril de 2009", @"26 de septiembre de 2008", @"29 de agosto de 2008", @"15 de agosto de 2008", @"18 de junio de 2008", @"7 de mayo de 2008", @"13 de noviembre de 2007", @"27 de septiembre de 2007", @"15 de agosto de 2007", @"2 de agosto de 2007", @"20 de julio de 2007-2", @"20 de julio de 2007", @"19 de junio de 2007-2", @"19 de junio de 2007", @"12 de febrero de 2007", @"4 de diciembre de 2006-2", @"4 de diciembre de 2006", @"14 de septiembre de 2006", @"7 de abril de 2006", @"12 de diciembre de 2005", @"9 de diciembre de 2005", @"8 de diciembre de 2005", @"28 de noviembre de 2005", @"20 de junio de 2005", @"27 de septiembre de 2004", @"2 de agosto de 2004", @"30 de julio de 2004", @"22 de julio de 2004", @"5 de abril de 2004", @"12 de noviembre de 2002", @"14 de junio de 2002", @"14 de agosto de 2001", @"21 de septiembre de 2000-2", @"21 de septiembre de 2000", @"7 de abril de 2000", @"23 de diciembre de 1999", @"13 de septiembre de 1999", @"30 de julio de 1999", @"29 de julio de 1999", @"28 de junio de 1999", @"11 de junio de 1999", @"26 de febrero de 1999", @"20 de marzo de 1997", @"22 de agosto de 1996", @"25 de octubre de 1993", @"3 de septiembre de 1993", nil];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //NSLog(@"WillDisappear:%@",[contenido objectAtIndex:0]);
}

- (void)viewDidUnload {
    
    self.contenido = nil;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
        
#pragma mark - Table view data source
        
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
            return 1;
        }
     
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [contenido count];
    }

- (UITableViewCell *)tableView:(UITableView *)tableView 
    cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView 
                                 dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] 
                     initWithStyle:UITableViewCellStyleDefault
                     reuseIdentifier:CellIdentifier] autorelease];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }
        cell.textLabel.text = [contenido objectAtIndex: 
                               [indexPath row]];
        return cell;
    }
        
#pragma mark - Table view delegate
        
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (self.articleViewController == nil)
    {        
    ArticleViewController *text = [[ArticleViewController alloc] 
                                            initWithNibName:@"ArticleViewController" 
                                            bundle:[NSBundle mainBundle]];
        //NSLog(@"didSelect:%@",[contenido objectAtIndex:indexPath.row]); Lo hace sólo una vez :(
                
    self.articleViewController = text;
    [text release];
    }    
    self.articleViewController.textSelected = [contenido objectAtIndex: 
                            [indexPath row]];
        
    [self.navigationController pushViewController: self.articleViewController animated:YES];
    
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