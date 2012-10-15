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
    if (self.turtle.wantsToBoost) {
        [self.turtle changeState:self.turtle.charging];
        self.turtle.wantsToBoost = NO;
    }
}

- (float)speed {
    return 1;
}

- (void)touchDown {
    [self.turtle changeState:self.turtle.charging];
}

@end
