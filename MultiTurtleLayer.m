//
//  MultiTurtleLayer.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "MultiTurtleLayer.h"

@implementation MultiTurtleLayer
@synthesize gc = _gc;
@synthesize scoreLabel = _scoreLabel;
@synthesize timer = _timer;

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	MultiTurtleLayer *layer = [MultiTurtleLayer node];
	[scene addChild:layer];
	return scene;
}

- (id)init {
    self = [super init];
    if (self) {
        self.gc = [[MTGameController alloc] initWithLayer:self];
        [self.gc start];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(update) userInfo:nil repeats:YES];
        [self setIsTouchEnabled:YES];
        self.scoreLabel = [CCLabelTTF labelWithString:@"" fontName:@"Courier New" fontSize:23];
        self.scoreLabel.position =  ccp(514,700);
        [self.scoreLabel setAnchorPoint:ccp(0,0)];
        [self addChild:self.scoreLabel];
    }
    return self;
}

- (void)update {
    [self.gc tick];
    self.scoreLabel.string = [NSString stringWithFormat:@"%d", [self.gc score]];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    [self.gc addTouch:[touch locationInView:[touch view]]];
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSArray *touchArray = [touches allObjects];
    
    for (UITouch *touch in touchArray) {
        [self.gc endTouch:[touch locationInView:[touch view]]];
    }
}


@end
