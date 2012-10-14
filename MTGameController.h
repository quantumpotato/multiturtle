//
//  MTGameController.h
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MTGameController : NSObject

@property (strong, nonatomic) CCLayer *layer;

- (void)start;
- (void)tick;
- (void)addTouch:(CGPoint)l;
- (void)endTouch:(CGPoint)l;
- (NSInteger)score;

- (id)initWithLayer:(CCLayer *)layer;

@end
