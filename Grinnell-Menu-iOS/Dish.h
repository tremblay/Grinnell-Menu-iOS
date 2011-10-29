//
//  Dish.h
//  Grinnell-Menu-iOS
//
//  Created by Colin Tremblay on 10/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Dish : NSObject {
    
}
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *venue;
@property (nonatomic, assign) BOOL isChecked;
- (void)toggleChecked;
@end
