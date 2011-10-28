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

@implementation VenueView

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
    venues = [[NSArray alloc] initWithObjects:@"Honor Grill", @"8th Ave. Deli", @"Wok", @"Desserts", @"Pizza", @"Pasta", @"Plat du Jour", @"Vegan Bar", nil];
    dishes = [[NSArray alloc] initWithObjects:@"dish1", @"dish2", @"dish3", @"dish4", @"dish5", @"dish6", @"dish7", @"dish8", @"dish9", @"dish10", @"dish11", @"dish12", @"dish13", @"dish14", @"dish15", @"dish16", @"dish17", @"dish18", @"dish19", @"dish20", @"dish21", nil];
    self.title = @"Venues";
    
    [super viewDidLoad];
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
	if ( section == 0 ) return 3;
	if ( section == 1 ) return 3;
	if ( section == 2 ) return 3;
	if ( section == 3 ) return 3;
	if ( section == 4 ) return 3;
	if ( section == 5 ) return 2;
    if ( section == 6 ) return 2;
    if ( section == 7 ) return 2;
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
    int theRow = indexPath.row;
	if ( indexPath.section == 1 ) theRow += 3;
	if ( indexPath.section == 2 ) theRow += 6;
	if ( indexPath.section == 3 ) theRow += 9;
	if ( indexPath.section == 4 ) theRow += 12;
	if ( indexPath.section == 5 ) theRow += 15;
    if ( indexPath.section == 6 ) theRow += 17;
	if ( indexPath.section == 7 ) theRow += 19;

    cell.textLabel.text = [dishes objectAtIndex:theRow];
    /* 
     //Other options:
     // retrieve an image
     NSString *imagefile = [[NSBundle mainBundle] 
     pathForResource:@"cellimage" ofType:@"png"];
     UIImage *ui = [[UIImage alloc] initWithContentsOfFile:imagefile];
     //set the image on the table cell
     cell.imageView.image = ui;
     
     // set the subtitle text
     cell.detailTextLabel.text = @"Subtitle contents go here";
     */
     // accessory type
     cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
     
    return cell;
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    int theRow = indexPath.row;
	if ( indexPath.section == 1 ) theRow += 3;
	if ( indexPath.section == 2 ) theRow += 6;
	if ( indexPath.section == 3 ) theRow += 9;
	if ( indexPath.section == 4 ) theRow += 12;
	if ( indexPath.section == 5 ) theRow += 15;
    if ( indexPath.section == 6 ) theRow += 17;
	if ( indexPath.section == 7 ) theRow += 19;
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    if (mainDelegate.trayDishes.count == 0) {
        mainDelegate.trayDishes = [[NSMutableArray alloc] initWithObjects: [dishes objectAtIndex:theRow], nil];
    }
    else
    {
        [mainDelegate.trayDishes addObject: [dishes objectAtIndex:theRow]]; 
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    int theRow = indexPath.row;
	if ( indexPath.section == 1 ) theRow += 3;
	if ( indexPath.section == 2 ) theRow += 6;
	if ( indexPath.section == 3 ) theRow += 9;
	if ( indexPath.section == 4 ) theRow += 12;
	if ( indexPath.section == 5 ) theRow += 15;
    if ( indexPath.section == 6 ) theRow += 17;
	if ( indexPath.section == 7 ) theRow += 19;
    

	Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    mainDelegate.dishName = [dishes objectAtIndex:theRow];
    mainDelegate.navStyle = @"pushed_from_venue";

    DishView *dishView = 
	[[DishView alloc] initWithNibName:@"DishView" bundle:nil];
	[self.navigationController pushViewController:dishView animated:YES];
    [dishView release];
}


- (void)dealloc {
    [venues release];
    [dishes release];
    [super dealloc];
}

@end