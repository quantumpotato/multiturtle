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
        
        float speed = 1 + .5 * randomizer;
        if (speed > 8) {
            speed = 8;
        }
        [self.delegate spawnBirdForTurtle:self.turtle withSpeed:speed];
        NSInteger countDownReduction = self.turtle.score;
        countDownReduction *= 20;
        if (countDownReduction > 800) {
            countDownReduction = 800;
        }
        if (countDownReduction < 2) {
            countDownReduction = 2;
        }
        NSInteger countDownRandom = arc4random() % countDownReduction;
        self.countdown = 1000 - countDownRandom;
    }
}

- (void)dealloc {
    [_turtle release];
    self.delegate = nil;
    [super dealloc];
}

@end
