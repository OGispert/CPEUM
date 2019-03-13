//
//  BuscadorViewController.m
//  LawViewer
//
//  Created by iMac-Iván on 17/08/12.
//  Copyright (c) 2012 Gispert Media Group. All rights reserved.
//

#import "BuscadorViewController.h"
#import "ArticleViewController.h"
#import "OverlayViewController.h"

@interface BuscadorViewController ()

@end

@implementation BuscadorViewController
@synthesize contenidoVacio;
//@synthesize articleViewController;
@synthesize textForSearchBarHere;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Buscar"; //viewWillAppear

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //      Initialize the array.
	listOfItems = [[NSMutableArray alloc] init]; // Identificadores de Archivos (.plist?), ALTA SENSIBILIDAD.
NSArray *itemsInArray = [NSArray arrayWithObjects:
@"Artículo 1", @"Artículo 2", @"Artículo 3", @"Artículo 4", @"Artículo 5", @"Artículo 6", @"Artículo 7", @"Artículo 8", @"Artículo 9", @"Artículo 10",
@"Artículo 11",@"Artículo 12",@"Artículo 13",@"Artículo 14",@"Artículo 15",@"Artículo 16",@"Artículo 17",@"Artículo 18",@"Artículo 19",@"Artículo 20",
@"Artículo 21",@"Artículo 22",@"Artículo 23",@"Artículo 24",@"Artículo 25",@"Artículo 26",@"Artículo 27",@"Artículo 28",@"Artículo 29",@"Artículo 30",
@"Artículo 31",@"Artículo 32",@"Artículo 33",@"Artículo 34",@"Artículo 35",@"Artículo 36",@"Artículo 37",@"Artículo 38",@"Artículo 39",@"Artículo 40",
@"Artículo 41",@"Artículo 42",@"Artículo 43",@"Artículo 44",@"Artículo 45",@"Artículo 46",@"Artículo 47",@"Artículo 48",@"Artículo 49",@"Artículo 50",
@"Artículo 51",@"Artículo 52",@"Artículo 53",@"Artículo 54",@"Artículo 55",@"Artículo 56",@"Artículo 57",@"Artículo 58",@"Artículo 59",@"Artículo 60",
@"Artículo 61",@"Artículo 62",@"Artículo 63",@"Artículo 64",@"Artículo 65",@"Artículo 66",@"Artículo 67",@"Artículo 68",@"Artículo 69",@"Artículo 70",
@"Artículo 71",@"Artículo 72",@"Artículo 73",@"Artículo 74",@"Artículo 75",@"Artículo 76",@"Artículo 77",@"Artículo 78",@"Artículo 79",@"Artículo 80",
@"Artículo 81",@"Artículo 82",@"Artículo 83",@"Artículo 84",@"Artículo 85",@"Artículo 86",@"Artículo 87",@"Artículo 88",@"Artículo 89",@"Artículo 90",
@"Artículo 91",@"Artículo 92",@"Artículo 93",@"Artículo 94",@"Artículo 95",@"Artículo 96",@"Artículo 97",@"Artículo 98",@"Artículo 99",@"Artículo 100",
@"Artículo 101",@"Artículo 102",@"Artículo 103",@"Artículo 104",@"Artículo 105",@"Artículo 106",@"Artículo 107",@"Artículo 108",@"Artículo 109",@"Artículo 110",
@"Artículo 111",@"Artículo 112",@"Artículo 113",@"Artículo 114",@"Artículo 115",@"Artículo 116",@"Artículo 117",@"Artículo 118",@"Artículo 119",@"Artículo 120",
@"Artículo 121",@"Artículo 122",@"Artículo 123",@"Artículo 124",@"Artículo 125",@"Artículo 126",@"Artículo 127",@"Artículo 128",@"Artículo 129",@"Artículo 130",
@"Artículo 131",@"Artículo 132",@"Artículo 133",@"Artículo 134",@"Artículo 135",@"Artículo 136",
@"Artículo Primero",@"Artículo Segundo",@"Artículo Tercero",@"Artículo Cuarto",@"Artículo Quinto",@"Artículo Sexto",@"Artículo Séptimo",@"Artículo Octavo",@"Artículo Noveno",@"Artículo Décimo",
@"Artículo Decimoprimero",@"Artículo Decimosegundo",@"Artículo Decimotercero",@"Artículo Decimocuarto",@"Artículo Decimoquinto",@"Artículo Decimosexto",@"Artículo Decimoséptimo",@"Artículo Decimoctavo",@"Artículo Decimonoveno",@"Firmas", @"29 de enero de 2016", @"27 de enero de 2016", @"10 de julio de 2015", @"2 de julio de 2015", @"27 de mayo de 2015", @"26 de mayo de 2015", @"22 de mayo de 2015", @"7 de julio de 2014", @"17 de junio de 2014 (1)", @"17 de junio de 2014 (2)", @"17 de junio de 2014 (3)",  @"7 de febrero de 2014", @"10 de febrero de 2014", @"27 de diciembre de 2013", @"20 de diciembre de 2013", @"8 de octubre de 2013", @"30 de septiembre de 2013", @"19 de julio de 2013", @"11 de junio de 2013", @"26 de febrero de 2013", @"30 de noviembre de 2012", @"15 de octubre de 2012", @"9 de agosto de 2012", @"9 de febrero de 2012", @"8 de febrero de 2012", @"12 de octubre de 2011-2", @"12 de octubre de 2011", @"17 de agosto de 2011", @"14 de julio de 2011", @"10 de junio de 2011", @"6 de junio de 2011", @"13 de abril de 2011", @"29 de julio de 2010", @"27 de abril de 2010", @"24 de agosto de 2009", @"14 de agosto de 2009", @"25 de junio de 2009", @"1 de junio de 2009", @"4 de mayo de 2009", @"30 de abril de 2009-2", @"30 de abril de 2009", @"26 de septiembre de 2008", @"29 de agosto de 2008", @"15 de agosto de 2008", @"18 de junio de 2008", @"7 de mayo de 2008", @"13 de noviembre de 2007", @"27 de septiembre de 2007", @"15 de agosto de 2007", @"2 de agosto de 2007", @"20 de julio de 2007-2", @"20 de julio de 2007", @"19 de junio de 2007-2", @"19 de junio de 2007", @"12 de febrero de 2007", @"4 de diciembre de 2006-2", @"4 de diciembre de 2006", @"14 de septiembre de 2006", @"7 de abril de 2006", @"12 de diciembre de 2005", @"9 de diciembre de 2005", @"8 de diciembre de 2005", @"28 de noviembre de 2005", @"20 de junio de 2005", @"27 de septiembre de 2004", @"2 de agosto de 2004", @"30 de julio de 2004", @"22 de julio de 2004", @"5 de abril de 2004", @"12 de noviembre de 2002", @"14 de junio de 2002", @"14 de agosto de 2001", @"21 de septiembre de 2000-2", @"21 de septiembre de 2000", @"7 de abril de 2000", @"23 de diciembre de 1999", @"13 de septiembre de 1999", @"30 de julio de 1999", @"29 de julio de 1999", @"28 de junio de 1999", @"11 de junio de 1999", @"26 de febrero de 1999", @"20 de marzo de 1997", @"22 de agosto de 1996", @"25 de octubre de 1993", @"3 de septiembre de 1993",
nil];
    NSDictionary *itemsInDict = [NSDictionary dictionaryWithObject:itemsInArray forKey:@"Key1"];
	[listOfItems addObject:itemsInDict];
    
    listOfItems2 = [[NSMutableArray alloc] init];
    
