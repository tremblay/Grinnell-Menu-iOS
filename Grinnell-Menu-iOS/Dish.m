//
//  Dish.m
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Dish.h"


@implementation Dish
@synthesize name, isChecked, venue;

- (void) toggleChecked{
    if (!self.isChecked)
        self.isChecked = YES;
}

@end
