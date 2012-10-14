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
    if (self.turtle.charge > 0) {
        self.turtle.charge-= 4;
        if (self.turtle.charge < 0) {
            self.turtle.charge = 0;
        }
    }
}

- (float)speed {
    return 10;
}

- (void)touchDown {
    [self.turtle changeState:self.turtle.charging];
}

@end
