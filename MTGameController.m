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
        [self.layer addChild:t.sprite];
        t.l = ccp((i + 1) * 200, 0);
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
    float distance = 1000;
    Turtle *tt = nil;
    for (Turtle *t in self.turtles) {
        float testDist = fabsf(l.x - t.l.x);
        if (testDist < distance) {
            distance = testDist;
            tt = t;
        }
    }
    [tt touchDown];
}

- (void)endTouch:(CGPoint)l {
    float distance = 1000;
    Turtle *tt = nil;
    for (Turtle *t in self.turtles) {
        float testDist = fabsf(l.x - t.l.x);
        if (testDist < distance) {
            distance = testDist;
            tt = t;
        }
    }
    [tt touchUp];
}

@end
