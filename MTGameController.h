//
//  MTGameController.h
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BirdSpawner.h"

@interface MTGameController : NSObject <BirdSpawnerDelegate>

@property (strong, nonatomic) CCLayer *layer;
@property (strong, nonatomic) NSMutableArray *turtles;
@property (strong, nonatomic) NSMutableArray *birds;
@property (strong, nonatomic) NSMutableArray *spawners;
@property (nonatomic) NSInteger rotatingSpawnY;

- (void)start;
- (void)tick;
- (void)addTouch:(CGPoint)l;
- (void)endTouch:(CGPoint)l;
- (NSInteger)score;

- (id)initWithLayer:(CCLayer *)layer;

@end