NSArray *itemsInArray2 = [NSArray arrayWithObjects:                          
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 1" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 2" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 3" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 4" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 5" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 6" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 7" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 8" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 9" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 10" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 11" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 12" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 13" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 14" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 15" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 16" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 17" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 18" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 19" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 20" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 21" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 22" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 23" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 24" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 25" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 26" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 27" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 28" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 29" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 30" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 31" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 32" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 33" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 34" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 35" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 36" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 37" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 38" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 39" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 40" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 41" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 42" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 43" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 44" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 45" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 46" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 47" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 48" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 49" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 50" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 51" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 52" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 53" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 54" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 55" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 56" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 57" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 58" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 59" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 60" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 61" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 62" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 63" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 64" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 65" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 66" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 67" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 68" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 69" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 70" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 71" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 72" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 73" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 74" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 75" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 76" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 77" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 78" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 79" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 80" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 81" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 82" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 83" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 84" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 85" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 86" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 87" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 88" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 89" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 90" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 91" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 92" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 93" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 94" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 95" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 96" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 97" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 98" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 99" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 100" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 101" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 102" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 103" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 104" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 105" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 106" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 107" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 108" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 109" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 110" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 111" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 112" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 113" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 114" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 115" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 116" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 117" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 118" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 119" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 120" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 121" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 122" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 123" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 124" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 125" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 126" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 127" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 128" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 129" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 130" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 131" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 132" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 133" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 134" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 135" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo 136" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Primero" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Segundo" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Tercero" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Cuarto" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Quinto" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Sexto" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Séptimo" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Octavo" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Noveno" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Décimo" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Decimoprimero" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Decimosegundo" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Decimotercero" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Decimocuarto" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Decimoquinto" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Decimosexto" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Decimoséptimo" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Decimoctavo" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Artículo Decimonoveno" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Firmas" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"29 de enero de 2016" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"27 de enero de 2016" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"10 de julio de 2015" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2 de julio de 2015" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"27 de mayo de 2015" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"26 de mayo de 2015" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"22 de mayo de 2015" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"7 de julio de 2014" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"17 de junio de 2014 (1)" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"17 de junio de 2014 (2)" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"17 de junio de 2014 (3)" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"10 de febrero de 2014" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"7 de febrero de 2014" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
                          
                          [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"27 de diciembre de 2013" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"20 de diciembre de 2013" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"8 de octubre de 2013" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
 [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"30 de septiembre de 2013" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"19 de julio de 2013" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"11 de junio de 2013" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"26 de febrero de 2013" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"30 de noviembre de 2012" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"15 de octubre de 2012" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"9 de agosto de 2012" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"9 de febrero de 2012" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"8 de febrero de 2012" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"12 de octubre de 2011-2" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"12 de octubre de 2011" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"17 de agosto de 2011" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"14 de julio de 2011" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"10 de junio de 2011" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"6 de junio de 2011" ofType:@"txt"] encoding:NSUTF16StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"13 de abril de 2011" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"29 de julio de 2010" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"27 de abril de 2010" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"24 de agosto de 2009" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"14 de agosto de 2009" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"25 de junio de 2009" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1 de junio de 2009" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4 de mayo de 2009" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"30 de abril de 2009-2" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"30 de abril de 2009" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"26 de septiembre de 2008" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"29 de agosto de 2008" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"15 de agosto de 2008" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"18 de junio de 2008" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"7 de mayo de 2008" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"13 de noviembre de 2007" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"27 de septiembre de 2007" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"15 de agosto de 2007" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2 de agosto de 2007" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"20 de julio de 2007-2" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"20 de julio de 2007" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"19 de junio de 2007-2" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"19 de junio de 2007" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"12 de febrero de 2007" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4 de diciembre de 2006-2" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4 de diciembre de 2006" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"14 de septiembre de 2006" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"7 de abril de 2006" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"12 de diciembre de 2005" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"9 de diciembre de 2005" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"8 de diciembre de 2005" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"28 de noviembre de 2005" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"20 de junio de 2005" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"27 de septiembre de 2004" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2 de agosto de 2004" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"30 de julio de 2004" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"22 de julio de 2004" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"5 de abril de 2004" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"12 de noviembre de 2002" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"14 de junio de 2002" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"14 de agosto de 2001" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"21 de septiembre de 2000-2" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"21 de septiembre de 2000" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"7 de abril de 2000" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"23 de diciembre de 1999" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"13 de septiembre de 1999" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"30 de julio de 1999" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"29 de julio de 1999" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"28 de junio de 1999" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"11 de junio de 1999" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"26 de febrero de 1999" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"20 de marzo de 1997" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"22 de agosto de 1996" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"25 de octubre de 1993" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3 de septiembre de 1993"ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil],
nil];
    NSDictionary *itemsInDict2 = [NSDictionary dictionaryWithObject:itemsInArray2 forKey:@"Key2"];
    [listOfItems2 addObject:itemsInDict2];
    
    listOfItems3Titles = [[NSMutableArray alloc] init]; //Nombres que se presentan en la tabla de búsqueda.
NSArray *itemsInArray3 = [NSArray arrayWithObjects:
@"Artículo 1", @"Artículo 2", @"Artículo 3", @"Artículo 4", @"Artículo 5", @"Artículo 6", @"Artículo 7", @"Artículo 8", @"Artículo 9", @"Artículo 10",
@"Artículo 11",@"Artículo 12",@"Artículo 13",@"Artículo 14",@"Artículo 15",@"Artículo 16",@"Artículo 17",@"Artículo 18",@"Artículo 19",@"Artículo 20",
@"Artículo 21",@"Artículo 22",@"Artículo 23",@"Artículo 24",@"Artículo 25",@"Artículo 26",@"Artículo 27",@"Artículo 28",@"Artículo 29",@"Artículo 30",
@"Artículo 31",@"Artículo 32",@"Artículo 33",@"Artículo 34",@"Artículo 35",@"Artículo 36",@"Artículo 37",@"Artículo 38",@"Artículo 39",@"Artículo 40",
@"Artículo 41",@"Artículo 42",@"Artículo 43",@"Artículo 44",@"Artículo 45",@"Artículo 46",@"Artículo 47",@"Artículo 48",@"Artículo 49",@"Artículo 50",
@"Artículo 51",@"Artículo 52",@"Artículo 53",@"Artículo 54",@"Artículo 55",@"Artículo 56",@"Artículo 57",@"Artículo 58",@"Artículo 59",@"Artículo 60",
@"Artículo 61",@"Artículo 62",@"Artículo 63",@"Artículo 64",@"Artículo 65",@"Artículo 66",@"Artículo 67",@"Artículo 68",@"Artículo 69",@"Artículo 70",
@"Artículo 71",@"Artículo 72",@"Artículo 73",@"Artículo 74",@"Artículo 75",@"Artículo 76",@"Artículo 77",@"Artículo 78",@"Artículo 79",@"Artículo 80",
@"Artículo 81",@"Artículo 82",@"Artículo 83",@"Artículo 84",@"Artículo 85",@"Artículo 86",@"Artículo 87",@"Artículo 88",@"Artículo 89",@"Artículo 90",
@"Artículo 91",@"Artículo 92",@"Artículo 93",@"Artículo 94",@"Artículo 95",@"Artículo 96",@"Artículo 97",@"Artículo 98",@"Artículo 99",@"Artículo 100",
@"Artículo 101",@"Artículo 102",@"Artículo 103",@"Artículo 104",@"Artículo 105",@"Artículo 106",@"Artículo 107",@"Artículo 108",@"Artículo 109",@"Artículo 110",
@"Artículo 111",@"Artículo 112",@"Artículo 113",@"Artículo 114",@"Artículo 115",@"Artículo 116",@"Artículo 117",@"Artículo 118",@"Artículo 119",@"Artículo 120",
@"Artículo 121",@"Artículo 122",@"Artículo 123",@"Artículo 124",@"Artículo 125",@"Artículo 126",@"Artículo 127",@"Artículo 128",@"Artículo 129",@"Artículo 130",
@"Artículo 131",@"Artículo 132",@"Artículo 133",@"Artículo 134",@"Artículo 135",@"Artículo 136",
@"Artículo Primero",@"Artículo Segundo",@"Artículo Tercero",@"Artículo Cuarto",@"Artículo Quinto",@"Artículo Sexto",@"Artículo Séptimo",@"Artículo Octavo",@"Artículo Noveno",@"Artículo Décimo",
@"Artículo Decimoprimero",@"Artículo Decimosegundo",@"Artículo Decimotercero",@"Artículo Decimocuarto",@"Artículo Decimoquinto",@"Artículo Decimosexto",@"Artículo Decimoséptimo",@"Artículo Decimoctavo",@"Artículo Decimonoveno",@"Firmas", @"29 de enero de 2016", @"27 de enero de 2016", @"10 de julio de 2015", @"2 de julio de 2015", @"27 de mayo de 2015", @"26 de mayo de 2015", @"22 de mayo de 2015", @"7 de julio de 2014", @"17 de junio de 2014 (1)", @"17 de junio de 2014 (2)", @"17 de junio de 2014 (3)", @"10 de febrero de 2014", @"7 de febrero de 2014", @"27 de diciembre de 2013", @"20 de diciembre de 2013", @"8 de octubre de 2013", @"30 de septiembre de 2013", @"19 de julio de 2013", @"11 de junio de 2013", @"26 de febrero de 2013", @"30 de noviembre de 2012", @"15 de octubre de 2012", @"9 de agosto de 2012", @"9 de febrero de 2012", @"8 de febrero de 2012", @"12 de octubre de 2011-2", @"12 de octubre de 2011", @"17 de agosto de 2011", @"14 de julio de 2011", @"10 de junio de 2011", @"6 de junio de 2011", @"13 de abril de 2011", @"29 de julio de 2010", @"27 de abril de 2010", @"24 de agosto de 2009", @"14 de agosto de 2009", @"25 de junio de 2009", @"1 de junio de 2009", @"4 de mayo de 2009", @"30 de abril de 2009-2", @"30 de abril de 2009", @"26 de septiembre de 2008", @"29 de agosto de 2008", @"15 de agosto de 2008", @"18 de junio de 2008", @"7 de mayo de 2008", @"13 de noviembre de 2007", @"27 de septiembre de 2007", @"15 de agosto de 2007", @"2 de agosto de 2007", @"20 de julio de 2007-2", @"20 de julio de 2007", @"19 de junio de 2007-2", @"19 de junio de 2007", @"12 de febrero de 2007", @"4 de diciembre de 2006-2", @"4 de diciembre de 2006", @"14 de septiembre de 2006", @"7 de abril de 2006", @"12 de diciembre de 2005", @"9 de diciembre de 2005", @"8 de diciembre de 2005", @"28 de noviembre de 2005", @"20 de junio de 2005", @"27 de septiembre de 2004", @"2 de agosto de 2004", @"30 de julio de 2004", @"22 de julio de 2004", @"5 de abril de 2004", @"12 de noviembre de 2002", @"14 de junio de 2002", @"14 de agosto de 2001", @"21 de septiembre de 2000-2", @"21 de septiembre de 2000", @"7 de abril de 2000", @"23 de diciembre de 1999", @"13 de septiembre de 1999", @"30 de julio de 1999", @"29 de julio de 1999", @"28 de junio de 1999", @"11 de junio de 1999", @"26 de febrero de 1999", @"20 de marzo de 1997", @"22 de agosto de 1996", @"25 de octubre de 1993", @"3 de septiembre de 1993",
nil];
    NSDictionary *itemsInDict3 = [NSDictionary dictionaryWithObject:itemsInArray3 forKey:@"Key3"];
    [listOfItems3Titles addObject:itemsInDict3];
    //// - Initialize the copy array. - ///////////////////////////////
	copyListOfItems = [[NSMutableArray alloc] init];
    //Initialize the copy array of Titles.
    copyListOfItems3Titles = [[NSMutableArray alloc] init];
    //Add the search bar
	self.tableView.tableHeaderView = searchBar;
    
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    searchBar.placeholder = @"Buscar";
    searching = NO;
    letUserSelectRow = YES;
    // Quit x gray button in searchBar
    for (UIView *subview in searchBar.subviews)
    {
        if ([subview conformsToProtocol:@protocol(UITextInputTraits)])
        {
            [(UITextField *)subview setClearButtonMode:UITextFieldViewModeWhileEditing];
        }
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    /*if ([self.navigationItem.title isEqualToString:@"Buscar"]) //self.title
        contenidoVacio = [[NSArray alloc ]
                     initWithObjects:@"Presione en la barra de búsqueda si desea buscar en todos los documentos", nil];*/
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

/*- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}*/
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (searching){
        return [copyListOfItems count];
    }
	else
    {
    return [contenidoVacio count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        //[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    if(searching)
    {
        cell.textLabel.font = [UIFont boldSystemFontOfSize:18];/*[UIFont systemFontOfSize:17];*/ //Change this value to adjust size
        cell.textLabel.numberOfLines = 1; //Change this value to show more or less lines.
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        cell.textLabel.text=[copyListOfItems3Titles objectAtIndex:indexPath.row];
        //cell.detailTextLabel.text = @"";//@"Detail"
        return cell;
    }
    else {
        cell.textLabel.font = [UIFont systemFontOfSize:16]; //Change this value to adjust size
        cell.textLabel.numberOfLines = 2; //Change this value to show more or less lines.
        [cell setAccessoryType:UITableViewCellAccessoryNone]; //Quita el indicador de siguiente Vista del DrillDown
    
        cell.textLabel.text = [contenidoVacio objectAtIndex:[indexPath row]];//cell.textLabel.text = @"This is my text";
        return cell;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(searching){
        NSString *selectedFile=nil;//Get the selected File
        selectedFile = [copyListOfItems objectAtIndex:indexPath.row];
        textForSearchBarHere=searchBar.text;//:O se hace el paso del texto de este searchBar al Visor de Documento.
        //Initialize the file view controller and display it.
        ArticleViewController *dvController = [[ArticleViewController alloc] initWithNibName:@"ArticleViewController" bundle:[NSBundle mainBundle]];
        dvController.textSelected = selectedFile;//!!! - Texto a mostrar en el DetailView.
        dvController.textForSearchBar = textForSearchBarHere;//!!! - valor para SearchBar de DetailView desde tablas.
        [self.navigationController pushViewController:dvController animated:YES];
        [dvController release];
        dvController = nil;
    }
    else{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    NSLog(@"Nothing To Do XD");
    }
}
#pragma mark - UISearchBarDelegate
- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
    //This method is called again when the user clicks back from the detail view.
	//So the overlay is displayed on the results, which is something we do not want to happen.
	if(searching)
		return;
	
	//Add the overlay view.
	if(ovController == nil)
		ovController = [[OverlayViewController alloc] initWithNibName:@"OverlayViewController" bundle:[NSBundle mainBundle]];
	
	CGFloat yaxis = self.navigationController.navigationBar.frame.size.height;
	CGFloat width = self.view.frame.size.width;
	CGFloat height = self.view.frame.size.height;
	
	//Parameters x = origion on x-axis, y = origon on y-axis.
	CGRect frame = CGRectMake(0, yaxis, width, height);
	ovController.view.frame = frame;
	ovController.view.backgroundColor = [UIColor grayColor];
	ovController.view.alpha = 0.5;
	
	ovController.bvController = self;
	
	[self.tableView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
	
	searching = YES;
	letUserSelectRow = NO;
	self.tableView.scrollEnabled = NO;
	
	//Add the Clear button.
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Cancelar" style:UIBarButtonItemStylePlain
											   //initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                              target:self action:@selector(doneSearching_Clicked:)] autorelease];
    ////Add the Up button.
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Arriba" style:UIBarButtonItemStylePlain
                                                                             target:self action:@selector(up_Clicked2:)] autorelease];
}
//- (void)searchBarTextDidEndEditing:(UISearchBar *)mySearchBar {}
- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
    //Remove all objects first.
	[copyListOfItems removeAllObjects]; [copyListOfItems3Titles removeAllObjects]; // !!!
    
	if([searchText length] > 0) {
		[ovController.view removeFromSuperview];
		searching = YES;
		letUserSelectRow = YES;
		self.tableView.scrollEnabled = YES;
		[self searchTableView];
	}
	else {
		
		[self.tableView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
		
		searching = NO;
		letUserSelectRow = NO;
		self.tableView.scrollEnabled = NO;
	}
	[self.tableView reloadData];
    
}
- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    NSLog(@"copyLOItems:%lu",(unsigned long)[copyListOfItems count]);
    if(  [copyListOfItems count]>=101 )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"¡Advertencia!"
                                                        message:[NSString stringWithFormat:@"El término '%@' aparece en más de %lu artículos, por favor precise su búsqueda",theSearchBar.text,[copyListOfItems count]-1]
                                                       delegate:nil
                                              cancelButtonTitle:@"Aceptar"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    /*else {
     if(  [copyListOfItems count]<=100 && [copyListOfItems count] >0 ){
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"¡Encontrado!"
     message:[NSString stringWithFormat:@"El término '%@' aparece en %d documentos.",theSearchBar.text,[copyListOfItems count]]
     .....}     }*/
    if( [copyListOfItems count]==0 && [theSearchBar.text length]>0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"¡No encontrado!"
                                                        message:[NSString stringWithFormat:@"Intente revisar la puntuación del término:%@",searchBar.text]
                                                       delegate:nil
                                              cancelButtonTitle:@"Aceptar"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }
    [theSearchBar resignFirstResponder];
}
//Motor de búsqueda
- (void) searchTableView {
    NSString *searchText = searchBar.text;
    NSMutableArray *searchArray = [[NSMutableArray alloc] init];
    NSMutableArray *searchArray2 = [[NSMutableArray alloc] init];
    NSMutableArray *searchArray3Titles = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in listOfItems)
    {
        NSArray *array = [dictionary objectForKey:@"Key1"];
        [searchArray addObjectsFromArray:array];
    }
    for (NSDictionary *dictionary in listOfItems2)
    {
        NSArray *array2 = [dictionary objectForKey:@"Key2"];
        [searchArray2 addObjectsFromArray:array2];
    }
    for (NSDictionary *dictionary3 in listOfItems3Titles)
    {
        NSArray *array3Titles = [dictionary3 objectForKey:@"Key3"];
        [searchArray3Titles addObjectsFromArray:array3Titles];
    }
    
    //Núcleo.
    int myindex=0;
    for (NSString *sTemp2 in searchArray2)
    {
        NSRange titleResultsRange = [sTemp2 rangeOfString:searchText options:NSCaseInsensitiveSearch];// |NSDiacriticInsensitiveSearch acentos
        if (titleResultsRange.length > 0)
        {
            [copyListOfItems addObject:[searchArray objectAtIndex:myindex]];
            [copyListOfItems3Titles addObject:[searchArray3Titles objectAtIndex:myindex]];
            if ([copyListOfItems count] >= 101 && [copyListOfItems3Titles count] >= 101) //Límite de la búsqueda para mayor comodidad y descarga del motor
            {
                break;
            }
        }
        myindex++;
    }
    [searchArray release]; [searchArray2 release]; [searchArray3Titles release];
    searchArray = nil;  searchArray2 = nil;     searchArray3Titles = nil;
}

- (void) doneSearching_Clicked:(id)sender {
	
	searchBar.text = @"";
    //searchBar.placeholder = @"Buscar...";//"o use números para especificar"
	[searchBar resignFirstResponder];
	
	letUserSelectRow = YES;
	searching = NO;
	self.navigationItem.rightBarButtonItem = nil; self.navigationItem.leftBarButtonItem = nil;
	self.tableView.scrollEnabled = YES;
	
	[ovController.view removeFromSuperview];
	[ovController release];
	ovController = nil;
	
	[self.tableView reloadData];
}
- (void) up_Clicked2:(id)sender {
    [self.tableView setContentOffset:CGPointMake(0,0) animated:TRUE];
}

@end
