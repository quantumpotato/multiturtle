//
//  Turtle.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "Turtle.h"

@implementation Turtle
@synthesize speed = _speed;
@synthesize l = _l;
@synthesize sprite = _sprite;
@synthesize state = _state;
@synthesize floating = _floating;

- (id)init {
    self = [super init];
    if (self) {
        self.floating = [[FloatingState alloc] initWithTurtle:self];
        self.state = self.floating;
    }
    return self;
}

- (void)tick {
    self.sprite.position = self.l;
    self.l = ccp(self.l.x, self.l.y + self.speed);
    [self.state tick];
}

- (void)changeState:(TurtleState *)s {
    self.state = s;
}

- (NSInteger)maxCharge {
    return 130;
}

@end
