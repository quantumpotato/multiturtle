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
    self.turtle.charge-= 8;
    if (self.turtle.charge < 0) {
        self.turtle.charge = 0;
        [self.turtle changeState:self.turtle.floating];
    }
}

- (float)speed {
    return 27;
}

- (void)touchDown {
    [self.turtle changeState:self.turtle.charging];
}

@end
