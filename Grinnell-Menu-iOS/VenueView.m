//
//  VenueView.m
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/22/11.
//  Copyright 2011 __GrinnellAppDev__. All rights reserved.
//

#import "VenueView.h"
#import "DishesView.h"
#import "Grinnell_Menu_iOSAppDelegate.h"

@implementation VenueView


- (IBAction)showTray:(id)sender
{    
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate flipToTray];
}

- (IBAction)showInfo:(id)sender
{    
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate flipToSettings];
}


- (void)viewDidLoad {    
    venues = [[NSArray alloc] initWithObjects:@"Honor Grill", @"8th Ave. Deli", @"Wok", @"Pasta", @"Pizza", @"Deserts", @"Gluten-Free", @"Vegan", nil];
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return venues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.textLabel.text = [venues objectAtIndex:indexPath.row];
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
     
     // accessory type
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     */
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DishesView *dishesView = 
	[[DishesView alloc] initWithNibName:@"DishesView" bundle:nil];
	
	[self.navigationController pushViewController:dishesView animated:YES];
    [dishesView release];
}


- (void)dealloc {
    [venues release];
    [super dealloc];
}

@end