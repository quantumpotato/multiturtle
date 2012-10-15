//
//  ChargingState.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "ChargingState.h"
#import "Turtle.h"

@implementation ChargingState

- (void)tick {
    self.turtle.charge+= 2;
    if (self.turtle.charge >= self.turtle.maxCharge) {
        [self.turtle changeState:self.turtle.boosting];
    }
}

- (float)speed {
    return 0;
}

- (void)touchUp {
    [self.turtle changeState:self.turtle.boosting];
}

@end
