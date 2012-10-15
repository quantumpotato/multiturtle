//
//  MTGameController.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "MTGameController.h"
#import "Turtle.h"

@implementation MTGameController
@synthesize layer = _layer;
@synthesize turtles = _turtles;

- (void)setupTurtles {
    self.turtles = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        Turtle *t = [[Turtle alloc] init];
        [self.layer addChild:t];
        t.l = ccp(500 + i * 90, 0);
        t.playerNumber = i;
        [self.turtles addObject:t];
    }
}

- (id)initWithLayer:(CCLayer *)layer {
    self = [super init];
    if (self) {
        self.layer = layer;
        [self setupTurtles];
    }
    return self;
}

- (void)start {
    
}

- (void)tick {
    for (Turtle *t in self.turtles) {
        [t tick];
        if (t.l.y > 750) {
            t.l = ccp(t.l.x, -50);
            t.score++;
        }
    }
}

- (NSInteger)score {
    NSInteger s = 0;
    for (Turtle *t in self.turtles) {
        s+= t.score;
    }
    return s;
}

- (void)addTouch:(CGPoint)l {
    if (l.x < 512 && l.y < 384) {
        [self.turtles[0] touchDown];
    } else if (l.x < 512 && l.y > 384) {
        [self.turtles[1] touchDown];
    } else if (l.x > 512 && l.y < 384) {
        [self.turtles[2] touchDown];
    } else if (l.x > 512 && l.y > 384) {
        [self.turtles[3] touchDown];
    }

}

- (void)endTouch:(CGPoint)l {
    if (l.x < 512 && l.y < 384) {
        [self.turtles[0] touchUp];
    } else if (l.x < 512 && l.y > 384) {
        [self.turtles[1] touchUp];
    } else if (l.x > 512 && l.y < 384) {
        [self.turtles[2] touchUp];
    } else if (l.x > 512 && l.y > 384) {
        [self.turtles[3] touchUp];
    }
}

@end
