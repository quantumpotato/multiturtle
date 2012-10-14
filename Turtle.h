//
//  Turtle.h
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Turtle : NSObject

@property (nonatomic) CGPoint l;
@property (nonatomic) float speed;
@property (strong, nonatomic) CCSprite *sprite;


@end
