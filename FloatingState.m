//
//  FloatingState.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "FloatingState.h"
#import "Turtle.h"

@implementation FloatingState

- (void)tick {
    if (self.turtle.charge > 0) {
        self.turtle.charge-= 4;
        if (self.turtle.charge < 0) {
            self.turtle.charge = 0;
        }
    }
}

- (float)speed {
    return 3;
}

@end
