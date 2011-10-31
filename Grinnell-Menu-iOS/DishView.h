//
//  DishView.h
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/22/11.
//  Copyright 2011 __GrinnellAppDev__. All rights reserved.
//

@interface DishView : UIViewController {
    UITextView *dishDetails;
    UITextView *nutritionDetails;
}
- (IBAction)showTray:(id)sender;
- (IBAction)showInfo:(id)sender;
- (IBAction)addToTray:(id)sender;
- (IBAction)removeFromTray:(id)sender;
- (IBAction)backToMainMenu:(id)sender;
- (IBAction)toVenueView:(id)sender;
@property (nonatomic, retain) IBOutlet UITextView *dishDetails;
@property (nonatomic, retain) IBOutlet UITextView *nutritionDetails;

@end
