//
//  Tray.h
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/22/11.
//  Copyright 2011 __GrinnellAppDev__. All rights reserved.
//


@interface Tray : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *newTableView;
}
- (IBAction)editTable:(id)sender;
- (IBAction)clearTray:(id)sender;
- (IBAction)toVenueView:(id)sender;

@property (nonatomic, retain) IBOutlet UITableView *newTableView;


@end