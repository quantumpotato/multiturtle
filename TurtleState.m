//
//  TurtleState.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "TurtleState.h"

@implementation TurtleState
@synthesize turtle = _turtle;

- (id)initWithTurtle:(Turtle *)turtle {
    self = [super init];
    if (self) {
        self.turtle = turtle;
    }
    return self;
}

- (void)tick {
    
}
- (float)speed {
    return 0;
}

- (void)touchDown {
    
}

- (void)touchUp {
    
}

@end
