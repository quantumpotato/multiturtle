//
//  Turtle.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "Turtle.h"
#import "cocos2d.h"

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
@synthesize cloud = _cloud;
@synthesize playerNumber = _playerNumber;

- (id)init {
    self = [super init];
    if (self) {
        self.floating   = [[FloatingState alloc] initWithTurtle:self];
        self.charging   = [[ChargingState alloc] initWithTurtle:self];
        self.boosting   = [[BoostingState alloc] initWithTurtle:self];
        self.sprite = [[CCSprite alloc] initWithFile:@"turtlesmallsize1.png"];
        [self.sprite setZOrder:-1];
        [self addChild:self.sprite];
        self.state = self.floating;
    }
    return self;
}

- (void)makeCloud:(NSString *)cloudFile {
    self.cloud = [[CCSprite alloc] initWithFile:cloudFile];
}

- (void)draw {
    [super draw];
    switch (self.playerNumber) {
        case 0:
            ccDrawColor4F(1, .1, .1, 1.0);
            break;
        case 1:
            ccDrawColor4F(.5, .5, 0, 1.0);
            break;
        case 2:
            ccDrawColor4F(.8, .4, 0, 1.0);
            break;
        case 3:
            ccDrawColor4F(.2, .7, .4, 1.0);
            break;
        default:
            ccDrawColor4F(1.0, 1.0, 1.0, 1.0);
    }
    
    float maxRadius = 50;
    float percentage = 1 - ((float)self.charge / (float)self.maxCharge);
    
    ccDrawCircle(self.l, percentage * maxRadius, 0, 100, NO);
}

- (void)tick {
    self.cloud.position = self.l;
    self.sprite.position = self.l;
    self.l = ccp(self.l.x, self.l.y + [self.state speed]);
    [self.state tick];
}

- (void)changeState:(TurtleState *)s {
    self.state = s;
}

- (NSInteger)maxCharge {
    return 70;
}

- (void)madeMistake {
    if (self.score > self.mistakes) {
        self.mistakes++;
    }
    self.score -= self.mistakes;
    if (self.score < 0) {
        self.score = 0;
    }
    self.l = ccp(self.l.x, -150);
}

- (void)touchDown {
    [self.state touchDown];
}

- (void)touchUp {
    [self.state touchUp];
}

@end
