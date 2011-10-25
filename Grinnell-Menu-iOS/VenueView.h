//
//  VenueView.h
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/22/11.
//  Copyright 2011 __GrinnellAppDev__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface VenueView : UIViewController {
    NSArray *venues;
}
- (IBAction)showInfo:(id)sender;
- (IBAction)showTray:(id)sender;

@end
