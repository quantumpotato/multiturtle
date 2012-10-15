//
//  BirdSpawner.h
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import <UIKit/UIKit.h>
#import "Turtle.h"
#import "Bird.h"

@protocol BirdSpawnerDelegate;

@interface BirdSpawner : NSObject

@property (strong, nonatomic) Turtle *turtle;
@property (nonatomic) NSInteger countdown;
@property (assign, nonatomic) id <BirdSpawnerDelegate> delegate;

- (void)tick;

@end

@protocol BirdSpawnerDelegate <NSObject>

- (void)spawnBirdForTurtle:(Turtle *)turtle withSpeed:(float)speed;

@end