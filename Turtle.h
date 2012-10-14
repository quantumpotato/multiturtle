//
//  Turtle.h
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TurtleState.h"
#import "FloatingState.h"

@interface Turtle : NSObject

@property (nonatomic) CGPoint l;
@property (nonatomic) float speed;
@property (strong, nonatomic) CCSprite *sprite;
@property (strong, nonatomic) TurtleState *state;
@property (strong, nonatomic) FloatingState *floating;
@property (nonatomic) NSInteger charge;
@property (readonly, nonatomic) NSInteger maxCharge;

- (void)changeState:(TurtleState *)s;

@end
