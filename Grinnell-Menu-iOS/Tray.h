//
//  Tray.h
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/22/11.
//  Copyright 2011 __GrinnellAppDev__. All rights reserved.
//

@interface Tray : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UIAlertView *alert;
    UITableView *newTableView;
}
- (IBAction)editTable:(id)sender;
- (IBAction)clearTray:(id)sender;
@property(nonatomic, retain) UIAlertView *alert;
@property (nonatomic, retain) IBOutlet UITableView *newTableView;

@end