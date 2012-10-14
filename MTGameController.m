//
//  MTGameController.m
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "MTGameController.h"

@implementation MTGameController
@synthesize layer = _layer;

- (id)initWithLayer:(CCLayer *)layer {
    self = [super init];
    if (self) {
        self.layer = layer;
    }
    return self;
}

- (void)start {
    //
}

- (void)tick {
    
}

- (NSInteger)score {
    return 0;
}

- (void)addTouch:(CGPoint)l {
    
}

- (void)endTouch:(CGPoint)l {
    
}

@end
