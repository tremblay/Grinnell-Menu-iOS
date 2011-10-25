//
//  RootViewController.h
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/22/11.
//  Copyright 2011 __GrinnellAppDev__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface RootViewController : UIViewController <UIAlertViewDelegate>
{
    IBOutlet UIDatePicker *datePicker;
    UIAlertView *alert;
}

- (IBAction)showVenues:(id)sender;

@property(nonatomic, retain) UIAlertView *alert;

@end