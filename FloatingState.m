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
}

- (float)speed {
    return 3;
}

- (void)touchDown {
    [self.turtle changeState:self.turtle.charging];
}

@end
