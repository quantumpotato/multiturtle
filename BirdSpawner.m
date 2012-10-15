//
//  BirdSpawner.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "BirdSpawner.h"

@implementation BirdSpawner
@synthesize turtle = _turtle;
@synthesize countdown = _countdown;
@synthesize delegate;

- (id)initWithTurtle:(Turtle *)turtle {
    self = [super init];
    if (self){
        self.turtle = turtle;
        self.countdown = arc4random() % 200;
    }
    return self;
}

- (void)tick {
    self.countdown--;
    if (self.countdown <= 0) {
        float s = self.turtle.score / 2;
        s = floorf(s);
        if (s < 2) {
            s = 2;
        }
        
        NSInteger randomizer = arc4random() % (NSInteger)s;
        randomizer += s;
        float speed = 2 + randomizer;
        [self.delegate spawnBirdForTurtle:self.turtle withSpeed:speed];
        self.countdown = 150;
    }
}

- (void)dealloc {
    [_turtle release];
    self.delegate = nil;
    [super dealloc];
}

@end
