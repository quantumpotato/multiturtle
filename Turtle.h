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
#import "ChargingState.h"
#import "BoostingState.h"

@interface Turtle : NSObject

@property (nonatomic) CGPoint l;
@property (nonatomic) float speed;
@property (strong, nonatomic) CCSprite *sprite;
@property (strong, nonatomic) TurtleState *state;
@property (strong, nonatomic) FloatingState *floating;
@property (strong, nonatomic) ChargingState *charging;
@property (strong, nonatomic) BoostingState *boosting;
@property (nonatomic) NSInteger charge;
@property (readonly, nonatomic) NSInteger maxCharge;
@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger mistakes;
@property (strong, nonatomic) CCSprite *cloud;

- (void)tick;
- (void)changeState:(TurtleState *)s;
- (void)touchUp;
- (void)touchDown;

@end
