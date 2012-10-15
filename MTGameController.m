//
//  MTGameController.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "MTGameController.h"
#import "Turtle.h"
#import "Bird.h"
#import "VRGeometry.h"

@implementation MTGameController
@synthesize layer = _layer;
@synthesize turtles = _turtles;
@synthesize birds = _birds;
@synthesize spawners = _spawners;
@synthesize rotatingSpawnY = _rotatingSpawnY;

- (void)setupTurtles {
    self.turtles = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        Turtle *t = [[Turtle alloc] init];
        [self.layer addChild:t];
        t.l = ccp(500 + i * 90, 0);
        t.playerNumber = i;
        [self.turtles addObject:t];
        [t release];
    }
}

- (void)setupBirds {
    self.birds = [NSMutableArray array];
    self.spawners = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        for (int ii = 0; ii < 2; ii++){
            BirdSpawner *s = [[BirdSpawner alloc] init];
            s.delegate = self;
            s.turtle = self.turtles[i];
            s.countdown *= (ii + 1);
            s.countdown += 100;
            [self.spawners addObject:s];
            [s release];
        }
    }
//    for (int i = 0; i < 4; i++) {
//        for (int ii = 0; ii < 2; ii++) {
//            Bird *b = [[Bird alloc] init];
//            [self.layer addChild:b];
//            float offX = arc4random() % 500;
//            b.turtleIndex = i;
//            offX += 600;
//            b.l = ccp(-offX - (ii*400) - (i * 400), 750 - (140 * i));
//            b.speed = 3;
//            [self.birds addObject:b];
//        }
//    }
}

- (id)initWithLayer:(CCLayer *)layer {
    self = [super init];
    if (self) {
        self.layer = layer;
        [self setupTurtles];
        [self setupBirds];
    }
    return self;
}

- (void)start {
    
}

- (void)turtleLoop {
    for (Turtle *t in self.turtles) {
        [t tick];
        if (t.l.y > 750) {
            [t scored];
        }
    }
}

- (void)birdLoop {
    NSMutableArray *finishedBirds = [NSMutableArray array];
    for (int i = 0; i < self.birds.count; i++) {
        Bird *b = self.birds[i];
        [b tick];
        if (b.l.x > 1100) {
            [finishedBirds addObject:b];
        }
        
        for (Turtle *t in self.turtles) {
            if (t.playing && GetDistance(b.l, t.l) < 35) {
                [t madeMistake];
            }
        }
    }
    
    [self.birds removeObjectsInArray:finishedBirds];
}

- (void)spawnerLoop {
    for (BirdSpawner *s in self.spawners) {
        [s tick];
    }
}

- (void)tick {
    [self turtleLoop];
    [self birdLoop];
    [self spawnerLoop];
}

- (NSInteger)score {
    NSInteger s = 0;
    for (Turtle *t in self.turtles) {
        s+= t.score;
    }
    return s;
}

- (void)spawnBirdForTurtle:(Turtle *)turtle withSpeed:(float)speed {
    float height = self.rotatingSpawnY + 200;
    height += arc4random() % 50;
    if (height > 500) {
        height -= 500;
    }
    height += 200;
    self.rotatingSpawnY+= 100;
    if (self.rotatingSpawnY > 600) {
        self.rotatingSpawnY -= 600;
    }
    
    Bird *b = [[Bird alloc] init];
    NSInteger x = arc4random() % 700;
    NSInteger xo = turtle.score;
    if (xo > 150) {
        xo = 150;
    }
    x+= 150 - (xo * 15);
    b.l = ccp(-x, height);
    b.speed = speed;
    [self.layer addChild:b];
    [self.birds addObject:b];
    [b release];
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
