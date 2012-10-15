//
//  Bird.h
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "cocos2d.h"
#import "Turtle.h"

@interface Bird : CCNode

@property (strong, nonatomic) CCSprite *sprite;
@property (nonatomic) CGPoint l;
@property (nonatomic) float speed;

- (void)tick;
- (void)resetForTurtle:(Turtle *)t;

@end
