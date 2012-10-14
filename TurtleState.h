//
//  TurtleState.h
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import <Foundation/Foundation.h>

@class Turtle;

@interface TurtleState : NSObject

@property (strong, nonatomic) Turtle *turtle;

- (void)tick;
- (float)speed;

- (id)initWithTurtle:(Turtle *)turtle;

@end
