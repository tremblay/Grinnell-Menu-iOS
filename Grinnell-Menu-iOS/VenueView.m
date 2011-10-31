//
//  VenueView.m
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/22/11.
//  Copyright 2011 __GrinnellAppDev__. All rights reserved.
//

#import "VenueView.h"
#import "DishView.h"
#import "Grinnell_Menu_iOSAppDelegate.h"
#import "Dish.h"

@implementation VenueView 

@synthesize newTableView;

- (IBAction)showTray:(id)sender
{    
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    mainDelegate.fromDishView = @"No";
    [mainDelegate flipToTray];
}

- (IBAction)showInfo:(id)sender
{    
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate flipToSettings];
}


- (void)viewDidLoad {    
    [super viewDidLoad];
    venues = [[NSArray alloc] initWithObjects:@"Honor Grill", @"8th Ave. Deli", @"Wok", @"Desserts", @"Pizza", @"Pasta", @"Plat du Jour", @"Vegan Bar", nil];
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    mainDelegate.trayDishes = [[NSMutableArray alloc] init];
    
    mainDelegate.dishes = [[NSMutableArray alloc] initWithCapacity:20];
    Dish *dish;
    dish = [[Dish alloc] init];
    dish.name = @"dish1";
    dish.isChecked = NO;
    dish.venue = @"Honor Grill";
    dish.details = @"dish1 details are...";
    dish.nutrition = @"dish1 nutrition is...";
    [mainDelegate.dishes addObject:dish];
    
    dish = [[Dish alloc] init];
    dish.name = @"dish2";
    dish.isChecked = NO;
    dish.venue = @"Honor Grill";
    dish.details = @"dish2 details are...";
    dish.nutrition = @"dish2 nutrition is...";
    [mainDelegate.dishes addObject:dish];

    dish = [[Dish alloc] init];
    dish.name = @"dish3";
    dish.isChecked = NO;
    dish.venue = @"Honor Grill";
    dish.details = @"dish3 details are...";
    dish.nutrition = @"dish3 nutrition is...";
    [mainDelegate.dishes addObject:dish];

    dish = [[Dish alloc] init];
    dish.name = @"dish4";
    dish.isChecked = NO;
    dish.venue = @"Desserts";
    dish.details = @"dish4 details are...";
    dish.nutrition = @"dish4 nutrition is...";
    [mainDelegate.dishes addObject:dish];

    dish = [[Dish alloc] init];
    dish.name = @"dish5";
    dish.isChecked = NO;
    dish.venue = @"Desserts";
    dish.details = @"dish5 details are...";
    dish.nutrition = @"dish5 nutrition is...";
    [mainDelegate.dishes addObject:dish];

    self.title = @"Venues";
    
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
- (void)viewWillAppear:(BOOL)animated
{
    [newTableView reloadData];
    [super viewWillAppear:animated];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return venues.count;
}

- (NSString *)tableView:(UITableView *)tableView 
titleForHeaderInSection:(NSInteger)section
{
	if ( section == 0 ) return @"Honor Grill";
	if ( section == 1 ) return @"8th Ave. Deli";
	if ( section == 2 ) return @"Wok";
	if ( section == 3 ) return @"Desserts";
	if ( section == 4 ) return @"Pizza";
	if ( section == 5 ) return @"Pasta";
    if ( section == 6 ) return @"Plat du Jour";
    if ( section == 7 ) return @"Vegan Bar";
	return @"Other";
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section
{
    //FIX THIS
	if ( section == 0 ) return 3;
	if ( section == 1 ) return 0;
	if ( section == 2 ) return 0;
	if ( section == 3 ) return 2;
	if ( section == 4 ) return 0;
	if ( section == 5 ) return 0;
    if ( section == 6 ) return 0;
    if ( section == 7 ) return 0;
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    //FIX THIS
    int theRow = indexPath.row;
	if ( indexPath.section == 1 ) theRow += 3;
	if ( indexPath.section == 2 ) theRow += 3;
	if ( indexPath.section == 3 ) theRow += 3;
	if ( indexPath.section == 4 ) theRow += 3;
	if ( indexPath.section == 5 ) theRow += 5;
    if ( indexPath.section == 6 ) theRow += 5;
	if ( indexPath.section == 7 ) theRow += 5;
    
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    Dish *dish = [mainDelegate.dishes objectAtIndex:theRow];
    cell.textLabel.text = dish.name;
    
    if([mainDelegate.trayDishes containsObject:dish.name]){
        dish.isChecked = YES;
    }
    else{
        dish.isChecked = NO;
    }
    
    [self configureCheckmarkForCell:cell withDish:dish];
     // accessory type
     cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
     
    return cell;
}


-(void)configureCheckmarkForCell:(UITableViewCell *)cell withDish:(Dish *)dish
{
    UIImage *checkmark = [UIImage imageNamed:@"checkmark.jpg"];
    UIImage *checkmark_blank = [UIImage imageNamed:@"checkmark_blank.jpg"];
    if (dish.isChecked) {
        cell.imageView.image = checkmark;
    }
    else{
        cell.imageView.image = checkmark_blank;
    }
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    // Configure the cell...
    //FIX THIS
    int theRow = indexPath.row;
	if ( indexPath.section == 1 ) theRow += 3;
	if ( indexPath.section == 2 ) theRow += 3;
	if ( indexPath.section == 3 ) theRow += 3;
	if ( indexPath.section == 4 ) theRow += 3;
	if ( indexPath.section == 5 ) theRow += 5;
    if ( indexPath.section == 6 ) theRow += 5;
	if ( indexPath.section == 7 ) theRow += 5;
    
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    Dish *dish = [mainDelegate.dishes objectAtIndex:theRow];
    [mainDelegate.trayDishes addObject:dish.name];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!dish.isChecked)
    {
        dish.isChecked = YES;
        [self configureCheckmarkForCell:cell withDish:dish];
    }
}

- (void) configureCheckmarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    UIImage *checkmark = [UIImage imageNamed:@"checkmark.jpg"];
    cell.imageView.image = checkmark;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    // Configure the cell...
    //FIX THIS
    int theRow = indexPath.row;
	if ( indexPath.section == 1 ) theRow += 3;
	if ( indexPath.section == 2 ) theRow += 3;
	if ( indexPath.section == 3 ) theRow += 3;
	if ( indexPath.section == 4 ) theRow += 3;
	if ( indexPath.section == 5 ) theRow += 5;
    if ( indexPath.section == 6 ) theRow += 5;
	if ( indexPath.section == 7 ) theRow += 5;
    

	Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    mainDelegate.dishIndex = theRow;
    mainDelegate.navStyle = @"pushed_from_venue";

    DishView *dishView = 
	[[DishView alloc] initWithNibName:@"DishView" bundle:nil];
	[self.navigationController pushViewController:dishView animated:YES];
    [dishView release];
}


- (void)dealloc {
    [newTableView release];
    [venues release];
    [super dealloc];
}


@end