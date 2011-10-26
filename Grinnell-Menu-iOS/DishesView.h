//
//  DishesView.h
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/22/11.
//  Copyright 2011 __GrinnellAppDev__. All rights reserved.
//
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface DishesView : UIViewController {
    NSMutableArray *venueDishes;
}

- (IBAction)showInfo:(id)sender;
- (IBAction)showTray:(id)sender;
- (IBAction)backToMainMenu:(id)sender;

@end
