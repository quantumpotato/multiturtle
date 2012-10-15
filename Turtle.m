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
@synthesize playing = _playing;
@synthesize wantsToBoost = _wantsToBoost;

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
    if (self.playing) {
        self.cloud.position = self.l;
        self.sprite.position = self.l;
        self.l = ccp(self.l.x, self.l.y + [self.state speed]);
        [self.state tick];
    }
}

- (void)scored {
    self.l = ccp(self.l.x, -50);
    self.score++;
    self.charge = 0;
    [self setState:self.floating];
}

- (void)changeState:(TurtleState *)s {
    self.state = s;
}

- (NSInteger)maxCharge {
    return 110;
}

- (void)madeMistake {
    if (self.score > self.mistakes) {
        self.mistakes++;
    }
    BOOL reset = NO;
    if (self.mistakes > self.score) {
        reset = YES;
    }
    self.score -= self.mistakes;
    if (self.score < 0) {
        self.score = 0;
    }
    if (reset) {
        self.mistakes = 0;
    }
    self.l = ccp(self.l.x, -100);
    self.playing = NO;
    self.charge = 0;
    self.wantsToBoost = NO;
    self.sprite.position = self.l;
}

- (void)touchDown {
    if (!self.playing) {
        self.playing = YES;
    }
    [self.state touchDown];
}

- (void)touchUp {
    [self.state touchUp];
}

- (void)dealloc {
    [self.sprite removeFromParentAndCleanup:YES];
    self.sprite = nil;
    [_floating release];
    [_boosting release];
    [_charging release];
    [super dealloc];
}

@end
