//
//  DishView.m
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/22/11.
//  Copyright 2011 __GrinnellAppDev__. All rights reserved.
//

#import "DishView.h"
#import "VenueView.h"
#import "Grinnell_Menu_iOSAppDelegate.h"
#import "Dish.h"
#import "Venue.h"

@implementation DishView
@synthesize dishDetails, nutritionDetails, removeButton, addButton, otherAddButton, dishRow, dishSection, navStyle;

- (IBAction)addToTray:(id)sender{
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate.trayDishes addObject: self.title];
    [removeButton setHidden:NO];
    [addButton setHidden:NO];
    [otherAddButton setHidden:YES];
}

- (IBAction)removeFromTray:(id)sender{
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([mainDelegate.trayDishes containsObject:self.title]){
        [mainDelegate.trayDishes removeObject:self.title];
    }
    [removeButton setHidden:YES];
    [addButton setHidden:YES];
    [otherAddButton setHidden:NO];
}

- (IBAction)showTray:(id)sender
{    
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    mainDelegate.fromDishView = self.title;
    [mainDelegate flipToTray];
}

- (IBAction)backToMainMenu:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)toVenueView:(id)sender
{
    [self.navigationController popToViewController:    [self.navigationController.viewControllers objectAtIndex:1] animated:YES]; 
}
- (void)dealloc
{
    [navStyle release];
    [otherAddButton release];
    [addButton release];
    [removeButton release];
    [nutritionDetails release];
    [dishDetails release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)viewWillAppear:(BOOL)animated
{
    Grinnell_Menu_iOSAppDelegate *mainDelegate = (Grinnell_Menu_iOSAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    Venue *venue = [mainDelegate.venues objectAtIndex:dishSection];
    Dish *dish = [venue.dishes objectAtIndex:dishRow];
    dishDetails.text = dish.details;
    nutritionDetails.text = dish.nutrition;
    self.title = dish.name;
    if ([mainDelegate.trayDishes containsObject:self.title]){
        [removeButton setHidden:NO];
        [addButton setHidden:NO];
        [otherAddButton setHidden:YES];
    }
    else{
        [removeButton setHidden:YES];
        [addButton setHidden:YES];
        [otherAddButton setHidden:NO];
    }
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    if ([navStyle isEqualToString:@"pushed_from_tray"])
    {
        UIBarButtonItem *toVenueViewButton = [[UIBarButtonItem alloc] initWithTitle:@"Venues" style:UIBarButtonItemStyleBordered target:self action:@selector(toVenueView:)];
        [self.navigationItem setLeftBarButtonItem:toVenueViewButton]; 
    }

    //Navigate to Main Menu
    UIBarButtonItem *toMainMenuButton = [[UIBarButtonItem alloc] initWithTitle:@"Main Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(backToMainMenu:)];
    [self.navigationItem setRightBarButtonItem:toMainMenuButton];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
