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
@synthesize charging = _charging;
@synthesize boosting = _boosting;
@synthesize score = _score;
@synthesize mistakes = _mistakes;

- (id)init {
    self = [super init];
    if (self) {
        self.floating   = [[FloatingState alloc] initWithTurtle:self];
        self.charging   = [[ChargingState alloc] initWithTurtle:self];
        self.boosting   = [[BoostingState alloc] initWithTurtle:self];
        self.sprite = [[CCSprite alloc] initWithFile:@"turtlesmallsize1.png"];
        self.state = self.floating;
    }
    return self;
}

- (void)tick {
    self.sprite.position = self.l;
    self.l = ccp(self.l.x, self.l.y + [self.state speed]);
    [self.state tick];
}

- (void)changeState:(TurtleState *)s {
    self.state = s;
}

- (NSInteger)maxCharge {
    return 130;
}

- (void)touchDown {
    [self.state touchDown];
}

- (void)touchUp {
    [self.state touchUp];
}

@end
