//
//  BoostingState.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "BoostingState.h"
#import "Turtle.h"

@implementation BoostingState

- (void)tick {
    self.turtle.charge-= 4;
    if (self.turtle.charge < 0) {
        self.turtle.charge = 0;
        [self.turtle changeState:self.turtle.floating];
    }
}

- (float)speed {
    return 15;
}

- (void)touchDown {
    self.turtle.wantsToBoost = YES;
}

- (void)touchUp {
    self.turtle.wantsToBoost = NO;
}

@end
