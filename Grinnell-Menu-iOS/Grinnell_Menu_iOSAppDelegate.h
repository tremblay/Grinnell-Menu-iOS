//
//  Grinnell_Menu_iOSAppDelegate.h
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/22/11.
//  Copyright 2011 __GrinnellAppDev__. All rights reserved.
//

@interface Grinnell_Menu_iOSAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
    NSMutableArray *trayDishes;
    NSString *dishName;
    NSString *navStyle;
    NSString *fromDishView;
}

- (void) flipToSettings;
- (void) flipToTray;

@property (nonatomic, retain) NSMutableArray *trayDishes;
@property (nonatomic, retain) NSString *dishName;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) NSString *navStyle;
@property (nonatomic, retain) NSString *fromDishView;

@end
