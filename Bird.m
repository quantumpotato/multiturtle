//
//  Bird.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "Bird.h"

@implementation Bird
@synthesize sprite = _sprite;
@synthesize l = _l;
@synthesize speed = _speed;

- (id)init {
    self = [super init];
    if (self) {
        self.sprite = [[CCSprite alloc] initWithFile:@"SMBird1b84F.png"];
        [self addChild:self.sprite];
    }
    
    return self;
}

- (void)tick {
    self.l = ccp(self.l.x + self.speed, self.l.y);
    self.sprite.position = self.l;
}

- (void)resetForTurtle:(Turtle *)t {

    NSInteger maxX = t.score;
    if (maxX > 50) {
        maxX = 50;
    }
    maxX += arc4random() % 50;
    maxX += 2;
    NSInteger offX = arc4random() % maxX;
    
    self.l = ccp(-offX * 10, self.l.y);

    NSInteger maxSpeed = t.score;
    if (maxSpeed < 2) {
        maxSpeed = 2;
    }
    if (maxSpeed > 17) {
        maxSpeed = 17;
    }
    self.speed = arc4random() % maxSpeed;
    self.speed += 3;
}

@end
